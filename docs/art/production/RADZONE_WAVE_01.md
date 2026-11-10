# RADZONE art production — Wave 01 (2026-11-09)

## Scope

18 **newly generated** cinematic source-art subject concepts, grouped in three six-object sheets. This is a genuine new art-production wave, not a repeat of the 58 PNGs in painterly_v3. The generator accepted all three tasks and subsequently reported completed image artifacts. **The assets have not yet been cropped, alpha-masked, quality-approved, imported into Godot, or committed as PNG files.** Production status: `GENERATED_SOURCE_SHEET_PENDING_IMPORT`.

The concept sheets were generated using existing approved RADZONE visuals as stylistic references:
- exploration concept: `github-assets/approved/v2/06-exploration.webp`
- inventory concept: `github-assets/approved/v2/05-inventory-icon-reference.webp`

Reference: `docs/art/APPROVED_VISUAL_CATALOG.md`. The outputs are original newly generated source assets, not Fallout 2 source-game sprites.

## Three newly generated source sheets

| ID | New subjects (6 each) | Generation task ID | State |
|---|---|---|---|
| RW01-INT | vending machine; scrap workbench; 1950s refrigerator; steel locker; potbelly heater; medical cabinet | `8bc9142f-cdcd-4362-b2b1-c79dca729fcd` | Generated; import pending |
| RW01-EXT | rusty compact car; salvage market stall; water tower; dead desert tree; abandoned bus shelter; fortified scrap shack | `2ac8705a-8cf9-44d4-bf9b-28144e137af9` | Generated; import pending |
| RW01-WPN | heavy .44 revolver; compact SMG; pump shotgun; sledgehammer; industrial laser pistol; fragmentation grenade | `48d0cbc5-f4d2-45a0-bfef-aa6805f52456` | Generated; import pending |

## Intended individual file paths — do not mark as published yet

```text
art/production/painterly_v4/source_sheets/
    rw01_interior_sheet.png
    rw01_settlement_sheet.png
    rw01_weapons_sheet.png

art/production/painterly_v4/world/interior/
    vending_machine.png
    scavenger_workbench.png
    refrigerator.png
    steel_locker.png
    potbelly_heater.png
    medical_cabinet.png
art/production/painterly_v4/world/settlement/
    abandoned_compact_car.png
    salvage_market_stall.png
    wasteland_water_tower.png
    dead_desert_tree.png
    abandoned_bus_shelter.png
    fortified_scrap_shack.png
art/production/painterly_v4/items/weapons/
    heavy_revolver.png
    compact_smg.png
    pump_shotgun.png
    sledgehammer.png
    laser_pistol.png
    frag_grenade.png
```

## Required production finish

1. Retrieve original source-sheet PNGs from the generation task assets using the authenticated Runway workspace; keep originals unchanged.
2. Inspect sheets visually to ensure the exact subjects and full silhouettes match this table. Do not infer success of individual subjects from a completed sheet generation.
3. Crop 3x2 cells accurately, remove neutral backgrounds to RGBA without haloes; retain alpha and use uniform padding. **Do not treat grid crops as in-game sprite assets automatically.**
4. QA each image for missing edges, repeated objects, unwanted baked text, perspective mismatch, scale, feet/ground anchor, contact shadows, compressed micro-details and resemblance to third-party protected designs.
5. Add dimensions, source-task ID, crop rectangle, SHA256, Git blob ID, quality status and optional item IDs to a versioned JSON manifest.
6. Godot runtime owner (OpenCode) reviews integration readiness in a separate branch. Do not alter working sprite resources or game logic in this art wave.

The generation outputs are available in the connected workspace by their recorded task IDs. Provider asset URLs may expire; do not consider remote provider URLs a permanent source archive. **Only Git-committed binaries plus hashes count as delivered repository files.**

## QA flags

`GENERATED_SOURCE_SHEET_PENDING_IMPORT` → `CROPPED_PENDING_VISUAL_QA` → `SOURCE_APPROVED` → `ENGINE_CANDIDATE` → `ANDROID_VERIFIED`.

Retain original `painterly_v3` sources and the ten approved v2 concepts. This wave is isolated and non-destructive.
