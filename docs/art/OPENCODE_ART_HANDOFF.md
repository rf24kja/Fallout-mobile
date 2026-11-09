# RADZONE — Art Handoff to OpenCode

## Responsibilities

**ChatGPT:** creates the visual reference artwork, variant concepts, modular graphics, naming and manifests, and publishes graphics and visual documentation to GitHub.

**OpenCode:** integrates graphics into the Godot game, manages gameplay logic and equipment events, produces correct atlases and AnimatedSprite2D resources, runs tests/builds, and captures actual Android runtime.

## Current non-negotiable visual directives

1. The [approved ten-screen gallery](./APPROVED_VISUAL_CATALOG.md) is the art target; previously published schematic SVG studies are **not approved final art**.
2. All new visual production must follow [equipment-visual contract](./CHARACTER_EQUIPMENT_VISUAL_SPEC.md).
3. NPCs require [appearance variability](./NPC_VISUAL_DIVERSITY.md).
4. Do **not** remove existing placeholders, rename engine paths, or modify mechanics until target textures are integrated and tested.
5. Inventory weapons and armor must be reflected in the **world/combat sprite**, not only paperdoll UI.
6. No game-state labels in graphic textures. Dialogue remains live and scrollable.

## Known existing Godot integration points (read before any rewrite)

- `scripts/entities/character_visual.gd`: existing equipment/animation layers; needs proven item-ID-based overlays and hand sockets, not a replacement-from-zero.
- `scripts/entities/player.gd`: `_sync_equipment_visual()` call and 8 direction mapping.
- `assets/characters/armor_tier_*/`: existing armor SpriteFrames — inspect and preserve.
- `assets/weapons/production_pistol_candidate_rev2/`: existing directional pistol art — inspect and preserve.
- `assets/characters/*_sprite_frames.tres`: existing base characters, but NPC cast is insufficient.

## Visual integration checklists

- Stage V1: 8 directions of one player in idle and walk, no new weapon.
- Stage V2: add visible pistol, rifle, knife; correct hands/occlusion.
- Stage V3: leather/metal armor and helmet/backpack swaps.
- Stage V4: NPC diversity and their visible equipment.
- Stage V5: integrate real approved-style world props, UI, dialogue.
- Stage V6: optimize atlases for Android and validate actual screenshots.

Create branch `feature/radzone-paperdoll-equipment` or equivalent for implementation. All of the art branch's files belong to documentation and asset folders only.

**Do not claim a visualization is done until an equipped item shows in a verified Godot runtime capture and persists through save/load.**
