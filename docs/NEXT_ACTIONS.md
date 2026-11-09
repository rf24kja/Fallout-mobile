# NEXT ACTIONS — Fallout 2 Reborn Mobile

**Priority Order**: P0 (Critical) → P1 (High) → P2 (Medium) → P3 (Low)

---

## P0 — Project Integrity & Recovery (Immediate)

| ID | Task | Description | Blocked By | Status |
|----|------|-------------|------------|--------|
| P0-1 | **Validate GitHub Recovery** | Clone repo to fresh dir → run RECOVERY_GUIDE checks → document results | None | ✅ **COMPLETE** |
| P0-2 | **Configure Release Keystore** | Generate local release.keystore → update export_presets.cfg (local) → build Release APK | P0-1 | ✅ **COMPLETE** (manual apksigner workaround) |
| P0-3 | **Verify Release APK** | `apksigner verify` → install on device → test runtime | P0-2 | ✅ **COMPLETE** |

---

**Recovery Test Result (2026-11-09)**: ✅ Fresh clone at `C:\Code\Fallout2_Reborn_Mobile_RecoveryTest` opened in Godot 4.7.2 without parse errors. Main menu loads, ItemDatabase initializes, DialogueManager connects to EventBus. Only expected runtime warning: "InteractionManager: player not found" (scene not loaded in headless check).

**Release Build Result (2026-11-09)**: ✅ `Fallout2_Reborn_Mobile_Release_signed.apk` (124MB) verified with `apksigner`. Signed with release keystore (CN=Fallout 2 Reborn, OU=Development, O=RF24KJA). All 4 architectures included. Note: Godot export still fails to sign release APK directly — manual `apksigner` workaround used.

---

## P1 — Core Fidelity Verification (This Week)

| ID | Task | Description | Blocked By |
|----|------|-------------|------------|
| P1-1 | **Update FIDELITY_MATRIX** | Document REA verification for all P0 systems with evidence | None |
| P1-2 | **Verify SPECIAL Calculations** | REA analysis of derived stats formulas → compare Godot implementation | P1-1 |
| P1-3 | **Verify Combat AP Costs** | REA extraction of weapon AP costs → compare Godot combat.gd | P1-1 |
| P1-4 | **Verify DT/DR Damage** | REA damage formula → compare Godot damage calculation | P1-1 |
| P1-5 | **Verify Critical Tables** | REA critical hit tables → compare Godot critical system | P1-1 |

---

## P2 — Gameplay Systems Completion (Next 2 Weeks)

| ID | Task | Description | Blocked By |
|----|------|-------------|------------|
| P2-1 | **Complete Quest System** | Implement quest stages, objectives, world state for Arroyo→Klamath | P1-1 |
| P2-2 | **World Map Travel** | Travel speed, random encounters, location discovery | P2-1 |
| P2-3 | **NPC Schedules/Behavior** | Day/night cycles, faction AI, companion commands | P2-1 |
| P2-4 | **Save/Load Migration** | Version handling, backward compatibility testing | P2-1 |
| P2-5 | **Inventory Polish** | Stack splitting, quick-equip, compare tooltips | P2-1 |

---

## P3 — Mobile UX & Polish (Ongoing)

| ID | Task | Description | Blocked By |
|----|------|-------------|------------|
| P3-1 | **Touch Combat Controls** | Aimed shot selection, target cycling, AP display | P2-2 |
| P3-2 | **UI Responsiveness** | Safe areas, orientation, text scaling, accessibility | P2-2 |
| P3-3 | **Performance Profile** | 60 FPS target, memory < 500MB, battery optimization | P2-2 |
| P3-4 | **Tutorial/Onboarding** | First-run guidance, control hints | P3-1 |
| P3-5 | **Settings Menu** | Graphics, audio, controls, gameplay options | P3-2 |

---

## P4 — Graphics & Content (After Baseline Stable)

| ID | Task | Description | Blocked By |
|----|------|-------------|------------|
| P4-1 | **Character Animation System** | 8-directional isometric, combat states, transitions | P3-3 |
| P4-2 | **Combat VFX** | Muzzle flash, impact, blood, critical indicators | P4-1 |
| P4-3 | **Environment Art** | Tilesets, props, lighting, weather | P4-1 |
| P4-4 | **New Content** | Weapons, quests, locations, companions | P4-1 |

---

## Current Sprint Focus (Week of 2026-11-09)

### Primary Goal: **Release Build + Fidelity Verification**

```
[✅] P0-1: Clone recovery test (COMPLETE - 2026-11-09)
[ ] P0-2: Release keystore generation (15 min)
[ ] P0-3: Release APK build + verify (30 min)
[ ] P1-1: Update FIDELITY_MATRIX with current REA evidence (2 hrs)
```

### Success Criteria for This Sprint
- ✅ Fresh clone builds and runs without manual intervention
- [ ] Release APK installs and passes `apksigner verify`
- [ ] FIDELITY_MATRIX documents all P0 system verifications
- [ ] All documentation pushed to GitHub

---

## Commands Reference

```bash
# Quick status check
git status && git log -3 --oneline

# Recovery validation
cd /tmp && git clone https://github.com/rf24kja/Fallout-mobile.git test_recovery && cd test_recovery && godot --path . --check-only

# Build debug APK
godot --headless --export-debug "Android" builds/android/Fallout2_Reborn_Mobile_Debug.apk

# Verify APK
apksigner verify --print-certs builds/android/Fallout2_Reborn_Mobile_Debug.apk

# Install to device
adb install -r builds/android/Fallout2_Reborn_Mobile_Debug.apk

# View logs
adb logcat -s Godot

# Push docs
git add docs/ README.md AGENTS.md && git commit -m "docs: update project documentation" && git push
```

---

## Notes

- **Never skip P0** — recovery must work before new features
- **Fidelity first** — REA verification before implementation
- **One task at a time** — complete verification before moving on
- **Document as you go** — update FIDELITY_MATRIX and PROJECT_STATE immediately