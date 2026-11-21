# Inventory RADZONE icon integration — evidence

Real in-game captures of the shipped `scenes/ui/inventory_ui.tscn` over the shipped
`Inventory` autoload, taken with Godot 4.7.2 (non-headless, OpenGL 3.3, 1280x720).

Capture driver: `scripts/art/inventory_radzone_review_capture.gd`
Preview scene: `scenes/art_preview/inventory_radzone_review.tscn`

| File | What it shows |
|------|---------------|
| `inventory_radzone_icons.png` | Grid with the 7 RADZONE-mapped icons at 64x64 plus unmapped items on the placeholder path |
| `inventory_radzone_details.png` | Same grid with `combat_knife` selected: details panel populated (name, description, weight, value, amount) and the Drop action visible |

## Items that received a real RADZONE PNG

| item_id | icon_path |
|---------|-----------|
| `combat_knife` | `res://art/production/painterly_v3/items/combat_knife.png` |
| `combat_shotgun` | `res://art/production/painterly_v3/items/combat_shotgun.png` |
| `hunting_rifle` | `res://art/production/painterly_v3/items/hunting_rifle.png` |
| `gas_mask` | `res://art/production/painterly_v3/items/gas_mask.png` |
| `lockpick_set` | `res://art/production/painterly_v3/items/lockpick_set.png` |
| `laser_pistol` | `res://art/production/painterly_v4/wave01/objects/weapons/laser_pistol.png` |
| `pump_shotgun` | `res://art/production/painterly_v4/wave01/objects/weapons/pump_shotgun.png` |

Only items whose identity matches the artwork by name and by visual content were mapped.
Ambiguous crops (`pistol`, `medkit`, `stim_injector`, `wrench`, `pistol_ammo`,
`shotgun_shells`, `heavy_revolver`, `compact_submachine_gun`, ...) were deliberately
left on the placeholder path rather than guessing a mapping.

## Verification

- `scripts/tests/test_inventory_icons.gd` — 7/7 PASS, exit 0
  (`SUMMARY: 8/88 items resolve to a real icon; 80 still point at missing files`;
  the 8th is `production_pistol_rev2`, which already had a real atlas)
- `scripts/tests/test_scene_parse_integrity.gd` — `SCENES_CHECKED=19 MISMATCH=0`, exit 0
- `scripts/tests/test_radzone_scene_integration.gd` — RESULT: ALL PASS, exit 0
- `scripts/tests/test_critical_fidelity.gd` — ALL TESTS PASSED, exit 0
- `tests/test_ap_fidelity.gd`, `tests/test_dtdr_fidelity.gd`, `tests/test_special_fidelity.gd`,
  `tests/test_xp_progression.gd` — ALL TESTS PASSED, exit 0
- `tests/test_asset_uniqueness_guard.py` — 6 tests OK
- `tests/test_art_visual_duplicate_gate.py` — 3 tests OK
- `scripts/test_combat_damage.py` — ALL TESTS PASSED
- `scripts/test_item_database.py` — ALL TESTS PASSED (86 items)

## Status

Draft art only. All RADZONE PNGs remain `staged_unapproved` /
`published_draft_asset` in `art/production/catalog/asset_registry.json`; nothing here
is `production_approved`. Not Android-validated.
