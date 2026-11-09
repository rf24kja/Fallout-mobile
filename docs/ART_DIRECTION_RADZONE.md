# RADZONE — Approved Visual Direction (v2)

**Approved:** 2026-11-09  
**Public game title:** **RADZONE**  
**Gameplay/style reference:** Fallout 2 (classic 1990s isometric post-apocalyptic CRPG).  
**Developer roles:** OpenCode handles gameplay/Godot; ChatGPT produces original visual concepts and source art.

## Non-negotiable style

- Realistic cinematic post-apocalyptic settlements, rust, grit, dusk, deep environmental detail and consistent isometric world art.
- Classic Fallout 2-inspired controls: industrial weathered brass/steel, rivets, distressed bronze panels, 1990s CRT terminal green, amber selected buttons.
- Dialogues use long, **touch-scrollable** multi-paragraph green-text display windows with dynamic responses.
- SPECIAL, skills, AP, called shots, inventory, barter, loot, world map and quest log keep dense information presentation optimized for phones.
- Palette: void `#0B0F0D`; CRT `#101A13`; phosphor `#A6E777`; bronze `#766953`; rust `#A65D29`; amber `#E2AA56`; bone `#EDE4C8`.
- All game values and dialogue are live Godot controls, **never baked into runtime UI texture art**.
- Previous **REBORN MOBILE** visual direction is superseded. Do not delete working placeholders until replacements pass actual device testing.

## Approved concept library

Ten user-approved 941×1672 PNG screens are prepared for publication under `docs/art/reference/RADZONE_APPROVED_v2/`:

1. `01-main-menu.png`
2. `02-character-special.png`
3. `03-dialogue.png`
4. `04-world-map-quests.png`
5. `05-inventory-icon-reference.png`
6. `06-exploration.png`
7. `07-tactical-combat.png`
8. `08-barter.png`
9. `09-loot-container.png`
10. `10-skills-perks.png`

**These are CONCEPT ART / UI MOCKUPS, NOT real screenshots from a playable Android build.** Generated labels, quest names, values, hit chances, skill allocations and lore are illustrative; original mechanics must be established through game evidence, not through art.

## Repository ownership and production paths

- `docs/art/reference/RADZONE_APPROVED_v2/`: full-resolution approved concept PNGs, visual reference only.
- `github-assets/screens/`: optimized WebP for README presentation.
- `art/production/ui/source/`: separately usable editable UI SVGs.
- `art/production/ui/preview/`: corresponding rendered component previews.
- `art/production/items/`: verified item-ID-linked inventory/inspection graphics.
- `art/production/characters/`: 8-direction character sources and sprite sheets.
- `art/production/world/`: ground, structures and props.
- `screenshots/actual/`: **real** screenshots captured from Godot, clearly labeled.

## Development handoff

OpenCode must inspect real Godot scene nodes and state bindings before integrating assets. Build a reusable RADZONE Theme, scrolling dialogue widgets, dynamic stats/AP displays, and 9-slice panel textures. Do **not** place entire promotional concept screens into playable game scenes.

**Publication status:** The first GitHub commit publishes the visual standard and graphic toolkit. The large 35 MB asset archive is distributed separately for import; never link non-existent image paths or claim binary files were pushed without a GitHub commit verification.
