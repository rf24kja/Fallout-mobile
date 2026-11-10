# RADZONE — Rifle directional pose delivery (2026-11-10)

## Delivered source and engine resources

New reusable candidate art from two previously generated full-body survivor-with-rifle sheets, now published as actual files:

- **16 transparent RGBA PNG frames** (256×256): `rifle_ready` and `rifle_fire`, each `S SE E NE N NW W SW`.
- **2 RGBA PNG atlases** (1024×512), grid of 4 columns × 2 rows, exact cells 256×256.
- **SpriteFrames**: `art/production/character_survivor_rifle_pose_v1/survivor_rifle_pose_sprite_frames.tres`, one frame for each of 16 named state+direction poses.
- **Godot 4 editor-review scene**: `scenes/art_preview/survivor_rifle_pose_review.tscn` previews all poses without altering the main game.
- `manifest.json`, source sheets (compressed WebP), review sheet and SHA-256 provenance.

## Explicit limitations

These are **static 1-frame poses** and are **not** 8-direction animated movement or a complete firing sequence. The rifle is baked into the character pixels, not a separate `WeaponSprite` layer. Do NOT equate this to dynamic equipment in the existing paper-doll system, and do not bind to item IDs or replace `assets/characters/survivor_sprite_frames.tres` without a dedicated migration and approval.

Some rifle-fire directions have oversized generated smoke/muzzle effects; tiny detached cross-cell artifacts were cleaned before export, but VFX still needs visually separate production work. Actual 3D-like handedness, gun stock, shoulder alignment, muzzle origin and 8-direction correspondence require in-game review.

## Local tests already completed

- PNG file signatures and PIL decode: **PASS**
- Dimensions and alpha transparency: **PASS**
- All 16 frames' ground pixel alignment to y=248: **PASS**
- Atlas slicing pixel-identical to each corresponding frame: **PASS**
- SHA-256 against committed manifest: **PASS**
- Godot editor import, save/load, mobile rendering, combat logic, Android: **NOT RUN** here

## OpenCode integration and quality gate

1. Fetch branch `art/pipeline-staging-20261110` without discarding local edits.
2. Run `python tools/art/validate_rifle_pack.py` (requires Pillow).
3. Import/open the standalone `survivor_rifle_pose_review.tscn` in Godot 4.7 and verify the authored `SpriteFrames` resource parses (this is not yet tested on this side).
4. Screenshot eight directions of both poses at actual game scale on Android; inspect clipped flares and alpha halos.
5. Compare to existing survivor, test equip/unequip and save/load in a separate implementation PR; do not blindly use the baked rifle character as an always-visible base sprite.
6. Do not alter player combat/SPECIAL, AP, DT/DR, item balance, or shipping resources when validating art.

Approval status: `candidate_not_in_game_verified`; no user approval yet, no changes to `master`, no paid GitHub Actions runners launched.
