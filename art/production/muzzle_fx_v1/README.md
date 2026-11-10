# RADZONE — Independent Muzzle Flash VFX v1

**Candidate gameplay effect, not approved as in-game-tested.** This is a tangible two-weapon, eight-facing, three-frame VFX package intended for the paperdoll combat renderer.

- `atlas_pistol.png`, `atlas_rifle.png`: RGBA transparent 384×576 atlas each, 24 cells (8 directions × 3 phases), cell 96×96.
- `muzzle_pistol_sprite_frames.tres`, `muzzle_rifle_sprite_frames.tres`: Godot 4 SpriteFrames animations `flash_S`, `flash_SE`, `flash_E`, `flash_NE`, `flash_N`, `flash_NW`, `flash_W`, `flash_SW`, three frames per animation (non-looping, 14fps).
- `scenes/art_preview/muzzle_fx_preview.tscn` + `muzzle_fx_preview.gd`: separate mobile-friendly demonstration of runtime flash overlay on original READY survivor poses, without touching the working scene or weapons gameplay.
- `manifest.json`: provenance, SHA-256, anchors, source references and status.
- `review.webp`: Pillow composition for art review, **not a Godot runtime screenshot**.

## Origin and fidelity

The flame / smoke was *extracted from existing ChatGPT-generated firing pose art*, isolated from character pixels, then rotated and given three intensity phases per direction. This is **not** a separately generated 8-angle weapon, not a 3D model and not a six-frame animation. These effects can only be called candidate sprites until reviewed in Godot.

The extractor uses the exact source assets already committed in GitHub:
- `art/production/character_survivor_pose_v1/atlas_fire.png`
- `art/production/character_survivor_rifle_pose_v1/atlas_rifle_fire.png`

In game, the muzzle position must be tied to the **actual hand/grip socket per item, direction and animation frame**, not the fixed preview estimates. Current preview points are local to the 256×256 full-body character canvas aligned to foot coordinate `(128,248)`.

## Engineering verification required in OpenCode

1. Fetch the art branch without discarding any local files. Open and run `scenes/art_preview/muzzle_fx_preview.tscn` in Godot 4.7; tap all three buttons and check all eight directions for both weapons.
2. Validate flash does not contain body pixels, its center aligns to the barrel, and the glow does not clip at 96px cell bounds. Check on actual Android scale and background brightness.
3. Confirm `SpriteFrames` parse and each `flash_DIRECTION` has exactly three frames; preview automatically hides animation after playback.
4. Do not add this as a weapon-item replacement. Only integrate into combat effect overlay after mapping real `item_id` and validating the muzzle sockets. The same effect may be reused by multiple suitable guns but should not change damage/AP/ammo or combat timing.
5. Keep these as art candidates until actual Godot screenshots and test logs are present. No paid Actions are required.