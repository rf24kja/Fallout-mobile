# RADZONE — Scalable Visual Asset Production Plan (v1)

**Goal:** a catalog of at least **1,200 individually traceable visual asset subjects** over successive waves, beyond the 58 early v3.1 draft PNGs and the ten approved *visual target* concepts. The counts below are planning targets, **not produced-file counts or unique finished playable sprites**.

| Asset family | Subject target | Notes |
|---|---:|---|
| Interior world props | 160 | lootable furniture, machinery, household objects, terminals, shop interiors |
| Exterior / settlement props | 180 | ruins, structures, barricades, transport, market, street furniture |
| Terrain / nature / tile variants | 150 | ground, roads, cliffs, vegetation, water, debris, weathered surfaces |
| Weapons, ammunition, explosives | 125 | individual inventory illustrations and required world/hand variants |
| Armor, helmets, apparel, backpacks | 125 | item-specific equipment overlays and inventories |
| Consumables, medical, food, tools | 150 | individual readable inventory objects |
| NPC archetypes and creatures | 90 | unique cast/body silhouettes; required animation frames are separate |
| UI components, status icons, VFX | 120 | inventory, dialogue, barter, targeting, AP, interaction controls |
| Furniture/containers and loot markers | 100 | distinct container variants, interactive markers |
| **Total unique subject targets** | **1,200** | Subject planning count, not a count of final sprites |

## Scale realities

- 1,200 subjects is NOT the final frame count. Human characters need eight facing directions multiplied by idle/walk/attack/hit/death/reload frames, plus item-specific synchronized layers. Sprite-frame totals can reach tens of thousands.
- The game's existing canonical Fallout 2 gameplay IDs and data remain authoritative; this plan cannot silently rename, rebalance, or replace them. Any extra props/weapons are optional extensions.
- Source artworks should be produced as visually coherent small batches (typically six per sheet), then cropped, validated, published and indexed. **One sheet is not six production-ready sprites until independently checked.**
- Art quality bar: grounded cinematic retro-industrial post-apocalypse, physical materials and wear, legible at mobile size, consistent 35.264° / 45° isometric coordinates where needed; no flat schematic placeholders.
- For player/NPC layered animation use locked camera, shared canvas, fixed foot pivot, per-direction sockets, occlusion order, and item-ID mapping. Independent hero icons cannot replace overlays.
- All source files, alpha masks, manifests, approvals and engine QA are versioned separately. Avoid putting concept sheets in public README as finished gameplay.
- Never block OpenCode engine/Android work waiting for art. Integrate per approved slice with screenshot evidence and regression tests.

## Production queue

| Wave | Deliverable | Target |
|---|---|---|
| 01 | Interior / settlement / weapons concept source sheets | 18 subjects — generated, not yet imported |
| 02 | Indoor lootable furniture, scrap machinery, workshop | 30 subjects |
| 03 | Town street structures, transport, urban clutter | 30 subjects |
| 04 | Food/medicals/chems/tools inventory | 36 subjects |
| 05 | Weapon/equipment unique item silhouettes | 36 subjects |
| 06 | Terrain / debris / foliage variants | 36 subjects |
| 07 | Armor and headgear item concepts | 30 subjects |
| 08 | NPC silhouettes and portrait concepts | 24 subjects |
| 09 onward | Expand by area, map biome, story, and game item catalog | Until 1,200+ |

## Every-batch definition of done

1. Source-sheet files stored in Git with checksums and generator provenance.
2. Each individual subject cropped as genuine RGBA; no accidental neighboring item bleed.
3. Visual QA evidence and status recorded per subject.
4. Canonical gameplay item association only where actually mapped.
5. Perspective, pixel scale, alpha edges and ground pivot metadata.
6. No changed live Godot assets unless tested by OpenCode; no false Android verification claim.

**Source-of-truth distinction:** `docs/art/APPROVED_VISUAL_CATALOG.md` = art direction approval; `art/production/painterly_v3` = 58 older draft sources; `docs/art/production/RADZONE_WAVE_01.md` = new generated artwork requiring import. 
