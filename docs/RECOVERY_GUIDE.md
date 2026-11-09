# RECOVERY GUIDE — Fallout 2 Reborn Mobile

## Purpose
Complete instructions to recover this project from GitHub if the local workspace, OpenCode installation, or development machine becomes unavailable.

---

## 1. Repository Clone

```bash
git clone https://github.com/rf24kja/Fallout-mobile.git Fallout2_Reborn_Mobile
cd Fallout2_Reborn_Mobile
```

**Expected result**: Complete source code, documentation, and Godot project structure. No build artifacts, APKs, or original game data.

---

## 2. Required Software

| Tool | Version | Install Method |
|------|---------|----------------|
| **Godot Engine** | 4.7.2 (standard) | https://godotengine.org/download |
| **Android SDK** | API 31+ (Command Line Tools) | https://developer.android.com/studio#command-tools |
| **Java JDK** | 17+ (Temurin/Eclipse Adoptium) | https://adoptium.net/ |
| **Git** | 2.40+ | https://git-scm.com/ |
| **ADB** | Platform-tools | Included in Android SDK |

### Android SDK Setup (Windows)
```powershell
# Set environment variables
$env:ANDROID_HOME = "C:\Android\Sdk"
$env:PATH += ";$env:ANDROID_HOME\platform-tools;$env:ANDROID_HOME\cmdline-tools\latest\bin"

# Accept licenses
yes | sdkmanager --licenses

# Install required packages
sdkmanager "platforms;android-34" "build-tools;34.0.0" "platform-tools" "cmdline-tools;latest"
```

### Godot Export Templates
1. Open Godot 4.7.2
2. Editor → Manage Export Templates → Download and Install (4.7.2 stable)
3. Or: `godot --headless --export-release "Android" dummy.apk` (auto-downloads)

---

## 3. Original Fallout 2 Installation (Reference Only)

**Required for reverse engineering and mechanics verification only.**

1. Obtain legitimate Fallout 2 installation (GOG/Steam/original CD)
2. Install to `C:\Code\REA_FALLOUT\Fallout2` (or any path)
3. Update Godot project settings if path differs:
   - Project → Project Settings → `fallout2/install_path`

**NOT included in GitHub**. The project builds and runs without it (placeholder data used).

---

## 4. Git LFS (If Used)

Currently **not configured**. If large binary assets are added later:

```bash
git lfs install
git lfs track "*.blend" "*.psd" "*.kra" "*.ora" "*.aseprite"
git add .gitattributes
```

---

## 5. Local Configuration (Not in Git)

Create these files locally after clone:

### `export_presets.cfg` — Release Keystore
The repo includes **debug keystore only** (standard Android debug cert).
For release builds, create local `export_presets.cfg` override or configure in Godot:
```
[preset.0]
name="Android Release"
platform="Android"
runnable=true
keystore/release="user://release.keystore"
keystore/release_password="**local only**"
keystore/release_key_password="**local only**"
```

### `local.properties` (Android SDK path)
```
sdk.dir=C:\\Android\\Sdk
```

---

## 6. Verify Recovery

### Step 1: Open in Godot
```bash
godot --path . --check-only
# Should exit with code 0, no errors
```

### Step 2: Run Source Validation
```bash
godot --headless --script tests/validate_project.gd
# (Create this script if needed — checks scenes, scripts, resources load)
```

### Step 3: Build Debug APK
```bash
godot --headless --export-debug "Android" builds/android/Fallout2_Reborn_Mobile_Debug.apk
```

### Step 4: Verify APK
```bash
apksigner verify --print-certs builds/android/Fallout2_Reborn_Mobile_Debug.apk
# Should show: CN=Android Debug, O=Android, C=US
```

### Step 5: Install & Test (Requires Device)
```bash
adb install -r builds/android/Fallout2_Reborn_Mobile_Debug.apk
adb logcat -s Godot
# Launch app, verify main menu appears, tap to enter gameplay
```

---

## 7. Expected Verification Results

| Check | Expected Result |
|-------|-----------------|
| `godot --check-only` | Exit 0, no errors |
| Project opens in Editor | All scenes load, no missing resources |
| Debug APK builds | ~50-100MB APK produced |
| `apksigner verify` | Shows debug certificate |
| APK installs on device | `Success` |
| App launches | Main menu → gameplay transition works |
| Touch controls respond | Movement, UI interaction functional |

---

## 8. Known External Dependencies

| Dependency | Status | Recovery Action |
|------------|--------|-----------------|
| Godot 4.7.2 export templates | Not in repo | Auto-download on first export |
| Android SDK build-tools | Not in repo | Install via `sdkmanager` |
| Java 17+ | Not in repo | Install JDK |
| Original Fallout 2 data | Not in repo | Install separately for RE |
| Release keystore | Not in repo | Generate locally (`keytool`) |

---

## 9. For AI Agents Resuming Development

### Immediate Context (Read These First)
1. `AGENTS.md` — This file's rules and paths
2. `docs/PROJECT_MANDATE.md` — Non-negotiable requirements
3. `docs/PROJECT_STATE.md` — Current verified status
4. `docs/NEXT_ACTIONS.md` — Prioritized work queue
5. `docs/FALLOUT2_FIDELITY_MATRIX.md` — Mechanics verification

### Resume Commands
```bash
# 1. Check Git state
git status
git log -5 --oneline

# 2. Verify last working commit
git show --stat HEAD

# 3. Open Godot and verify
godot --path . --check-only

# 4. Check latest APK
ls -la builds/android/

# 5. Read current state
cat docs/PROJECT_STATE.md
cat docs/NEXT_ACTIONS.md
```

### Development Cycle
```
Inspect → Implement → Test → Commit → Push → Verify Remote
```

---

## 10. Troubleshooting

### Godot: "Project not found" or import errors
- Ensure you opened the **project folder** (containing `project.godot`), not parent directory
- Run `godot --path . --check-only` for diagnostics

### Android Export: "No export template"
- Editor → Manage Export Templates → Download 4.7.2
- Or run export command once (auto-downloads)

### APK: `apksigner` not found
- Add Android SDK `build-tools/34.0.0` to PATH
- Or use full path: `$ANDROID_HOME/build-tools/34.0.0/apksigner`

### Build: "Keystore not found" (Release)
- Debug builds use included debug keystore
- Release builds require local keystore configuration (see Section 5)

### Git: "Authentication failed"
- Use GitHub CLI: `gh auth login`
- Or HTTPS with Personal Access Token (store in credential manager)

---

## 11. Recovery Validation Checklist

- [ ] Repository cloned successfully
- [ ] Godot 4.7.2 opens project without errors
- [ ] Debug APK builds successfully
- [ ] APK signature verifies (debug cert)
- [ ] APK installs on Android device/emulator
- [ ] App launches to main menu
- [ ] Touch interaction works (tap → gameplay)
- [ ] All documentation files present in `docs/`
- [ ] `PROJECT_STATE.md` reflects known status
- [ ] `NEXT_ACTIONS.md` has actionable queue

**If any check fails**: Document the failure and which external dependency is missing. The project is **partially recoverable** until all checks pass.

---

## 12. Support Contacts

- **GitHub Issues**: https://github.com/rf24kja/Fallout-mobile/issues
- **Repository Owner**: rf24kja

---

*Last validated: 2026-11-09 (Commit 16a893b)*