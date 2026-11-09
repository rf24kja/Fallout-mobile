# Fallout 2 Reborn Mobile — Project State (Mobile Project)

## Project Objective (CORRECTED 2026-11-09)

**Build a faithful mobile adaptation of the ORIGINAL FALLOUT 2 using Godot 4.7.2.**

- Preserve all original Fallout 2 mechanics: SPECIAL, character creation, traits, perks, skills, leveling
- Preserve original combat mechanics: AP, DT/DR, critical hits, aimed attacks
- Preserve original items, weapons, armor, ammunition and their statistics
- Preserve original NPC interaction, dialogue, quests, locations, reputation, factions, companions
- Preserve original save/load behavior
- Allowed improvements: graphical modernization, mobile UI/UX, touch controls, performance optimization, new content extending the original foundation

See root `C:\Code\REA_FALLOUT\PROJECT_STATE.md` for complete project state including REA tooling.

---

## Mobile Project Status

| Component | Status | Details |
|-----------|--------|---------|
| Godot Version | OK | 4.7.2.stable |
| Export Templates | OK | 4.7.2.stable at `%APPDATA%\Godot\export_templates\4.7.2.stable\` |
| Android SDK | OK | Platform 36, Build-Tools 36.0.0, NDK 25.1 |
| Debug APK | OK | `builds/fallout2_reborn_debug.apk` (37.1MB, rebuilt 2026-10-23) |
| Release APK | OK (manual) | `Fallout2_Reborn_Mobile_Release_signed.apk` (124MB) verified with apksigner |
| Package ID | OK | `com.example.wastelandrpgprototype` (Godot export preset: `asia.go24.wastelandprototype`) |
| App Label | OK | "Wasteland RPG Prototype" |
| Keystore (Debug) | OK | `keystore/debug.keystore` |
| Keystore (Release) | OK | `keystore/release_jks.keystore` (JKS, alias=release) |

---

## Test Results (2026-11-09 — Current Session)

| Suite | Tests | Pass | Fail | Timeout |
|-------|-------|------|------|---------|
| Stage B | 11 | 11 | 0 | 0 |
| Stage C | 21 | 21 | 0 | 0 |
| XP Progression | 41 | 41 | 0 | 0 |
| **Total** | **73** | **73** | **0** | **0** |

**Full Vertical Slice Playthrough**: PASS (level persistence fixed)
**CombatHUD headless compatibility**: PASS (null node refs fixed)
**Save/load migration v1→v2**: PASS (4 tests)
**All parse errors**: RESOLVED
**XP Progression (Fallout 2 fidelity)**: PASS (41 tests - levels 1-25, boundaries, level-ups, save/load)

---

## Design Documents (in `docs/`)

- FALLOUT2_FIDELITY_MATRIX.md
- DEVELOPMENT_HISTORY.md
- SYSTEM_FIDELITY.md
- SYSTEM_AUDIT.md
- ITEM_BALANCE_MATRIX.md
- QUEST_DESIGN_PRINCIPLES.md
- VISUAL_DIRECTION.md
- STAGE_D_EXECUTION.md
- NEXT_ACTIONS.md
- BRANDING_AND_IP.md
- DEVICE_TEST_CHECKLIST.md
- PERFORMANCE_BASELINE.md
- STAGE_D_PROPOSAL.md
- GAME_VISION.md (SUPERSEDED by PROJECT_MANDATE.md)

---

## Completed This Session (2026-11-09)

### GitHub Integration & Project Recovery ✅
- Repository connected: https://github.com/rf24kja/Fallout-mobile
- Initial publication: commit 16a893b (baseline)
- Documentation suite: 6 files committed (4207592)
- Git LFS migration: *.apk, *.so tracked (force push ea7cb64)
- Recovery validation: fresh clone → Godot 4.7.2 opens without parse errors
- Release build workaround: manual apksigner produces verified 124MB APK

### XP Progression Fidelity Fix ✅
- **Bug**: `xp_for_level()` used linear `level * 1000` instead of Fallout 2 cumulative quadratic
- **Fix**: Changed to `1000 * level * (level - 1) / 2` matching original Fallout 2
- **Verification**: `tests/test_xp_progression.gd` — 41 tests ALL PASS
  - Levels 1-25 exact XP thresholds (0, 1000, 3000, 6000, 10000, 15000, 21000, 28000, 36000, 45000, ...)
  - Boundary values (exact threshold, just below) verified
  - Edge cases (negative XP, zero XP) verified
  - Simulated level-up sequence 1→10 verified
  - Save/load compatibility verified

### Documentation Updates ✅
- AGENTS.md: Primary agent corrected to "Implements, tests and improves actual Godot game code"
- GAME_VISION.md: Marked SUPERSEDED by PROJECT_MANDATE.md
- RECOVERY_GUIDE.md: Git LFS status corrected (now configured)
- FALLOUT2_FIDELITY_MATRIX.md: Created with verified systems evidence
- DEVELOPMENT_HISTORY.md: Created with milestone log
- PROJECT_STATE.md: Updated with corrected objective and XP fix
- NEXT_ACTIONS.md: Updated with completed P0 tasks

---

### Technical Placeholder Assets — RETAINED FOR GAMEPLAY DEVELOPMENT

**CLASSIFICATION: TECHNICAL_PLACEHOLDER** — All visual assets below are functional pipeline outputs, not approved production artwork. They serve as technical placeholders for gameplay development only.

| Asset Category | Status | Notes |
|----------------|--------|-------|
| Base Characters (3) | TECHNICAL_PLACEHOLDER | survivor, npc_friendly, hostile — 795 frames each. Pipeline works, visual quality NOT verified for production. |
| Armor Tier Sprites (4 tiers) | TECHNICAL_PLACEHOLDER | 192 frames total. Blender pipeline functional, materials/geometry are primitive placeholders. |
| Weapon Sprites (24 x 8) | TECHNICAL_PLACEHOLDER | 192 frames. Low-poly primitive geometry, flat materials. NOT cinematic quality. |
| Environment Tiles (102) | TECHNICAL_PLACEHOLDER | Ground, Wall, Container, Debris, Road. Functional TileSets, primitive geometry/materials. |
| CharacterVisual Paperdoll | OK Functional | Layering system works correctly with placeholder assets. |
| REV2 Pistol (Rejected) | REJECTED | `production_pistol_rev2` assets moved to `artifacts/art_review/pistol/revision2/` — excluded from production APK |

**Art Direction Target**: Serious, cinematic, semi-realistic post-apocalyptic — realistic proportions, believable mechanical construction, detailed shapes/silhouettes, worn materials, physically plausible materials, consistent cinematic lighting. Avoid toy-like geometry, primitive shapes, cartoon proportions, flat placeholder materials.

**Production Art Pipeline Status**: RESTARTED — Concept phase in progress. Do not use placeholder pipeline for production assets.

### Art Production Pipeline — RESTARTED WITH PROPER CONCEPT PHASE

| Step | Action | Status |
|------|--------|--------|
| 1 | Art Direction & Reference Board | DONE — VISUAL_DIRECTION.md created |
| 2 | REV2 PRODUCTION ATTEMPT (primitive-based procedural modeling) | REJECTED — Box-like proportions, flat materials, insufficient weathering, weak gameplay visibility |
| 3 | Professional Concept Art Phase (NEW) | CONCEPT_CANDIDATE — PENDING USER APPROVAL |
| 4 | In-Game Validation of approved concept | BLOCKED |
| 5 | User Approval Gate (Concept) | PENDING — DO NOT MODEL |
| 6 | Production Modeling from approved concept | BLOCKED |
| 7 | Scale to Full Catalog (only after production model approved) | BLOCKED |

**REV2 REJECTION REASONS:**
- Primitive box-like geometry, mechanically unconvincing proportions
- Flat-looking materials without believable wear/weathering
- Mechanical details appear disconnected
- Weak detail visibility despite large Blender renders
- Almost invisible weapon in actual gameplay screenshots
- Game scene still looks like a debug grid

**NEW CONCEPT REQUIREMENTS:**
- Original post-apocalyptic sidearm design (not Fallout IP)
- Serious classic isometric RPG presentation
- Realistic mechanical silhouettes, functional industrial design
- Mature cinematic post-apocalyptic atmosphere
- Used, weathered equipment aesthetic
- Professional concept sheet: side profile, 3/4 perspective, material palette, surface wear references, major silhouette/proportions, original design identity
- Must be detailed enough to guide actual hard-surface modeling with UV unwrapping, textures, bevels, weighted normals, realistic materials

**Quality Gates (MANDATORY - no stage may be inferred from earlier):**
- TECHNICAL_PIPELINE_READY OK
- CONCEPT_APPROVED PENDING
- MODEL_REVIEWED PENDING
- GAMEPLAY_SPRITES_VALIDATED PENDING
- IN_GAME_VISUALS_VALIDATED PENDING
- MOBILE_DEVICE_VALIDATED PENDING
- PRODUCTION_ASSET_APPROVED PENDING

---

### IP Compliance — SPECIAL Attribute Rename OK COMPLETE (2026-10-23)

| Old Name (Fallout IP) | New Name (Original IP) |
|----------------------|------------------------|
| Strength | Might |
| Perception | Awareness |
| Endurance | Vigor |
| Charisma | Presence |
| Intelligence | Intellect |
| Agility | Dexterity |
| Luck | Fortune |

**Files Updated:**
- `scripts/systems/character_system.gd` — Source of truth: SPECIAL_NAMES dict, SKILL_DEFS, PERK_DEFS, _init_default_character(), _recalculate_derived_stats(), _on_level_up()
- `scripts/systems/combat_system.gd` — All combat calculations (initiative, crit, hit chance, damage)
- `scripts/core/game_manager.gd` — Player data, derived stats (HP, AP, carry weight, crit chance)
- `scripts/systems/inventory.gd` — Equipment bonuses dict
- `scripts/systems/item_definition.gd` / `item_database.gd` / `data/armor.json` — required_strength to required_might
- `scripts/systems/dialogue_manager.gd` — Dialogue condition checks
- `scripts/ui/combat_hud.gd` — Hit chance display calculations
- `tests/stage_c_test_runner.gd` — Test participant stat dictionaries

**Verification:** All 27 Godot headless tests PASS (Stage B 11/11 + Stage C 16/16). Save/load output shows new SPECIAL names in player data.

---

### Save Migration System OK COMPLETE (2026-10-23)

Implemented explicit save schema versioning and migration from v1 (old SPECIAL names) to v2 (new SPECIAL names):

- **Save version field** added to `GameManager.get_save_data()` (version 2)
- **Migration function** `_migrate_save_data()` with version checking
- **v1 to v2 migration** `_migrate_v1_to_v2()` with `special_mapping` dict
- **Deterministic precedence**: prefers old key values when both old and new keys exist
- **Idempotent**: only runs when save version < 2
- **Preserves all non-SPECIAL data**: HP, max_hp, AP, max_ap, level, XP, inventory, equipment, quests, skills, perks, radiation, poison
- **Safe handling**: malformed save data handled gracefully, never overwrites only copy

**Files Updated:**
- `scripts/core/game_manager.gd` — Added save_version, _migrate_save_data(), _migrate_v1_to_v2()
- `scripts/core/save_system.gd` — Calls migration in load_save_data()

**Tests Added (Stage C):**
- `_test_save_migration_v1_to_v2` — Tests v1 save migration with all 7 SPECIAL attributes
- `_test_save_migration_idempotent` — Verifies migration is idempotent
- `_test_save_migration_preserves_data` — Verifies non-SPECIAL data preserved
- `_test_mechanical_equivalence` — Verifies all formulas use new attribute names correctly

**Test Results:**
- Stage B: 11/11 PASS
- Stage C: 21/21 PASS (4 new migration tests + 16 existing + Full Vertical Slice Playthrough)
- **Total: 32/32 PASS**

---

## Next Actions

See `docs/NEXT_ACTIONS.md` for full execution queue.

---

## Android Runtime QA — Stage E.8 (2026-10-31)

| Component | Status | Details |
|-----------|--------|---------|
| x86_64 Export Template | OK | Custom-built `libgodot_android.so` (73 MB) from Godot 4.7.2 source |
| x86_64 APK Build | OK | `stage_e8_final_opt.apk` (41.2 MB), only x86_64 libs |
| ADB Install | OK | Success on emulator-5554 (x86_64) |
| App Launch | OK | Godot initializes cleanly, no CRASH/FATAL |
| Automated Tests (Device) | OK | 32/32 PASS (Stage B 11/11 + Stage C 21/21) |
| Shader Uniform Limit | RESOLVED | Host GPU (-gpu host) with Intel Arc translation - NO GLES3 errors |
| SpriteFrames Loading | OK | 49 animations loaded (8 dirs × 6 types + default) |
| CharacterVisual Rendering | OK | idle_S animation playing confirmed in logcat |
| Interactive Gameplay | VERIFIED | Touch interactions tested on emulator |
| Screenshots Captured | OK | 6 new screenshots in `artifacts/qa/android_runtime/stage_e8_final/` |
| Package ID | FIXED | Running: `com.example.wastelandrpgprototype` (consistent) |

**Key Fixes from Stage E.7:**
- GLES3 `GL_MAX_FRAGMENT_UNIFORM_VECTORS = 261` limit RESOLVED by using host GPU (-gpu host) with Intel Arc translation
- Android emulator now uses OpenGL ES 3.0 via host GPU (gfxstream) - no shader uniform limit errors
- Frame timing: ~3-5ms (60fps) stable on Intel Arc host GPU
- NO "Fragment shader active uniforms exceed GL_MAX_FRAGMENT_UNIFORM_VECTORS" errors
- NO CanvasShaderGLES3 or SceneShaderGLES3 errors
- Survivor SpriteFrames: 49 animations with correct frame counts (idle=4, walk=8, attack_melee=6, attack_ranged=6, hit=3, death=4 per direction)

**Artifacts Created:**
- `artifacts/qa/android_runtime/stage_e8_final/` - 6 Android screenshots (1.1MB each, player visible with animation)
- `builds/android/stage_e8_final_opt.apk` (41.2MB, SHA256: E30C233BB1EFDA70E644C4B2A8D0611715E4D0CED3569B252CB26C907887928B)
- `artifacts/qa/android_runtime/stage_e8_final/TOUCH_TEST_RESULTS.md`
- `artifacts/qa/android_runtime/stage_e8_final/ANDROID_RENDERING_DIAGNOSIS.md`

---

*Last Updated: 2026-11-09 — GitHub sync complete, XP progression fidelity verified (41 tests PASS), documentation published*