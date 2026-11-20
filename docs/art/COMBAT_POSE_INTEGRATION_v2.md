# RADZONE Combat Pose Atlas v2 — staged, non-destructive

## Deliverable

A **new compact 512×1536 RGBA atlas** containing 48 actual sprite regions from six previously published source atlases. Each state has eight directions and a 128×128 preview cell:

- `unarmed_idle`
- `pistol_ready`, `pistol_aim`, `pistol_fire`
- `rifle_ready`, `rifle_fire`

Published also: compact `SpriteFrames`, a full-resolution `SpriteFrames` resource that **reuses six previously committed 1024×512 source atlases**, a real touch-friendly Godot test scene and script, and an art QA review sheet. No need to duplicate the 2.2 MB full combined atlas file.

**Frame naming:** `state_direction`, e.g. `pistol_aim_SW`. Directions `S, SE, E, NE, N, NW, W, SW` are read from sources; Godot's controller can select by named direction independently of source atlas order. See `manifest.json` for atlas regions and hashes.

**Why this is useful:** one independent preview scene now allows touching buttons to switch among unarmed, pistol and rifle character art, then inspect eight directions at the same anchor. This is a true Godot-integrable source asset, not a promotional illustration. It **does not automatically implement equipment synchronization** in the live game.

## How to verify locally (OpenCode)

1. Fetch this PR branch without discarding uncommitted local changes.
2. Run `godot --headless --path . --editor --quit` (or actual Godot binary) and inspect error logs. Environment here does not have the Godot binary; we did not execute this.
3. Open `res://scenes/art_preview/combat_pose_preview.tscn` **as a test scene**. Confirm all 48 logical states through button taps: choose `unarmed/pistol/rifle`, `ready/aim/fire` and `S,SW,W,NW,N,NE,E,SE`.
4. Note that `unarmed` always shows `unarmed_idle`, and rifle `aim` deliberately falls back to `rifle_ready`; these are **documented unsupported pose combinations**, not fake frames.
5. Test at native Android viewport 1280×720 using touch, check alpha edge halos, flash clipping, boots anchoring, relative character scale, and outfit consistency. Rifle-fire generated source has conspicuous white smoke circles; this is explicitly **visual QA pending**, not release-ready.
6. Use `res://art/production/combat_poses_v2/combat_poses_256_sprite_frames.tres` to inspect full-resolution poses; it references the six existing 256px source atlases. The compact variant uses the newly published 128px atlas.
7. Only after human visual review choose how to integrate with `CharacterVisual`. Baked pistol/rifle bodies **must not** be treated as weapon-only overlay layers; do not double-render weapons.
8. Do not change SPECIAL, combat balance, item IDs, animation rates, save formats or release APK while testing this resource.

## Verified here

- 48 atlas cells present at exact grid regions, 6 states × 8 directions.
- New compact PNG decodes at 512×1536 with valid signature and an alpha channel with transparent pixels.
- All 48 full-resolution PNG source cells decode with nonempty alpha.
- SHA-256 captured for all newly produced assets; GitHub blob SHA and paths verified after publication.

## Not verified here

- Godot scene parser, mobile performance or input handling, weapon equip/unequip events, actual 3D/2D perspective consistency, animation interpolation, or Android runtime.
- Not a walking animation, reload animation, equipment rig, production-ready multiplayer sprite or dynamic muzzle effect.

**Status:** `candidate_asset_not_in_game_verified`. This package does not alter gameplay or current character visuals.