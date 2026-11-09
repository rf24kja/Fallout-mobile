# RADZONE — Graphics Pipeline & Publication Rules

## Scope

- User-approved **cinematic retro-CRPG concepts** define final game quality.
- Independent, isolated source graphics are produced in `art/production/` only after they meet the style target; older flat vector sketches are retained as **experimental references**, not game release assets.
- Every published file must say whether it is `approved_concept`, `draft_reference`, `candidate_asset`, `in_game_verified`, or `deprecated_experiment`.

## Directory semantics

```text
github-assets/approved/         // Public presentation, approved art ONLY
github-assets/approved/v2/      // 10 approved concept WebP previews
docs/art/reference/drafts/      // Generated turnarounds and item/world source sheets (unapproved)
docs/art/                      // Graphics requirements and QA
art/production/                // Individually usable source parts; drafts can remain here
art/archive/experimental/      // Documentation and provenance for legacy vector studies
screenshots/actual/            // Captures from running game ONLY
```

## Process

1. Map the real Godot resource or item/NPC ID. Inspect existing character/weapon atlasses and visual layer contracts.
2. Produce original reference art at the approved lighting, materials and isometric perspective.
3. **Human approval** before replacing baseline game art or showing new sources as final.
4. Produce isolated transparent PNG exports per component, not only a multi-object collaged sheet.
5. Record art source, content hash, size, canvas, alpha, orientation, rig/socket anchors, expected in-game pixel scale, animation mapping and draw order.
6. Validate 8-direction frames and alpha halos. Use deterministic source re-exports when corrections are needed.
7. Hand off to OpenCode. OpenCode must test the real imported art in Godot on Android with equipment changes.
8. Publish a genuine game screenshot only after the screenshot comes from the runtime; concept images must keep a *concept* label.

## Anti-patterns

- No simplistic SVG sketches as the GitHub project's visual showcase.
- No baked-in item stats, fixed HP/AP numbers or dialogue text inside skin textures.
- No one-size-fits-all human NPC sprite.
- No armor that changes numbers but leaves the displayed character unchanged.
- No character turnaround marketed as a complete 8-direction animated atlas.
- No overwriting original working assets and no unrelated game-code modifications in visual-only commits.

## Required GitHub checks

- Work on `art/*` branch, submit focused PR and merge without force.
- Verify links resolve and show the **approved** images after merge.
- Keep readable README language navigation with HTML `<a href>` anchors (Markdown in HTML paragraphs may render literally).
- Record approved concepts in [Approved Catalog](./APPROVED_VISUAL_CATALOG.md).
