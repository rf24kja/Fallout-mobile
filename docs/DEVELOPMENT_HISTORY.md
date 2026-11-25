# Development History — Fallout 2 Reborn Mobile

## Project Milestones

### 2026-10-21: Project Reorientation & IP Compliance
- **Decision**: Pivot from "original IP inspired by Fallout 2" to "Fallout 2 Reborn Mobile" — faithful mobile adaptation of original Fallout 2
- **SPECIAL Rename**: All 7 SPECIAL attributes renamed to avoid IP issues (Strength→Might, Perception→Awareness, Endurance→Vigor, Charisma→Presence, Intelligence→Intellect, Agility→Dexterity, Luck→Fortune)
- **Files Updated**: 11 files across character_system, combat_system, game_manager, inventory, item_definition, dialogue_manager, combat_hud, tests
- **Verification**: All 27 Godot headless tests PASS

### 2026-10-23: Save Migration System
- **Feature**: Save schema versioning (v1→v2) with SPECIAL attribute migration
- **Implementation**: `_migrate_save_data()`, `_migrate_v1_to_v2()` in game_manager.gd
- **Properties**: Idempotent, deterministic precedence, preserves all non-SPECIAL data
- **Tests Added**: 4 migration tests in Stage C suite — ALL PASS

### 2026-10-26: Data Foundation Complete (WS-2)
- **Weapon Data**: 24 weapons across 7 classes (MELEE, PISTOL, SMG, SHOTGUN, RIFLE, HEAVY, ENERGY)
- **Ammo Data**: 23 ammo types across 6 classes (STANDARD, JHP, AP, INCENDIARY, MICROFUSION, SMALL_ENERGY)
- **Armor Data**: 18 pieces (12 body, 6 head) with per-damage-type DT/DR
- **Healing/Chems/Utility**: 6+6+9 items
- **ItemDatabase**: Loads all 6 JSON files, 87 items validated, zero warnings

### 2026-10-28: Combat DT/DR & Ammo System (WS-2)
- **Damage Formula**: Full Fallout 2 DT/DR implementation with ammo modifiers
- **Ammo Modifiers Verified**: JHP (1.5× dmg, 1.5× DT), AP (0.75× dmg, 0.4× DT), Standard (1.0×)
- **Called Shots**: 8 body parts with effects (stun, disarm, cripple, knockdown, blind)
- **Damage Types**: 7 types with per-type DT/DR (NORMAL, LASER, FIRE, PLASMA, ELECTRICAL, EMP, EXPLOSIVE)
- **Tests**: 17 combat damage cases — ALL PASS

### 2026-10-30: Combat Integration & Mobile UX (WS-3)
- **Cover System**: 5 cover levels (NONE/LIGHT/MEDIUM/HEAVY/BLOCKED) with accuracy penalties
- **Combat UI**: CalledShotPanel, CoverIndicator, TargetPanel, CombatHUD with touch-friendly controls
- **Combat Effects**: Muzzle flash, projectiles, impacts, critical hits, death animations, screen shake
- **Character Visual**: Paperdoll layered system (base, armor, helmet, weapon) with Z-index
- **CombatHUD Fix**: Removed return type hints preventing script binding in Godot 4.7.2

### 2026-11-01: Quest System & Android Runtime (WS-3)
- **Quest Manager**: 3 branching quests (Find Vault, Merchant Woes, Lost Caravan) with 3 paths each
- **Quest States**: AVAILABLE, ACTIVE, COMPLETED, FAILED with EventBus integration
- **Stage E.8 Android**: x86_64 export template built from Godot 4.7.2 source (73MB libgodot_android.so)
- **APK**: stage_e8_final_opt.apk (41.2MB) — installs and runs on emulator
- **Rendering**: Host GPU (-gpu host) resolves GLES3 uniform limit (Intel Arc translation)
- **Device Tests**: 32/32 PASS on Android emulator, touch interactions verified

