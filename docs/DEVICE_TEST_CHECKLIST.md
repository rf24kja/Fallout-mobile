# Device Test Checklist

## Current Status

**Physical Device Testing: PENDING** - No physical ARM64 Android device connected.

**Emulator Testing: BLOCKED** - Only x86_64 emulator available, APK contains arm64-v8a native libraries only.

## Available Test Environment

| Device | Architecture | API Level | Status |
|--------|-------------|-----------|--------|
| emulator-5554 (sdk_phone64_x86_64) | x86_64 | 34 | Running but incompatible with arm64 APK |

## Required for Testing

To perform physical device testing, need:
- Physical Android device with ARM64 (arm64-v8a) architecture
- Android 11+ (API 30+) recommended
- USB debugging enabled
- Device authorized via ADB

## ADB Commands for Physical Device Testing

```bash
# Check connected devices
adb devices -l

# Install debug APK
adb install -r builds/android/Wasteland_RPG_Prototype_Debug.apk

# Launch app
adb shell monkey -p asia.go24.wastelandprototype -c android.intent.category.LAUNCHER 1

# View logs
adb logcat -s Godot:V *:S

# Test specific scenarios:
# 1. Cold start
# 2. Main menu navigation
# 3. Touch movement
# 4. NPC interaction
# 5. Dialogue system
# 6. Inventory management
# 7. Combat encounter
# 8. Save/Load
# 9. Background/Resume
# 10. Orientation changes
```

## Test Scenarios to Execute

### Startup & Basic Navigation
- [ ] App launches without crash
- [ ] Main menu displays correctly
- [ ] Text is readable at various DPI
- [ ] Buttons respond to touch

### World Exploration
- [ ] Touch movement works
- [ ] Camera follows player
- [ ] NPC interaction triggers dialogue

### Dialogue System
- [ ] Dialogue UI displays correctly
- [ ] Options selectable via touch
- [ ] Text scrolling works
- [ ] Dialogue conditions/consequences work

### Inventory
- [ ] Inventory opens/closes
- [ ] Items display with icons
- [ ] Stacking works
- [ ] Drag-drop or tap interactions work

### Combat
- [ ] Combat transition works
- [ ] Turn order displays
- [ ] AP system visible
- [ ] Attack/Action buttons work
- [ ] Target selection works
- [ ] Combat log readable
- [ ] Victory/Defeat handled

### Persistence
- [ ] Save creates file
- [ ] Load restores state
- [ ] Multiple save slots work

### Android Lifecycle
- [ ] Home button -> resume works
- [ ] Back button handled correctly
- [ ] Orientation change handled
- [ ] Screen off/on handled

## Known Issues to Verify

1. **Package Name**: APK shows `com.example.wastelandrpgprototype` instead of `asia.go24.wastelandprototype` - may affect save data migration
2. **Architecture**: Only arm64-v8a native libs - requires ARM64 device
3. **Icons**: Placeholder 1x1 PNG icons - adaptive icon may not display correctly
4. **Textures**: ETC2/ASTC compression enabled - verify on various GPUs

## Next Steps

1. Obtain physical ARM64 Android device
2. Enable USB debugging
3. Run through full checklist
4. Document any crashes/bugs
5. Fix critical issues before release build

---

*Last updated: 2026-10-21*