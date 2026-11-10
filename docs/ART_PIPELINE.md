# RADZONE / Fallout 2 Reborn Mobile — Art Pipeline

Status: **DRAFT — NON-DESTRUCTIVE — USER APPROVAL REQUIRED** (2026-11-10)

## Authority and scope

The GitHub repository `rf24kja/Fallout-mobile` already contains user-approved RADZONE concept art under `github-assets/approved/`. **Those approved visuals, not any new unapproved pistol image, define the current visual direction.** Read `README.md` and `README.ru.md` before making proposals. Do not replace or mislabel approved concepts as screenshots.

Preserve all game logic, save compatibility, SPECIAL, DT/DR, item stats, quest data, existing animations, Android exports and working placeholder resources. Do not change import paths, resource IDs, or atlas mappings without a reviewed migration.

## Distinct asset stages

1. **Style reference** — establishes atmosphere; not a usable sprite. A previously generated cinematic rusty pistol image exists in ChatGPT but has not been committed here or approved as a RADZONE asset.
2. **Hero concept** — an original production candidate. Must be reviewed against already approved RADZONE visuals before further work.
3. **Isolated canonical object** — clean background/alpha, complete silhouette and coherent mechanical geometry; consistent views and labels.
4. **Production views** — derive fixed-direction sprites from the **same coherent source** (ideally a validated 3D/PBR model), not from unrelated generative perspectives.
5. **Inventory icons** — derived from approved isolated art; exact sizes obtained from repository source.
6. **Atlas and import** — use actual Godot resource conventions, pivots, frame bounds, padding and import filters.
7. **In-engine preview** — show inventory, equipped sprite and combat in real Godot captures; preserve before/after evidence.
8. **Android checks** — existing unit tests, Godot headless validation and device/emulator smoke test prior to promotion.

## Grounded parameters

`project.godot` on master currently specifies a 1280×720 viewport, landscape orientation, Godot 4.7 feature target, `gl_compatibility` renderer and nearest 2D texture filtering. **Verify current branch and actual game usage before applying.** Sprite size, atlas size, item ID, animation direction names and pivot anchors MUST be discovered from source; do not assume historical 2048×2048 atlases or 128/64 icons are still authoritative.

## Approval workflow

`STYLE_REFERENCE_ONLY` → `CONCEPT_CANDIDATE` → `PENDING_USER_APPROVAL` → `APPROVED_FOR_STAGING` → `QA_PASSED` → `APPROVED_FOR_PRODUCTION`.

`BLOCKED_PROVIDER` and `QA_FAILED` are terminal statuses for the affected attempt, not reasons to alter existing working assets.

Never auto-approve, auto-merge or mass-produce an asset from the first visually convincing image. Use a feature branch, record precise provenance and rollback path. Approved artwork must not be silently overwritten.

## Acceptance checks

- PNG file signature, decodability, pixel dimensions and SHA-256 validated.
- Actual gameplay sprite has an alpha channel and transparent pixels, is not clipped, and has no baked environmental background.
- All required angles have consistent mechanical proportions, lighting, material and direction anchors.
- Item identity and stats match existing repository IDs.
- At least one real before/after inventory + combat screenshot is inspected by user.
- Commercial-use terms documented for the precise generator/provider/version, where applicable.
- Godot headless import, tests and Android smoke tests pass on the actual branch.

## Provenance manifest

For every candidate, store: `source_art`, `provider`, `model`, `prompt_or_prompt_hash`, `generation_date`, `input_reference_hashes`, `dimensions`, `sha256`, `license_notes`, `item_id`, `status`, and `approved_by` (null until explicit approval).

No generated image is part of this documentation PR. OpenCode must first identify whether a working, authorized generator exists; otherwise report `BLOCKED_PROVIDER` and continue code/QA tasks.
