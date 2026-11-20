# RADZONE — Survivor male directional pose graphics v1

**Status: 32 new isolated PNG static poses, staged for Godot QA — NOT approved production animations.**

## Actual delivered files

- `art/production/character_survivor_pose_v1/frames/` — 4 states × 8 directions = **32 independent 256×256 RGBA PNG frames**, extracted from the recently generated four source sprite sheets.
- `art/production/character_survivor_pose_v1/atlas_*.png` — **four 1024×512 transparent atlases** (4×2 tiles at 256×256), states `idle`, `ready`, `aim`, `fire`.
- `art/production/character_survivor_pose_v1/source/*.webp` — four compressed source/reference sheets; exact original PNG SHA-256 in manifest. Note compressed WebP sources are lossy derivatives, not bit-identical PNG originals.
- `art/production/character_survivor_pose_v1/review_grid.webp` — visually inspect all 32 directional static poses at once.
- `art/production/character_survivor_pose_v1/manifest.json` — source hashes, frame SHA-256, 256px alpha bounds, original crop and foot alignment, Godot resource paths.
- `assets/characters/radzone_survivor_pose_v1/survivor_pose_sprite_frames.tres` — 32 named single-frame SpriteFrames animations for **preview/staging only**.
- `scenes/art_preview/survivor_pose_v1_preview.tscn` — QA scene showing all states and facings simultaneously, no existing gameplay changed.
- `tools/art/check_survivor_pose_v1.py` — Python standard-library checks of frame/atlas hashes, dimensions, alpha-compatible color type and SpriteFrames references.

## Facing convention and animations

Source sheet cells from left to right: `S`, `SE`, `E`, `NE` on first row; `N`, `NW`, `W`, `SW` on second row. Labels are an **art-production interpretation**, not independently proven against Godot world axes. Compare with `Player` facing logic before integration. Each tile was resized from its original cell to 256×256 without altering the relative body pose. Visible foot points aligned to y=248. Recommended AnimatedSprite2D offset is `(0,-120)` relative to the tile center.

Animation resource contains `idle_*`, `ready_*`, `aim_*`, `fire_*` with **one frame each**. This is not a walking animation, time-based aim/attack animation, 49-animation replacement, dynamic paperdoll, hand-grip overlay or verified equipment response. Pistol is baked into `ready/aim/fire`; if set as the base sprite while rendering separate weapon layers, the weapon can appear twice.

## OpenCode QA gate (before gameplay integration)

1. Fetch PR and check clean working tree; do not overwrite local work. Run `python tools/art/check_survivor_pose_v1.py` and `python tools/validate_art.py --require-alpha` on sample or all frames.
2. In Godot 4.7.2 import the new PNGs, open/run `scenes/art_preview/survivor_pose_v1_preview.tscn`. Confirm no resource parse errors, 32 visible poses, facing handedness, foot registration and 1280×720 layout.
3. Inspect sprite at actual mobile game scale; check green/red halos, limb consistency, pistol direction, muzzle flashes, pose drift, animated transition and parallax.
4. Do NOT auto-replace the existing `assets/characters/survivor_sprite_frames.tres` or gameplay CharacterVisual, which already manages equipment layers and 8 directions. If integrating, implement a **separate selectable test rig**, verify item identity and suppress duplicate weapon overlay whenever a baked pistol pose is selected.
5. Show user actual Android capture and tests, with 8-direction ready/aim/fire transitions and no gameplay balance/save changes. User must approve before any production art switch.

## Known limitations

Generated source art is painterly, not frame-perfect from a single 3D rig; identity, boots, backpack and grips vary slightly across cells. Fire-state muzzle flashes are baked into those poses and cannot serve as a reusable independent VFX. No locomotion/hit/death/reload sequences or frame-by-frame attack motion are supplied. Alpha-matte edge halos need real visual inspection before shipping.

No GitHub Actions runner or paid model/API was launched for the export/publish step. The assets and static checks exist; Godot and Android tests are **not** claimed complete.
