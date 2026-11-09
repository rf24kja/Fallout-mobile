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


## Latest available art-source package — painterly v3.1

The **complete 58-image draft pack** is published at [art/production/painterly_v3/](../../art/production/painterly_v3/), alongside a [machine-readable source manifest](../../art/production/painterly_v3/RADZONE_GITHUB_MANIFEST.json) and [five original reference sheets](./reference/drafts/v3/README.md).

- **16 static character turnaround crops:** survivor (8), raider (8); **not animated sprites** and not yet mapped to engine N/NE/E/SE/S/SW/W/NW.
- **15 isolated item/equipment illustration crops:** **not yet mapped** to canonical item database IDs.
- **14 isolated world-prop illustration crops:** no approved scene scale, collision or z-sorting.
- **13 retro UI visual components:** need alpha cleanup, nine-slice and touch testing.

The GitHub landing page intentionally displays **only ten approved cinematic concept screens**. The v3.1 assets remain marked **DRAFT / review required**. Do not replace existing real Godot resources automatically with them.

**Critical distinction:** a pistol inventory icon or static turnaround cannot satisfy visible weapon-in-hand functionality. OpenCode must use the paperdoll equipment system and produce aligned hand-weapon overlay frames per item, animation and direction; check armor, backpack and helmet variants for player **and NPCs**.

## OpenCode first actionable milestone

1. Inspect actual CharacterVisual layer paths and Player equipment synchronization. Prove which item IDs currently change appearance and which only change stats.
2. Choose **one existing player rig and one pistol ID**. Build an explicit weapon/grip/socket map for 8 directions and valid idle/attack frames. Keep the original Godot sprites until tested.
3. Export the v3.1 references only as visual source, **not** runtime replacements. Create new production-quality matched overlays and record pivot/alpha/anchor/occlusion.
4. Demonstrate equip / unequip / weapon swap in an Android runtime screen capture; verify reload, save/load and scene change maintain visuals without changing original combat stats.
5. Continue with armor and NPC diversity after the first complete vertical slice passes tests.