### 2026-11-09: GitHub Integration & Project Recovery
- **Repository**: https://github.com/rf24kja/Fallout-mobile connected as origin
- **Initial Publication**: Commit 16a893b — baseline project with .gitignore, docs, source code
- **Documentation Suite**: README.md, AGENTS.md, PROJECT_MANDATE.md, RECOVERY_GUIDE.md, PROJECT_STATE.md, NEXT_ACTIONS.md
- **Git LFS Migration**: Large binaries (.so, .apk) moved to LFS — force push ea7cb64
- **Recovery Validation**: Fresh clone → Godot 4.7.2 opens without parse errors
- **Release Build**: Manual apksigner workaround — Fallout2_Reborn_Mobile_Release_signed.apk (124MB) verified

### 2026-11-09: XP Progression Fidelity Fix
- **Bug Found**: `xp_for_level()` used linear formula `level * 1000` instead of Fallout 2 cumulative quadratic
- **Fix**: Changed to `1000 * level * (level - 1) / 2` matching original Fallout 2
- **Verification**: Comprehensive test suite `test_xp_progression.gd` — ALL PASS
  - Levels 1-25 exact XP thresholds verified
  - Boundary values (exact threshold, just below) verified
  - Edge cases (negative XP, zero XP) verified
  - Simulated level-up sequence 1→10 verified
  - Save/load compatibility verified
- **Evidence**: REA analysis confirms Fallout 2 uses cumulative XP curve

---

## Key Technical Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-10-21 | SPECIAL rename for original IP | Avoid Bethesda IP claims; mechanical equivalence preserved |
| 2026-10-23 | Save versioning with migration | Enable schema evolution without breaking player saves |
| 2026-10-28 | Per-damage-type DT/DR | Match Fallout 2's granular armor system (7 damage types) |
| 2026-10-30 | Cover system as enhancement | Fallout 2 had no cover; mobile UX benefits from tactical positioning |
| 2026-11-01 | Host GPU for Android emulator | Resolves GLES3 GL_MAX_FRAGMENT_UNIFORM_VECTORS=261 limit |
| 2026-11-09 | Git LFS for large binaries | Keep repo cloneable (<100MB), preserve build artifacts in history |
| 2026-11-09 | Manual apksigner for release | Godot 4.7.2 export preset keystore loading bug workaround |

---

## Test History

| Date | Suite | Tests | Pass | Fail | Notes |
|------|-------|-------|------|------|-------|
| 2026-10-26 | Stage B | 11 | 11 | 0 | Core systems |
| 2026-10-26 | Stage C | 16 | 16 | 0 | Combat, items, character |
| 2026-10-26 | Save Migration | 4 | 4 | 0 | v1→v2 migration |
| 2026-10-26 | Combat Damage | 17 | 17 | 0 | DT/DR, ammo, called shots |
| 2026-10-30 | Stage B+C | 32 | 32 | 0 | Full vertical slice |
| 2026-11-01 | Android Device | 32 | 32 | 0 | Emulator runtime |
| 2026-11-09 | XP Progression | 41 | 41 | 0 | Levels 1-25, boundaries, level-ups, save/load |

---

## Known Issues & Blockers

### P0 - Critical
- **Release Keystore in Godot Export**: Godot 4.7.2 fails to load release keystore from export_presets.cfg despite valid JKS file. Workaround: manual `apksigner` after export.
- **Git LFS Force Push Required**: History rewrite needed for large files; collaborators must re-clone.

### P1 - High
- **Combat AP Costs Unverified**: Weapon AP costs need REA extraction from Fallout 2 protos
- **Critical Hit Tables Missing**: Fallout 2 critical tables by weapon/body part not extracted
- **World Map Travel Not Implemented**: Core Fallout 2 system missing

### P2 - Medium
- **NPC Schedules/AI Not Implemented**: Day/night, faction behavior, companions
- **Reputation/Faction System Not Implemented**: Town and global reputation
- **Animation System**: CharacterVisual uses placeholder sprites (795 frames each, pipeline works but not production quality)

---

## Repository State

