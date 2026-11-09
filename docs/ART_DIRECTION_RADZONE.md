# RADZONE — Approved Visual Direction (canonical v3)

**Public game name:** RADZONE. **Intended audience:** fans of Fallout 2 and classic tactical isometric RPGs.

## Approved visual target

The 10 realistic concept images in [Approved Visual Catalog](./art/APPROVED_VISUAL_CATALOG.md) replace the previous unapproved schematic/vector visual presentation. Keep the approved cinematic wasteland visual tone, aged metal controls, detailed armor and weapons, amber lamps, green CRT lettering, dense but readable mobile UI and long scrolling branching dialogue.

**Not all art is production-ready.** The approved concepts are visual targets, not gameplay screenshots. Earlier SVG sources and storyboard screens are now categorized as **experimental / non-approved**, with no loss of history.

## Core graphics requirements

- **Actual equipped items are visible** on player and NPC sprites, in idle, moving and combat states.
- Armor, helmets, masks, clothing, packs and weapons modify in-world appearance as appropriate for the equipped item ID.
- Rig and overlays support eight engine-facing directions and related animations without clipping, floating weapons or wrong z-order.
- NPCs include genders, age groups, face/skin/hair variation, silhouettes, occupations and outfit diversity. Children and the elderly must not just be recolored adult sprites.
- Nonhuman creature types use dedicated rigs when approved as game content.
- Retain all existing Godot game logic and rollback options; graphics integration is OpenCode's task, not a reason to rewrite mechanics.

## Palette / UI

`#0B0F0D` deep void, `#101A13` CRT black, `#A6E777` green phosphor, `#766953` aged bronze, `#A65D29` rust, `#E2AA56` amber, `#EDE4C8` parchment.

Dialogue: tactile bronze frame; green CRT text; long pages and touch scrolling. Values/AP/hit chance/quest text must be dynamic UI data, not pre-rendered. Controls usable on smartphones.

## Design system documentation

- [Approved Visual Catalog](./art/APPROVED_VISUAL_CATALOG.md)
- [Character & Equipment Visual Contract](./art/CHARACTER_EQUIPMENT_VISUAL_SPEC.md)
- [NPC Diversity](./art/NPC_VISUAL_DIVERSITY.md)
- [Production Workflow](./art/ART_PRODUCTION_WORKFLOW.md)
- [OpenCode Integration](./art/OPENCODE_ART_HANDOFF.md)
