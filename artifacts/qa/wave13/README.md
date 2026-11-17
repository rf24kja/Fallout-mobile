# Wave13 settlement props — visual review evidence (2026-11-17)

Review artifact for the owner's merge decision. **Nothing here merges the branch.**
The branch `origin/art/radzone-wave13-settlement-props` was left untouched.

## What was reviewed

| Item | Value |
|------|-------|
| Branch | `origin/art/radzone-wave13-settlement-props` |
| HEAD | `c98ef27` — `test(art): document Wave13 PNG and Godot static resource checks` |
| Files vs `master` | 36 files, +920 |
| Props | 10 prefabs in `scenes/world/props/wave13/*.tscn` |
| Textures | 20 PNG (128 + 256) in `art/production/painterly_v4/wave13/objects/` |
| Review scene | `scenes/art_preview/wave13_worldprops_review.tscn` |
| QA report | `art/production/painterly_v4/wave13/QA_REPORT_2026-11-10.json` |
| Manifest | `art/production/painterly_v4/wave13/manifest.json` — `status: CANDIDATE_NOT_IN_GAME_VERIFIED` |
| Validator | `tools/art/validate_wave13.py` |

## Method

The branch was checked out into the working tree, `godot --headless --path . --import`
was run to build the import cache, then two captures were taken with Godot 4.7.2
(non-headless, OpenGL 3.3, 1280x720):

1. `wave13_worldprops_review.png` — the branch's own shipped review scene, unmodified.
2. `wave13_world_scale.png` — a throwaway scene instancing all 10 prefabs on a ground
   plane in a 2x5 layout, to judge real-world scale and alpha against a background.

## Findings

**Renders correctly.** All 10 prefabs instantiate and draw. Each is
`Node2D` → `Sprite2D` with `texture_filter = 2`, `offset = Vector2(0, -120)` and a
256x256 texture. No missing-texture errors, no error spam.

**Alpha is clean.** No opaque boxes, no halo fringes, no background bleed on either
capture. The QA report's `transparent border` / `RGBA alpha` checks hold up in-engine.

**Style is consistent.** Rust/teal/brass palette, cohesive painterly treatment, reads as
one family. Matches the RADZONE direction in `docs/ART_DIRECTION_RADZONE.md`.

**Scale reads small.** At 256px native the props occupy roughly 100-150px of a 1280x720
frame (see `wave13_world_scale.png`). Plausible for scatter props, but no collision,
occlusion or gameplay-scale validation was performed — the branch has no collision
shapes at all (prefabs are `Node2D` + `Sprite2D` only).

**Branch's own caveats (from `QA_REPORT_2026-11-10.json`):**

- `classification: CANDIDATE_NOT_IN_GAME_VERIFIED`
- `not_tested`: Godot 4.7 scene runtime, Android emulator/device, collision,
  occlusion / correct world scale, commercial art rights
- `256px variants are upscaled from smaller source-crop regions; not truly native 256px detail`
- `source_art`: "10 crops from one freshly generated poster (not 42 independent original assets)"
- `generation_method`: "Isolated crops from one ChatGPT-generated montage, automatic
  GrabCut alpha extraction plus manual cleanup; NOT 10 independently generated assets"
- note: "Do not merge without in-engine screenshots and user art review."

The in-engine screenshots requested by that note are exactly the two files in this
directory.

## Recommendation

**Visual candidate accepted as draft; not approved for production.**

- The art is good enough to proceed to integration, and the 10 prefabs are ready to
  instance into a real scene.
- Per `docs/art/production/ASSET_DELIVERY_LEDGER.md` and
  `docs/art/VISUAL_CONSISTENCY_CONTRACT.md`, `GITHUB_COMMITTED` implies no production
  approval, and the manifest itself says `CANDIDATE_NOT_IN_GAME_VERIFIED`. Do not
  relabel these assets.
- Before production use, still required: owner art review sign-off, collision/occlusion
  work (the prefabs have none), and an Android runtime check.

## Status

Draft art only. Not `production_approved`. Not Android-validated. Branch not merged.