| Metric | Value |
|--------|-------|
| Remote | https://github.com/rf24kja/Fallout-mobile |
| Default Branch | master |
| Latest Commit | 4be19cf (docs: update project documentation) |
| LFS Tracked | *.apk, *.so |
| Large Files | custom_template_fixed_decoded/libgodot_android.so (73MB), builds/*.apk (37-124MB) |
| Recovery Tested | ✅ Fresh clone opens in Godot 4.7.2 |

---

*Last Updated: 2026-11-09 — XP progression fidelity verified, documentation published to GitHub*
---

### 2026-11-17: RADZONE Inventory Icon Integration (branch `feature/inventory-radzone-icons`)

**Feature**: 7 gameplay items now render real RADZONE artwork in the inventory grid
(`combat_knife`, `combat_shotgun`, `hunting_rifle`, `gas_mask`, `lockpick_set`,
`laser_pistol`, `pump_shotgun`). `icon_path` values point directly at the PNGs under
`art/production/...`; no copies were made, so each art object keeps one file and its
provenance. Previously all 86 `icon_path` values pointed at the non-existent
`res://assets/ui/icons/` directory and the grid rendered only blue placeholder squares.

**Mapping discipline**: only items matching the artwork by name *and* by visual content
were mapped. Ambiguous crops (`pistol`, `medkit`, `stim_injector`, `wrench`,
`pistol_ammo`, `shotgun_shells`, `heavy_revolver`, `compact_submachine_gun`,
`scavenged_medicine_bottles`, `patched_leather_coat`, `helmet_with_goggles`) were left
unmapped and recorded as gaps rather than guessed.

**Three real defects found and fixed**

1. `.tscn` theme overrides used method-call syntax (`add_theme_color_override(...)`).
   Godot 4 serializes them as `theme_override_*` properties; the method-call form is not
   a valid property line and the loader silently swallows it plus the following
   `[node ...]` header. `scenes/ui/inventory_ui.tscn` lost 8 of 17 nodes at load,
   `scenes/ui/dialogue_ui.tscn` lost 2 of 6, `scenes/ui/main_menu.tscn` lost 2 of 12.
   Rewrote 77 lines across 6 scenes. Regression test:
   `scripts/tests/test_scene_parse_integrity.gd`.
2. `anchors_preset` is inert at load time (`Control.set_anchors_preset()` is a runtime
   method), so `InventoryPanel` was 0x0 and `ScrollContainer` had height 0 with
   `clip=true` — the grid was laid out but clipped away. Materialised explicit
   `anchor_*` on all 12 nodes of `scenes/ui/inventory_ui.tscn` from the encoded offsets.
   Same defect class remains in 8 other scenes (64 nodes) — recorded as an open task.
3. `TextureButton` ignored `custom_minimum_size` because `ignore_texture_size` defaults
   to `false`; icons rendered at native resolution (up to 900x226) and overflowed the
   72x72 cell. Set `btn.ignore_texture_size = true` in `scripts/ui/inventory_ui.gd`.

Also fixed the stack amount label, which was anchored bottom-right and then given
positive offsets (relative to the anchor) so it landed outside the button; now uses
`set_anchors_and_offsets_preset(PRESET_BOTTOM_RIGHT, PRESET_MODE_MINSIZE, 4)`.

**Evidence**: `artifacts/qa/inventory_radzone/inventory_radzone_icons.png`,
`inventory_radzone_details.png`, `README.md` (real in-game captures, Godot 4.7.2
non-headless, 1280x720). Capture driver `scripts/art/inventory_radzone_review_capture.gd`,
preview scene `scenes/art_preview/inventory_radzone_review.tscn`.

**Verification**: `test_inventory_icons.gd` 7/7 PASS; `test_scene_parse_integrity.gd`
19 scenes MISMATCH=0; `test_radzone_scene_integration.gd` ALL PASS;
`test_critical_fidelity.gd`, `tests/test_ap_fidelity.gd`, `test_dtdr_fidelity.gd`,
`test_special_fidelity.gd`, `test_xp_progression.gd` ALL TESTS PASSED;
`tests/test_asset_uniqueness_guard.py` 6 OK; `tests/test_art_visual_duplicate_gate.py`
3 OK; `scripts/test_combat_damage.py`, `scripts/test_item_database.py` ALL TESTS PASSED.

**Status**: draft art only — all RADZONE PNGs remain `staged_unapproved` /
`published_draft_asset`; nothing is `production_approved`. Not Android-validated.

### 2026-11-21: RADZONE UI Anchor Materialization (branch `fix/ui-anchor-presets`, PR #38)

**Feature**: Materialized inert `anchors_preset` into explicit `anchor_left/top/right/bottom` on 47 nodes across 8 UI scenes, fixing controls that rendered at 0×0 or drifted off-screen on mobile. Also fixed 26 root-relative parent paths in `combat_hud.tscn`/`quest_log.tscn` and added `unique_name_in_owner=true` to 15 named nodes in `called_shot_panel.tscn`.

**Scenes fixed**:
- `scenes/ui/called_shot_panel.tscn` (16 anchors + 15 unique_name_in_owner)
- `scenes/ui/combat_hud.tscn` (10 anchors + 15 parent path fixes)
- `scenes/ui/combat_ui.tscn` (8 anchors)
- `scenes/ui/dialogue_ui.tscn` (4 anchors)
- `scenes/ui/quest_log.tscn` (3 anchors + 11 parent path fixes)
- `scenes/world/test_map.tscn` (4 anchors)
- `scenes/entities/npc.tscn` (1 anchor)
- `scenes/entities/world_item.tscn` (1 anchor)

`main_menu.tscn` verified clean — no inert anchors.

**Derivation rule**: for each (off_a, off_b) anchor pair, try 4 candidates `(0,0),(0,1),(1,0),(1,1)`; reject those giving non-positive extent; maximize score where each negative offset maps to `anchor=1`; all-zero offsets → `(0,0,1,1)`. Verified on all 44 non-degenerate cases.

**New regression test**: `scripts/tests/test_ui_layout_integrity.gd` — source-based `.tscn` parsing (avoids pre-existing `.gd` script parse errors in combat_hud/quest_log). Verifies all `anchors_preset!=0` nodes have `anchor_*` materialized and called_shot_panel `%Name` lookup resolves.

**Verification**: `test_ui_layout_integrity.gd` — SCENES=19, CHECKS=72, FAILURES=0, RESULT: ALL PASS, exit 0. `test_scene_parse_integrity.gd` — SCENES_CHECKED=19 MISMATCH=0, exit 0.

**Pre-existing unrelated defects** (not in scope A-2): `quest_log.gd:36` calls `_select_quest()` which is not defined; `quest_log_entry.tscn` is missing; `combat_hud.gd:42` type mismatch RichTextLabel→Label.

**PR**: https://github.com/rf24kja/Fallout-mobile/pull/38 — `fix/ui-anchor-presets` (head `c6afd2fd04c8ba43a108cb4b859b741871ac0cbd`, base `master`), 9 files, state OPEN. Merge pending owner review.

**Status**: draft art only — all RADZONE PNGs remain `staged_unapproved` / `published_draft_asset`; nothing is `production_approved`. Not Android-validated.

### 2026-11-24: Release 1.0 Integration Branch + APK
- **Branch**: `release/1.0-integration` from master `5629508`, ff-merged `fix/ui-anchor-presets` `93f2c81`; pushed no-force.
- **Fidelity fixes (commit `d5370f6`)**: HP formula `(Lv-1)` in `character_system.gd`; GDScript 4.7 String/int comparison type-guards in `combat_system.gd`; symmetric `get_save_data()`; test `_new()` initialization. 13 tests ALL GREEN, 0 SCRIPT ERROR/FAIL.
- **Save/load QA (commit `092b1ce`)**: new `scripts/tests/test_save_load_roundtrip.gd` — 21 checks ALL PASS (save/load slot 9, v1→v2 SPECIAL migration, cleanup).
- **APK**: `Fallout2_Reborn_Mobile_Release_1.0.apk` (185 MB), SHA256 `61cca9564075d3cd00ffdc3c6e382804c305106a5530b3f8d814444680bb23ab`, apksigner v2+v3 verified, 4 ABIs. Manual apksigner workaround (Godot 4.7.2 keystore bug). No device → runtime pending.
- **Report**: `docs/RELEASE_1.0_INTEGRATION_REPORT.md`. PRs #36/#38 + Wave13 not merged (owner).


### 2026-11-24: Campaign Engine, Original Data Importer, Mobile Joystick (m01690)
- **Original data**: located local GOG `Fallout2\` install; decoded DAT directory format; extracted master.dat/critter.dat/patch000.dat into gitignored `.local/` (licensed, never published). `.local/` added to `.gitignore`.
- **Importer**: `tools/fallout2_import/` (6 files) — dat_reader/msg_parser/pro_parser/map_parser/import_all/README. `import_all.py --verify` → OK: 492 items, 483 critters, 113 quests, 80 locations, 171 maps, 801 dialogues. Output in `.local/generated/`.
- **Campaign engine**: `scripts/campaign/` (9 files) + `scenes/campaign/campaign_root.tscn` + `test_campaign_engine.gd` (53 checks PASS) — location graph, travel events, quests/dialogues registration, defensive JSON adapter with graceful degradation.
- **Mobile controls**: `scripts/ui/mobile_controls.gd` + `scenes/ui/mobile_controls.tscn` + joystick branch in `player.gd` + instancing in `test_map.tscn`. `test_mobile_controls.gd` 54 checks PASS.
- **Bug fixes**: Godot 4 `JSON.parse_string` API in `quest_manager.gd` + `save_system.gd`.
- **Verification**: 12 Godot + 9 Python + importer + boot ALL GREEN, 0 SCRIPT ERROR/FAIL.
- **Status**: campaign engine built but not wired into playable loop; no real playthrough/Android runtime; no APK rebuild yet. PR #39 open.

### 2026-11-24: Playable Campaign Scene + On-Device QA (m01690)
- **Root cause of gray screen**: campaign_root.tscn had no visual nodes; location_scene.gd never instantiated; world_map._current_id unset.
- **Fix `dd16b2a`**: campaign_root.gd renders LocationScene + real Player at arroyo, wires mobile controls and exit travel; location_scene.gd gets get_player_spawn()/get_map_size() and immediate free(); new test_campaign_playable_scene.gd (14/14 PASS).
- **Godot 4.7 API bugs**: Camera2D.current not assignable (use make_current), @onready sprite type mismatch, deferred queue_free renaming.
- **Verification**: 13 Godot tests all PASS, 0 SCRIPT ERROR; desktop viewport capture confirms rendered scene (exits, joystick, buttons).
- **Android**: re-signed x86_64 debug APK, on-device logcat confirms full scene tree + Player + 0 SCRIPT ERROR; screenshots gray due to SwiftShader shader uniform limit (emulator GPU), not game logic. Retrying with -gpu host.
- **Status**: PR #39 open at dd16b2a, not merged; Android visual verification pending GPU backend.

### 2026-11-24: Full Playthrough + Release APK Rebuild (m01690)
- **19-step test** `scripts/tests/test_full_playthrough.gd`: 19/19 PASS, 0 FAIL, 0 SCRIPT ERROR, exit 0. Real assertions across launch/new_game/location/movement/NPC/dialogue/quest/combat/XP/level/inventory/travel/save/restart/load/world-restore; 2 honest SKIPs (character creation — no scene/API; trade — no vendor/barter API).
- **Production fix** in `scripts/entities/player.gd`: JSON roundtrip turned `position` into a String → `SCRIPT ERROR` on `global_position` assignment; added `_coerce_position()` + `_is_zero_position()`.
- **Commit `0dd3c45`** (3 files, +381/−3) pushed to `release/1.0-integration`.
- **Release APK** rebuilt and signed: `builds/android/Fallout2_Reborn_Mobile_Release_1.0.apk`, 185570034 B, SHA256 `ec8d10c9b8ac7a9cef7c27341a0b275dd2d4c36dd8af7a0399af499a4c437f8b`, zipalign + manual apksigner (CN=Fallout 2 Reborn, v2+v3). On-device boot verified: 0 SCRIPT ERROR / 0 crash; ADB screencap black is an emulator GPU capture limitation (same code visually confirmed via desktop capture + debug APK).
- **Docs**: `docs/RELEASE_1.0_INTEGRATION_REPORT.md` APK section updated with new SHA256 and on-device results.
- **Status**: PR #39 open, not merged.

### 2026-11-25: Character Creation (m01691, Phase 1)
- **Commit `9897e08`**: full new-game creation — `scripts/systems/character_creation.gd`, `scripts/ui/character_creation_ui.gd`, `scenes/ui/character_creation_ui.tscn`, `scripts/tests/test_character_creation.gd`; integration in `main_menu.gd`, `game_manager.gd`, `character_system.gd`, playthrough step 3, fidelity matrix docs.
- **Rules**: 7 original-IP SPECIAL stats, 5+5 points (1..10), ≤2 optional traits, exactly 3 tag skills, verified vanilla skill/derived formulas and per-level SP; new game clears inventory/equipment/caps.
- **Verification**: creation 12/12 PASS, playthrough 19/19 PASS (step 3 now real), derived-stat fidelity 72/72 PASS, all exit 0, no SCRIPT ERROR.
- **Blocker recorded**: age modifiers unconfirmed from available sources; age stored/displayed only, no invented coefficients.
- **Next**: trade/barter Phase 2, then APK rebuild and PR #39 update; PR still open, not merged.

### 2026-11-25: Barter/Trade + Final Verification (m01691, Phase 2)
- **Commit `64830b4`**: `feat(trade): implement full barter with merchants and vanilla pricing` — 11 files, +1614/−5; new `scripts/systems/trade_system.gd`, `scripts/ui/trade_ui.gd`, `scenes/ui/trade_ui.tscn`, `scripts/tests/test_trade.gd`; autoload + EventBus signals; merchant NPC in `scenes/world/test_map.tscn`; `merchants` save/load; playthrough step 14 is now a real buy/sell.
- **Pricing**: buy uses verified vanilla `_barter_compute_value()` including `(160+npcBarter)/(160+playerBarter)*2*rawCost`, reaction modifier, Master Trader −25, clamp and `int()` truncation; sell = raw item value. Both operations are atomic with rollback and keep `Inventory.caps` and `GameManager.player_data["caps"]` synchronised; no duplication or negative balances.
- **Visual QA bug found and fixed**: desktop render of `scenes/ui/trade_ui.tscn` showed empty item panes because `MerchantPane`/`PlayerPane` had offsets but default top-left anchors, making their `ScrollContainer` size (0,0). Added `anchors_preset = 15` and full-rect anchors to both panes; re-verified `test_ui_layout_integrity.gd` CHECKS=80 FAILURES=0 and desktop capture shows populated item rows.
- **Verification**: trade 15/15 PASS; character creation 12/12 PASS; playthrough 19/19 PASS (`STEP 14 trade: PASS buy price=202 sell price=40 caps=488`); UI layout integrity 80 checks PASS; fidelity 72/72 PASS; Python item database/combat tests ALL PASS, pytest 9 passed/8 Pillow warnings. Zero assertion failures; only pre-existing non-fatal RID/resource warnings remain.
- **APK**: rebuilt and signed `builds/android/Fallout2_Reborn_Mobile_Release_CharCreation_Barter.apk` (185,661,660 B, SHA256 `F5C5DE9646040E3338AAA8718F529DC78F0BEDC2F8D6B74FDB230BA9C963C363`), apksigner v2+v3 OK, package `com.example.wastelandrpgprototype`, ABIs arm64-v8a/armeabi-v7a/x86/x86_64. Installed and launched on `emulator-5554` with 0 SCRIPT ERROR/FATAL; ADB screencap uniformly black, so Android visual verification is NOT claimed. Desktop render of new screens is separate, gitignored evidence.
- **Blocker unchanged**: exact age-related SPECIAL modifiers still require the missing licensed age module; no coefficients invented.
- **Status**: PR #39 remains OPEN, not merged; no force push; untracked user files preserved.
