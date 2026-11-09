# RADZONE — Locked Visual Consistency Contract (2026-11-09)

> **Owner feedback:** Generated art across waves has noticeably different styles. **Do not automatically accept, mix or integrate assets only because their PNG/alpha/hash checks pass.** This is a formal art-direction correction for all subsequent production.

## Single source of truth

The **10 user-approved cinematic RADZONE concept screens** in [APPROVED_VISUAL_CATALOG.md](../APPROVED_VISUAL_CATALOG.md) and `github-assets/approved/v2/` are the highest-priority visual references. Nothing generated subsequently overrides them without an explicit owner decision.

- **World/exploration:** `github-assets/approved/v2/06-exploration.webp`, `07-tactical-combat.webp`
- **Items/inventory:** `github-assets/approved/v2/05-inventory-icon-reference.webp`, `09-loot-container.webp`
- **UI/dialogue:** `github-assets/approved/v2/03-dialogue.webp`, `08-barter.webp`

The earlier lighter, detailed painterly item/environment sheets in local **Wave 02** are positive *process references* (readable objects, separated silhouettes, painted corrosion, brighter neutral material rendering). The owner's praise of Wave 02 background/alpha fixes does **not** mean every individual Wave 02 object is engine-approved. Do not change the reference hierarchy.

## Observed inconsistency: mandatory fix

1. **Wave 02:** mostly neutral, lighter material illumination; realistic volumetric objects with source-sheet white background; more believable standalone environmental and inventory stills.
2. **Wave 03:** more uniformly dark brown background and higher-contrast illustrated/outlined object treatment; flatter/inconsistent camera angles on several icons. Do **not** bulk-mix into the world until style-normalization review.
3. **Wave 01 / Wave 04:** built with a separate image generator and prompts; independent style drift remains possible even with “cinematic painterly” keywords.
4. Transparency errors are a separate issue from style: a perfectly alpha-masked sprite may still be drawn in the wrong style/perspective, and an apparently white original source sheet is not necessarily an incorrect final PNG.

**Status:** all pre-existing PNG assets remain `DRAFT_ART_PENDING_CONSISTENCY_REVIEW`; none is declared approved for gameplay integration simply because it was committed to GitHub. Keep them; do not delete working sources or pretend rejected artwork is game-ready.

## Visual rules, by asset family

### Shared visual DNA

- Mature, serious cinematic post-apocalyptic RPG, non-cartoony, grounded and physically plausible engineering.
- Weathered realistic materials (oxidized steel, patinated brass, worn leather, faded fabrics, stone, dust); no flat geometric plastic, chunky low-poly models or thick comic-book contour lines.
- Naturalistic soft directional illumination, generally from **upper left**. Preserve mid-tone texture and readability; avoid a single pervasive dark brown wash.
- Cohesive restrained earth/rust/olive/steel palette derived from reference screens, not from arbitrary color-filter overlays.
- True object-specific construction and visible damage, not copy-pasted style tokens or identical recolors.
- No baked UI labels, counterfeit brand marks, arbitrary watermarks, malformed pseudo-text or unwanted background elements.

### World props and tiles

- Consistent elevated *isometric-world* camera aligned with the actual Godot world projection. Project design target: approximately 35.264° elevation and 45° horizontal view where applicable; **verify actual playable camera and tile/grid scale before final export**.
- Ground foot/pivot, object height, consistent projection, collision and occlusion guides. Distinct props must look like inhabitants of the same scene at the same time of day.
- Generated source sheets should use no more than **3x2** subjects and generous empty margins; for thin, transparent or highly complex objects prefer **one subject per image**.
- Final export: separate genuine RGBA PNG with transparent background and genuinely transparent apertures, corrected edge spill/halo and deliberate ground contact shading.

### Inventory icons / equipment illustrations

- One isolated item per final image with recognizable silhouette at in-game icon size. A 3/4 hero item portrait may have a different presentation angle than a world prop; **do not confuse it with a handheld 8-way character animation layer**.
- Item appearance must match its in-game identity and mechanical item ID once mapped. No accidental Fallout trademark/logo use in newly created commercial artwork unless explicitly licensed/approved.
- Equipment on a player/NPC requires its own aligned direction/pose/socket/occlusion layers; inventory icon is not a substitute.

### UI panels / dialogue

- Reproduce approved ten-screen interface design. Preserve live Godot text, AP numbers, scrollable dialogue, clickable states, touch targets and responsive layout.
- Asset PNGs are skins/textures only, not static replacement screens showing imaginary game state.

## Non-negotiable review gate before publishing as production-ready

- `STYLE_MATCH`: compare at 100% and final Android display size against **the appropriate approved reference** (world / inventory / UI). Check silhouette, perspective, lighting, palette and painterly finish. **If substantially different: REJECT or REWORK, do not silently approve.**
- `MASK_PASS`: inspect alpha at transparent holes (straps, spokes, railings, gaps), edge antialiasing against white, black and checkerboard. Check for white/brown fringes, clipped tips and mistakenly deleted thin elements.
- `CONTENT_PASS`: check item identity, full object, no unwanted duplications, no misspelled or invented embedded text.
- `TECH_PASS`: record original source sheet, generated task ID, source cell, dimensions, sha256, item ID if mapped, perspective/ground anchor.
- `ENGINE_PASS`: after the prior four, OpenCode tests Godot integration and provides *real* Android capture; never infer it from a concept image or CI success.

All gates must be explicit and independently evidenced. A SHA-256 check validates file identity, **not artistic quality**.

## Credit / generator policy

- Stop spending **Runway** credits on blind batches or regenerations. The graphics tool's account balance is separate from ChatGPT image generation; do not conflate Runway with **Railway** deployment hosting.
- New generation can use built-in ChatGPT image tools when available, under their own product limits, and must reuse the relevant approved references.
- **Prefer fewer excellent, consistent, individually separable assets over dozens of inconsistent source-sheet crops.** Human-check a small representative set before scaling the next category.
- Continue programming and art catalog work while paid image credits are exhausted, rather than making more incongruent draft batches.

## Immediate decisions

1. Keep v3.1, Wave01 and Wave04 GitHub binaries as preserved **draft references** rather than presenting them as game-approved.
2. **Wave03 darker sheets**: flag for style-normalization review before any Godot import. No automatic mass import of Wave02/03 either.
3. **Wave05**: concept sheets generated but not binary-imported; do not mark done or spend more credits on them until normalized.
4. Subsequent production: select one specific reference family and validate consistency of a small candidate set, then produce matching variants with exact camera/lighting/material/export settings.

See [verified art delivery ledger](./production/ASSET_DELIVERY_LEDGER.md) for actual GitHub file counts versus pending waves.
