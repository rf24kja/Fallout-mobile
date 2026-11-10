# RADZONE / P0A — Player + Pistol Held in Hand — First Art Brief

**Classification:** `draft_reference` (until the user explicitly approves). **Priority:** P0A. **No finished image is claimed.**

## Target outcome

The existing Godot survivor holds the correct **existing database pistol** visibly and convincingly in combat and exploration. A single approved pose and correctly scaled weapon overlay forms the basis for eight-direction expansion. This is not another standalone cinematic product image, isolated inventory icon, or Blender mockup of blocks.

## Required reference hierarchy

1. Already-approved in `github-assets/approved/v2/06-exploration.webp` and `07-tactical-combat.webp` for in-world perspective and density.
2. `github-assets/approved/v2/05-inventory-icon-reference.webp` for material richness.
3. `docs/ART_DIRECTION_RADZONE.md` for palette and recognizable retro-CRPG look.
4. `art/production/painterly_v3/characters/player_survivor/` and `art/production/painterly_v3/items/pistol.png` as **unapproved drafts**, only after comparing their actual proportions and hashes.
5. Godot's current character sprite/layers, animation states and actual pistol ID are the technical source of truth.

**Do not derive the held gun from the last cinematic tabletop pistol if it conflicts with the canonical in-game item.**

## Art direction

Mature cinematic retro-industrial wasteland, worn utilitarian metal and leather, dust/rust concentrated in recesses, readable high-contrast silhouette at small screen scale; amber/bronze lighting with CRT green reserved for UI. Consistent 3/4 isometric camera and grounded perspective, no caricature, no colorful toy aesthetic. Keep player body anatomically plausible with distinct arms and hands; no fused gun/grip, floating trigger hand or ambiguous weapon muzzle direction.

## Exact deliverables (staged; do not alter approved or live paths)

- `art/staging/p0a/pistol_item_id.txt`: precise canonical item ID and source refs from database.
- `art/staging/p0a/reference_pose.png`: one clean reference pose of existing survivor holding weapon in an approved isometric view; transparent background if used for sprite production.
- `art/staging/p0a/weapon_overlay_<facing>_<animation>_<frame>.png`: **only genuinely aligned frames**, not fabricated directions.
- `art/staging/p0a/asset_manifest.json`: dimensions, alpha bbox, body anchor, hand grip, pivot, occlusion, provenance and hash per frame.
- `artifacts/art_review/p0a/`: contact sheet, original game screenshot, candidate screenshot and unresolved mismatches.
- `docs/art/P0A_INTEGRATION_TESTS.md`: real test commands and evidence.

Paths above are proposed deliverable names, **not existing files**.

## Technical consistency rules

- Facing names verified from `player.gd`; nominal set is `S,SW,W,NW,N,NE,E,SE`.
- No baked textual labels, stats, AP costs, muzzle flash or scene background in the weapon overlay.
- Match exact player sprite scale, hands, shoulder lines, floor pivot, z-order and existing frame pacing.
- Weapon must be removed on unequip and recover on save/load.
- Do not modify SPECIAL, combat accuracy/damage, ammo, item stats, quests, test assertions or save schema.
- Run `python tools/validate_art.py --require-alpha <candidate.png>` for actual transparent overlay.

## Visual review gate

Present a side-by-side with current world character in empty-hand state, equipped pistol state and a canonical approved concept crop. Test near-side and far-side hand occlusion. The user approves this single vertical slice before weapon catalog scale-up.

## Producer prompt (for a verified image model only)

> Create ONE isolated **production reference** of the existing RADZONE survivor from supplied approved RADZONE gameplay concepts and actual Godot character reference. Show a mature full-body wasteland survivor with a utilitarian pistol visibly gripped in the correct hand at the exact isometric direction supplied by Godot. Cohesive weathered dark metal, aged leather, canvas, dust and detailed realistic fabrics; believable weapon proportions; visible fingers wrapping the grip; readable silhouette at mobile scale. No environment, UI, captions, fake statistics, extra limbs, mismatched clothing, cartoon look or unrelated weapons. A clean alpha background if supported. This image is a guide to rigged layers, **not** an independently animated eight-direction sheet.

**Safety stop:** If no authorized and working provider is present, report `BLOCKED_PROVIDER` and continue auditing/aligning existing draft art; do not produce procedural placeholder geometry as final art.
