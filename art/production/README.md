# RADZONE — Game Art Production Library

**This is the visual assets pipeline, not the Godot gameplay source tree.** Concept art is archived separately; modular game assets are found here.

| Group | Path | Source count | Status |
|---|---|---:|---|
| Retro UI pieces | [`ui/source/`](./ui/source/) | 19 | SVG source; Godot integration pending |
| Wasteland props | [`world/props/source/`](./world/props/source/) | 14 | Transparent isometric-inspired SVG draft assets |
| Inventory icons | [`items/icons/source/`](./items/icons/source/) | 17 | Transparent SVG draft icons |
| **TOTAL** | | **50** | All source files on GitHub |

## Source vs visual reference

The approved **RADZONE v2** images define cinematic realism and classic Fallout 2-inspired UI. The SVGs here are a **functional starter component kit, not identical painted cutouts of those v2 images**. Their final visual fidelity requires further art iterations and Android runtime review.

- Approved screen concept PNGs (pending import): `docs/art/reference/RADZONE_APPROVED_v2/`
- Current published branding: `github-assets/radzone-hero.svg`, `github-assets/radzone-logo.svg`
- Source asset manifest: `docs/RADZONE_ART_SOURCE_MANIFEST.json`
- User-approved art rules: `docs/ART_DIRECTION_RADZONE.md`

## Export

```powershell
python -m pip install cairosvg Pillow
python art/production/tools/export_radzone_svgs.py --group world
python art/production/tools/export_radzone_svgs.py --group items
python art/production/tools/export_radzone_svgs.py --group ui
```

Output PNG files are written to per-group `exports/` directories. Check actual dimensions, anchors and readability, then copy **selected tested exports** into the correct Godot texture paths.

**IMPORTANT:** OpenCode owns engine integration. Never auto-replace the old functioning atlases or override their scripts/scene paths without in-game QA. These files include no game-critical names, stats or dialogue in textures; display them dynamically in Godot.
