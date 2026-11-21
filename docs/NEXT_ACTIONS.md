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

| ID | Task | Description | Blocked By | Status |
|----|------|-------------|------------|--------|
| P1-1 | **Update FIDELITY_MATRIX** | Document REA verification for all P0 systems with evidence | None | ✅ **COMPLETE** |
| P1-2 | **Verify SPECIAL Calculations** | REA analysis of derived stats formulas → compare Godot implementation | P1-1 | ✅ **COMPLETE** (69 tests PASS) |
| P1-3 | **Verify Combat AP Costs** | REA extraction of weapon AP costs → compare Godot combat.gd | P1-1 | ✅ **COMPLETE** (26 tests PASS) |
| P1-4 | **Verify DT/DR Damage** | REA damage formula → compare Godot damage calculation | P1-1 | ✅ **COMPLETE** (25 tests PASS, vanilla-corrected) |
| P1-5 | **Verify Critical Tables** | REA critical hit tables → compare Godot critical system | P1-1 | 🟡 In Progress |

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

## Current Sprint Focus (Week of 2026-11-10)

### Primary Goal: **Fidelity Verification + Quest System Completion**

```
[✅] P0-1: Clone recovery test (COMPLETE - 2026-11-09)
[✅] P0-2: Release keystore generation + APK build + verify (COMPLETE - manual apksigner workaround)
[✅] P0-3: GitHub sync + LFS migration (COMPLETE - 2026-11-09)
[✅] P1-1: Update FIDELITY_MATRIX with current REA evidence (COMPLETE - 2026-11-10)
[✅] P1-3: Verify Combat AP Costs (COMPLETE - 2026-11-10, 26 tests PASS)
[✅] P1-2: Verify SPECIAL Calculations (COMPLETE - 2026-11-10, 69 tests PASS)
[✅] P1-4: Verify DT/DR Damage (COMPLETE - 2026-11-10, 25 tests PASS, vanilla-corrected)
[ ] P1-5: Verify Critical Tables (2 hrs)
[ ] P2-1: Complete Quest System Arroyo→Klamath (1 week)
```

### Success Criteria for This Sprint
- ✅ Fresh clone builds and runs without manual intervention
- ✅ Release APK installs and passes `apksigner verify`
- ✅ GitHub repository clean (LFS for large binaries, no files > 100MB)
- [ ] FIDELITY_MATRIX documents all P0 system verifications
- [ ] DEVELOPMENT_HISTORY documents major milestones
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
---

## Current — RADZONE Inventory Icons (2026-11-17)

**Done (branch `feature/inventory-radzone-icons`)**
- 7 items mapped to real RADZONE PNGs via `icon_path` (see
  `artifacts/qa/inventory_radzone/README.md` for the mapping and the gap list).
- Fixed `.tscn` `add_theme_*_override(...)` method-call syntax (77 lines, 6 scenes) —
  it silently swallowed the following `[node]` header, so `inventory_ui.tscn` lost 8 of
  17 nodes at load. Regression test `scripts/tests/test_scene_parse_integrity.gd`.
- Fixed inert `anchors_preset` in `scenes/ui/inventory_ui.tscn` (12 nodes) — the panel
  was 0x0 and the clipped grid rendered nothing.
- Fixed `TextureButton.ignore_texture_size` in `scripts/ui/inventory_ui.gd` — icons
  rendered at native resolution and overflowed the grid cell.
- Fixed the stack amount label anchoring (was outside the button).
- Real in-game captures committed under `artifacts/qa/inventory_radzone/`.

**Next actions (priority order)**

| ID | Task | Notes |
|----|------|-------|
| A-1 | **PR + merge `feature/inventory-radzone-icons`** | ✅ PR #36 open: https://github.com/rf24kja/Fallout-mobile/pull/36 (head `a569163`, base `master`). Merge pending owner review |
| A-2 | **Materialise `anchor_*` in the remaining 8 scenes** | ✅ DONE (branch `fix/ui-anchor-presets`, PR #38). 47 nodes across 8 scenes: `ui/called_shot_panel.tscn` (16), `ui/combat_hud.tscn` (10), `ui/combat_ui.tscn` (8), `ui/dialogue_ui.tscn` (4), `ui/quest_log.tscn` (3), `world/test_map.tscn` (4), `entities/npc.tscn` (1), `entities/world_item.tscn` (1). `main_menu.tscn` was verified clean (no inert anchors). Also fixed 26 parent paths in combat_hud/quest_log and added `unique_name_in_owner=true` to 15 nodes in called_shot_panel.tscn. Test `scripts/tests/test_ui_layout_integrity.gd`: CHECKS=72, FAILURES=0, RESULT: ALL PASS. Merge pending owner review: https://github.com/rf24kja/Fallout-mobile/pull/38 |
| A-3 | **Audit `anchors_preset` values against intent** | The preset numbers in the `.tscn` files do not match the offsets' intent; treat them as unreliable and derive anchors from offsets only. |
| A-4 | **Assign the unambiguous remaining RADZONE crops** | `medkit`, `stim_injector`, `pistol`, `pistol_ammo`, `shotgun_shells`, `wrench`, `heavy_revolver`, `compact_submachine_gun`, `scavenged_medicine_bottles`, `patched_leather_coat`, `helmet_with_goggles` — needs an owner decision per crop; do not guess. |
| A-5 | **Resolve the duplicate object** | `wave09_unique/objects/salvaged_surgical_tools.png` and `wave12/objects/surgical_tool_roll_256.png` look identical — one object, two IDs, violating the "one object = one ID" rule. |
| A-6 | **Wave13 preview + QA review** | Check `art/radzone-wave13-settlement-props` preview scene and its QA report; prepare visual evidence for a merge decision. Do NOT merge automatically. |
| A-7 | **Android validation of the inventory** | Real device capture; do not claim Android validation without runtime proof. |
