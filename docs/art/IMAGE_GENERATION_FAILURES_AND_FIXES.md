# RADZONE — Image-generation failures: what happened, and how to avoid repeats

**Verified from the conversation and local work (2026-11-10).** This is not an API-level incident report; private provider logs are unavailable.

## Two separate failure classes

### 1. Tool argument validation failed
The prior image-generation invocation included `animation: {disabled: true, rows: 1, columns: 1, frame_count: 1}`. The tool schema requires `frame_count >= 2` for animation. **A static PNG should omit `animation` entirely.** This was a request-configuration error, not a content-policy refusal.

### 2. A generated image was rejected by automated safety filtering
The user saw the generic message about potentially unlawful activity. No precise triggering content was exposed. The result does **not** establish that developing RADZONE artwork is illegal; nor does it authorize claiming to know the filter's internal reason. The message is a failed-image result, not a stored game asset.

We cannot disable or override provider safety checks. For ordinary, legitimate RPG art, use precise, neutral object prompts and clear output requirements. If rejected, mark `BLOCKED_GENERATION`; don't retry indefinitely, don't switch to evasive wording, and don't claim success.

## Stable art-production call pattern

- First check `art/production/catalog/asset_registry.json` with `tools/art/asset_uniqueness_guard.py`.
- Specify **one canonical object**, its unique shape/function and usage in game (inventory, world prop or armor layer).
- For a static PNG, request a **single isolated object on a transparent background** with no typography, UI, branding, background vignette, character portrait, poster or progress counters. Do not request a collage.
- Keep a source file and model/provenance metadata separate from derived assets. Postprocess only after saving the real image bytes.
- Check PNG signature/decode/dimensions/transparency, trim bounding box, preserve consistent anchor, SHA-256 and actual small-size legibility.
- Check visual similarity against **real reference files**, not just filenames. If unavailable, report incomplete audit.
- Publish under a unique staging ID in GitHub. Do not map to a gameplay item ID automatically; no new stats or balance changes.
- OpenCode must import into Godot 4.7.2 and capture actual inventory/world/combat evidence before merging.

## Distinguish outcomes

| Situation | Status | Truthful next action |
| --- | --- | --- |
| Wrong static/animation arguments | `INVALID_REQUEST` | Correct arguments and retry once |
| Safety-filter refusal | `BLOCKED_GENERATION` | Report refusal; use existing cleared art or different authorized task |
| Image API unavailable or credentials absent | `BLOCKED_PROVIDER` | Continue code and tooling; do not fabricate an image |
| Image exists but not approved | `ART_CANDIDATE` | Save original, record provenance, visual QA |
| Looks similar to catalog | `DUPLICATE_REVIEW` | Mark as variant or reject new-object claim |
| PNG passes file checks only | `PNG_VALIDATED` | Still requires Godot and Android testing |
| User-accepted + in-game tested | `APPROVED_FOR_PRODUCTION` | Promote using reviewed PR |

**Do not upload or label a refused, missing, promotional, watermarked, or unsuitable image as a finished game asset.**
