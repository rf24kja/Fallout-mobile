# RADZONE — Full-Resolution Image Publication

The user-approved **RADZONE v2 archive** was assembled on 2026-11-09. The ten images are 941×1672 PNGs, each approximately 2.7–3.4 MB.

## Upload target (exact paths)

- `docs/art/reference/RADZONE_APPROVED_v2/01-main-menu.png`
- `docs/art/reference/RADZONE_APPROVED_v2/02-character-special.png`
- `docs/art/reference/RADZONE_APPROVED_v2/03-dialogue.png`
- `docs/art/reference/RADZONE_APPROVED_v2/04-world-map-quests.png`
- `docs/art/reference/RADZONE_APPROVED_v2/05-inventory-icon-reference.png`
- `docs/art/reference/RADZONE_APPROVED_v2/06-exploration.png`
- `docs/art/reference/RADZONE_APPROVED_v2/07-tactical-combat.png`
- `docs/art/reference/RADZONE_APPROVED_v2/08-barter.png`
- `docs/art/reference/RADZONE_APPROVED_v2/09-loot-container.png`
- `docs/art/reference/RADZONE_APPROVED_v2/10-skills-perks.png`

Place optimized preview WebPs under `github-assets/screens/` using the same numbered filenames and `.webp` extension. Include `github-assets/RADZONE_gallery_v2.webp` and `docs/RADZONE_ART_MANIFEST.json` from the same archive.

## Import with existing local Git

1. Extract `RADZONE_Visual_Development_v2_2026-11-09.zip`.
2. Use the package's `PUBLISH_RADZONE.cmd` / `publish_radzone.ps1` from Windows with your authenticated Git.
3. That publisher creates a **different** branch `art/radzone-approved-v2` from `master`, uploads images, README translations and docs, and verifies the pushed commit.
4. Inspect the diff and merge that branch to `master` when ready; do not force-push.
5. Recheck all README image paths before marking the final gallery published.

> Never publish original installed game archives or release signing keys. The v2 image files are concept artwork, not runnable assets or captured gameplay screenshots.
