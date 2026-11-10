# RADZONE — Verified Art Publication Ledger (2026-11-10, Wave11)

This ledger distinguishes **files actually committed to master** from generated art still held in temporary creative workspaces or ChatGPT ZIP archives.

## Verified image binaries on GitHub master

| Package | Individual RGBA PNGs | Source image sheets | Status | Evidence |
|---|---:|---:|---|---|
| painterly v3.1 | 58 | 6 WebP references | `GITHUB_COMMITTED / ART_DRAFT` | [production/v3.1](../../../art/production/painterly_v3/) — PR #8, commit `d0d49d3` |
| Wave 01 | 18 | 3 PNG originals | `GITHUB_COMMITTED / AUTO_MASK_DRAFT` | [wave01](../../../art/production/painterly_v4/wave01/) — PR #13, binary commit `dd169f4` |
| Wave 04 | 12 | 2 PNG originals | `GITHUB_COMMITTED / AUTO_MASK_DRAFT` | [wave04](../../../art/production/painterly_v4/wave04/) — PR #12, binary commit `99a9b3c` |
| Wave 03 unique-only | 7 | Source held in conversation | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave03_unique](../../../art/production/painterly_v4/wave03_unique/) — PR #18 |
| Wave 06 unique-only | 3 | Source held in conversation | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave06_unique](../../../art/production/painterly_v4/wave06_unique/) — PR #17 |
| Wave 07 — new unique subjects | 7 | Original source sheet in conversation ZIP | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave07](../../../art/production/painterly_v4/wave07/) — PR #20 |
| Wave 08 medicine loot icon | 1 | Owner-supplied sheet, source not committed | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave08](../../../art/production/painterly_v4/wave08/) — PR #23; CI both duplicate gates pass |
| Wave 09 surgical instruments | 1 | Owner-supplied sheet, source not committed | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave09_unique](../../../art/production/painterly_v4/wave09_unique/) — new surgical instrument kit; CI gates | 
| Wave 10 — salvaged field duffel | 1 | Owner-supplied source sheet, not committed | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave10](../../../art/production/painterly_v4/wave10/) — one isolated distinct carry-bag subject; CI gates | 
| Wave 11 — distillation still and opened bean can | 2 | Owner-supplied source sheets, not committed | `GITHUB_COMMITTED / TRUE_RGBA_DRAFT` | [wave11](../../../art/production/painterly_v4/wave11/) — previously drawn still and isolated open canned beans, CI gates |\n| **Total verified individual PNGs** | **110** | **5 additional original source PNGs** | **All still require visual QA/engine validation** | |

The **110 files are illustration crops / references**, not 110 verified unique canonical Fallout 2 items, not thousands of completed animation frames and not in-game Android screenshots. Some represent similar types or variant treatments.

## Generated/delivered but NOT on GitHub master

| Package | Generated subjects | What exists | GitHub state |
|---|---:|---|---|
| Wave 02 | 18 | ZIP in ChatGPT conversation, with individual PNGs, original sheets, alpha QA and hashes | **Not binary-uploaded**; [handoff](./RADZONE_WAVE_02_IMPORT.md) |
| Wave 03 remaining | 17 of original 24 | ZIP in ChatGPT conversation; 7 distinct PNGs have now been committed | **Remaining 17 not uploaded** (duplicates or artwork with potentially protected identifiers); [handoff](./RADZONE_WAVE_03_HANDOFF.md) |
| Wave 05 | 12 | Two earlier generated original sheets for clinic + agriculture; importer in `art/radzone-wave05-binary-publication` | **Not binary-uploaded**. Do not spend new Runway credits or count as committed sprites. |
| Wave 06 remaining | 9 of original 12 | Archive retained in ChatGPT, only 3 genuinely new subjects selected and uploaded | **9 duplicates intentionally excluded**; see [wave06 unique manifest](../../../art/production/painterly_v4/wave06_unique/manifest.json) |

## Mandatory quality gates

1. **Source generated:** the image exists; a generated sheet of six items does not mean six clean RGBA objects.
2. **Transparent extraction:** verify external and **internal** holes, antialiasing, no white fringe or missing thin elements. Numeric alpha tests alone do not guarantee good art.
3. **Human visual QA:** inspect every cutout at 100% and on both dark and light backgrounds; reject any poor edges or incomplete silhouettes.
4. **Canonical ID and orientation mapping:** link only confirmed source-game item IDs. Isometric perspective, scale, pivots, and attachment sockets must match Godot.
5. **Engine candidate:** integration in isolated OpenCode branch, without replacing working assets prematurely.
6. **Android verified:** real device screenshot and tests showing correct visuals for armor, weapons and NPCs; only then label runtime-verified.

No permanent production approval is implied by the status `GITHUB_COMMITTED`.

## Source of truth and responsibilities

- [Approved user-facing art direction](../APPROVED_VISUAL_CATALOG.md) — visual target; not real gameplay.
- [1,200-subject production plan](./RADZONE_1200_ASSET_PLAN.md) — planning target, NOT delivered count.
- [Wave 01 original handoff](./RADZONE_WAVE_01.md) — includes earlier generated task IDs.
- [Wave 01 committed binary manifest](../../../art/production/painterly_v4/wave01/manifest.json) — exact 18 paths/hashes.
- [Wave 08 single candidate manifest](../../../art/production/painterly_v4/wave08/manifest.json) — true RGBA draft, no claim of Android approval.
- [Wave 04 committed binary manifest](../../../art/production/painterly_v4/wave04/manifest.json) — exact 12 paths/hashes.
- [Visible equipment OpenCode issue](https://github.com/rf24kja/Fallout-mobile/issues/7) — real sprites and Godot/Android integration are separate tasks.

**Do not publish the draft painterly images to README as screenshots.** The ten approved cinematic concepts remain the only homepage visuals until actual gameplay visuals are tested.
