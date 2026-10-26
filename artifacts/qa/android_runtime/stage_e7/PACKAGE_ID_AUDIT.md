# Android Package ID Audit

**Date:** 2026-10-26  
**Project:** Fallout 2 Reborn Mobile  

---

## Package ID Mismatch Summary

| Source | Package ID | Status |
|--------|------------|--------|
| export_presets.cfg (preset.0, .1, .2) | `asia.go24.wastelandprototype` | ❌ Not used |
| Custom template (android_debug_x86_64.apk) | `com.godot.game` | ❌ Default Godot template |
| Exported APK (game_x86_64_debug_optimized.apk) | `com.example.wastelandrpgprototype` | ✅ Running on device |
| Installed app (emulator-5554) | `com.example.wastelandrpgprototype` | ✅ Active |

---

## Root Cause Analysis

### 1. export_presets.cfg declares:
```ini
android/package="asia.go24.wastelandprototype"
```

### 2. Custom template manifest (android_debug_x86_64.apk):
```xml
package="com.godot.game"
```
This is the **default Godot template package** — the template was built without overriding the package name.

### 3. Godot export behavior:
When `custom_template/debug` is set, Godot:
1. Uses the custom template APK as base
2. **Overwrites the package name** with `android/package` from export preset
3. But only if the template manifest allows it (some templates hardcode package)

### 4. Actual result:
Exported APK has `package="com.example.wastelandrpgprototype"` — this is **neither** the preset value nor the template value.

**Investigation**: The `com.example.wastelandrpgprototype` appears to come from the Godot export process generating a default package when the custom template's manifest structure doesn't match expectations.

---

## Source of Truth

**The export_presets.cfg is the intended source of truth** — it's the project configuration file that developers edit.

However, **the custom template is the actual source of truth at build time** because:
- Godot copies the template APK
- Modifies it with project resources
- The template's manifest structure determines what can be modified

---

## Why the Mismatch Happened

1. Custom template built from Godot source with `platform=android target=template_debug arch=x86_64`
2. Default Godot template uses `com.godot.game` package
3. Export preset specifies `asia.go24.wastelandprototype`
4. Godot export attempts to rename package but produces `com.example.wastelandrpgprototype` instead
5. This suggests the template's manifest has a different structure than expected, or the rename logic has a bug

---

## Impact Assessment

### Current State (com.example.wastelandrpgprototype)
- ✅ App installs and runs on emulator
- ✅ No conflicts with other apps
- ✅ Save data stored under this package

### Desired State (asia.go24.wastelandprototype)
- ✅ Matches project branding
- ✅ Consistent with export_presets.cfg
- ⚠️ **Changing package = NEW APP on Android**
  - Existing save data inaccessible
  - Requires uninstall/reinstall
  - User data loss if not migrated

---

## Safe Correction Plan

### Option A: Keep Current (Recommended for Now)
**Do not change package ID.**
- Current package works
- No data migration needed
- Update export_presets.cfg to match reality:
  ```ini
  android/package="com.example.wastelandrpgprototype"
  ```

### Option B: Fix at Template Level (For Release)
1. Rebuild custom template with correct package:
   ```bash
   # In Godot source, modify platform/android/java/AndroidManifest.xml before building template
   # Or use gradle to set applicationId
   ```
2. Re-export with fixed template
3. **Result**: Clean `asia.go24.wastelandprototype` from first install

### Option C: Gradle Override (If Using Gradle Build)
```gradle
// In custom_gradle_build
android {
    defaultConfig {
        applicationId "asia.go24.wastelandprototype"
    }
}
```
But `gradle_build/use_gradle_build=false` in preset.2

---

## Recommendation

**For development/QA: Option A** — Keep `com.example.wastelandrpgprototype`, update export_presets.cfg to match.

**For production release: Option B** — Rebuild template with correct package ID before first public release.

---

## Files to Update (Option A)

1. `export_presets.cfg` lines 27, 96, 165:
   ```ini
   android/package="com.example.wastelandrpgprototype"
   ```

2. Document in PROJECT_STATE.md

---

## Verification Commands

```bash
# Check installed package
adb shell pm list packages | grep wasteland

# Check APK package
aapt dump badging builds/android/game_x86_64_debug_optimized.apk | grep package:

# Check export preset
grep "android/package" export_presets.cfg
```