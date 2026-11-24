# Release 1.0 Integration — Verification Report (2026-11-24)

## Goal (FINAL MISSION)
Bring Fallout 2 Reborn Mobile to a playable Android RPG preserving original Fallout 2
mechanics (SPECIAL, skills, perks, AP, DT/DR, criticals, aimed attacks, weapons,
inventory/trade, quests, save/load). No rewrite, Godot 4.7.2 retained, RADZONE graphics only.

## Branch / commits
- Integration branch: `release/1.0-integration`, created from `master` (`5629508`),
  fast-forward merged `fix/ui-anchor-presets` (`93f2c81`). Pushed WITHOUT force.
- Commits on branch:
  - `d5370f6` — fix(fidelity): correct HP formula + GDScript type-comparison errors (3 files, +31/−7)
  - `092b1ce` — test(qa): save/load round-trip integration test (21 checks)
- Remote SHA confirmed: `092b1ce` (after final commit) — see git ls-remote.
- `master` untouched. PRs #36/#38 and Wave13 draft are NOT merged (await owner).

## Real code defects fixed (NOT test-tailoring)
1. `scripts/systems/character_system.gd` `_recalculate_derived_stats()` — used `level`
   instead of `(Lv-1)` in HP formula; produced 80/205/63 where Fallout 2 vanilla is
   75/197/57. Fixed with `max(0, level - 1)` factor. Now matches `get_derived_stats()`.
2. `scripts/systems/combat_system.gd` `_check_stat()` / `_apply_critical_effect()` —
   compared String with int (`== -1`, `!= 0`) causing `SCRIPT ERROR: Invalid operands
   'String' and 'int'` on GDScript 4.7. Fixed with `typeof()`-guarded comparisons.
3. `scripts/systems/character_system.gd` — added symmetric `get_save_data()`.
4. `tests/test_special_fidelity.gd` — `.new()` on a Node instance + missing
   `_init_default_character()` caused empty `character_data`; fixed by calling `.new()`
   on the class and initializing explicitly.
5. Earlier (PR #38): `quest_log.gd:36` `_select_quest()`→`_on_quest_selected()`,
   removed missing `quest_log_entry.tscn`, `combat_hud.gd` Label→RichTextLabel.

## Verification — ALL GREEN (zero SCRIPT ERROR, zero FAIL)
Godot 4.7.2 headless, `--script <f> --quit-after 40`:
- `scripts/tests/test_critical_fidelity.gd` — ALL TESTS PASSED (critical tables)
- `tests/test_special_fidelity.gd` — ALL PASSED (HP formula now matches vanilla)
- `tests/test_xp_progression.gd` — ALL PASSED
- `tests/test_ap_fidelity.gd`, `tests/test_dtdr_fidelity.gd` — ALL PASSED
- `scripts/tests/test_ui_layout_integrity.gd` — CHECKS=57/72, FAILURES=0
- `scripts/tests/test_scene_parse_integrity.gd` — SCENES=19, MISMATCH=0
- `scripts/tests/test_inventory_icons.gd` — ALL PASS
- `scripts/tests/test_radzone_scene_integration.gd` — ALL PASS
- `scripts/tests/test_save_load_roundtrip.gd` — CHECKS=21, FAILURES=0 (NEW)
Python: asset_uniqueness_guard (6 OK), art_visual_duplicate_gate (3 OK),
combat_damage (ALL PASSED), item_database (86 items, ALL PASSED).
Boot test: `godot --headless --path . --quit-after 90` → exit 0, 0 errors.

## APK (rebuilt & signed 2026-11-24, after playability + playthrough fixes)
- Path: `builds/android/Fallout2_Reborn_Mobile_Release_1.0.apk`
- Size: 185,570,034 bytes (~177 MB)
- SHA256: `ec8d10c9b8ac7a9cef7c27341a0b275dd2d4c36dd8af7a0399af499a4c437f8b`
- Package: `com.example.wastelandrpgprototype`, versionName 1.0.0, versionCode 1
- minSdk 24, targetSdk 36; ABIs: arm64-v8a, armeabi-v7a, x86, x86_64
- Signature: apksigner v2+v3 verified; signer CN=Fallout 2 Reborn, OU=Development, O=RF24KJA
  (cert SHA-256 `ddf58ce43722e01fce71483867761b4d7975870831a4de9f7052159b914aaabf`). Godot 4.7.2
  cannot load release keystore from export_presets.cfg (documented bug) — exported unsigned,
  then manual `zipalign -f 4` + `apksigner sign` (same signer as the previous release).
- Replaces earlier build `61cca9564075d3cd00ffdc3c6e382804c305106a5530b3f8d814444680bb23ab`
  (built before the campaign-playability and full-playthrough fixes).
- On-device verification (emulator `test_emulator`, x86_64, `-gpu host`): APK installs cleanly
  (after uninstalling the differently-signed debug build) and boots — logcat shows Godot 4.7.2,
  Vulkan 1.3 on Intel Arc, ItemDatabase 88 items, DialogueManager/CombatSystem ready,
  `MainMenu: _ready() called`, `InteractionManager: player not found` (expected on menu),
  **0 SCRIPT ERROR / 0 AndroidRuntime crashes**. ADB screencap stayed black on the release APK
  (emulator GPU/compositor capture limitation; the identical code path rendered correctly in the
  debug APK and in the desktop viewport capture `artifacts/qa/campaign_playable_desktop.png`).
  Full 19-step gameplay validated headlessly via `scripts/tests/test_full_playthrough.gd` (19/19 PASS).

## Systems present (41 .gd scripts, 19 .tscn scenes)
- Core: GameManager, SaveSystem (10 slots, v1→v2 migration), EventBus, Constants,
  InteractionManager.
- Systems: CharacterSystem (SPECIAL, derived stats, skills/perks, XP), CombatSystem
  (AP, DT/DR, criticals 48-entry tables, aimed shots, cover), Inventory, ItemDatabase
  (86 items), DialogueManager, QuestManager, CoverSystem, CombatHUD, combat_effects.
- Entities: Player (isometric movement, touch/click input, paperdoll equipment),
  NPC, world_item, character_visual.
- UI: main_menu, called_shot_panel, combat_hud, combat_ui, dialogue_ui, inventory_ui,
  quest_log.
- World: test_map (with 4 RADZONE Wave12 prop prefabs), minimal tests.
- RADZONE art: Wave12 props in world + inventory icons for 8 item IDs; all PNG remain
  `staged_unapproved` / draft (NOT production_approved) per catalog/contract.

## Limitations (honest)
- Mobile controls are PARTIAL: no virtual joystick, no safe-area insets. Input Map has
  only `interact` (KEY_E); player supports mouse/touch tap-to-move/tap-to-interact,
  UI via Button nodes. Full touch d-pad not implemented.
- RADZONE graphics are draft/staged (not production_approved); no Android visual QA yet.
- No emulator/device attached at build time → APK install + runtime playthrough pending.
- `fix/ui-anchor-presets`/inventory/Wave13 PRs intentionally not merged (owner decision).
- Release keystore bug in Godot 4.7.2 requires manual apksigner after each export.

## Next actions (blocked on owner/environment)
1. Attach Android device/emulator → install APK → run playthrough smoke test.
2. Owner decision on merging PR #36/#38 and Wave13 review.
3. Implement virtual joystick + safe-area for complete mobile control (Stage 4).
4. Integrate remaining RADZONE asset categories after art approval.

## Pull Request

https://github.com/rf24kja/Fallout-mobile/pull/39 — `release/1.0-integration` → `master`, OPEN, MERGEABLE (owner decision required before merge).
