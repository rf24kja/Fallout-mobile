# RADZONE — Game Art Production Library

**This is the visual assets pipeline, not the Godot gameplay source tree.** Concept art is archived separately; modular game assets are found here.

**OWNER GRAPHICS RULE (2026-11-10):** [Canonical graphics creation / approval / provider rules](../../docs/art/GRAPHICS_CANONICAL_RULES.md). New art: ChatGPT built-in image generator only. Runway and alternative providers are forbidden; draft posters are not assets.

| Group | Path | Source count | Status |
|---|---|---:|---|
| Retro UI pieces | [`ui/source/`](./ui/source/) | 19 | SVG source; Godot integration pending |
| Wasteland props | [`world/props/source/`](./world/props/source/) | 14 | Transparent isometric-inspired SVG draft assets |
| Inventory icons | [`items/icons/source/`](./items/icons/source/) | 17 | Transparent SVG draft icons |
| **SUBTOTAL — vector starter kit** | | **50** | Only editable SVG starter sources; NOT total art library |

## Other confirmed art sources on master (snapshot 2026-11-10)

| Group | Path | Files | Status |
|---|---|---:|---|
| Painterly v3.1 | [painterly_v3/](./painterly_v3/) | 58 PNG | Draft candidate cutouts / turnaround views; no Android approval |
| Painterly v4 | [painterly_v4/](./painterly_v4/) | 84 PNG | Multiple waves; draft and candidate graphics, some source sheets/variants |
| Cross-branch registry | [catalog/asset_registry.json](./catalog/asset_registry.json) | 161 logical records / 204 variants | Includes staged branches; NOT unique in-game item count |
| Approved UI concepts | [approved v2](../../github-assets/approved/v2/) | 10 WebP | Approved visual target, NOT game-ready UI |

Do not sum sources into unique item counts. The earlier 50 count referred **only** to SVG starter components. Review [duplicate audit](./catalog/AUDIT_2026-11-10.md) before adding work. No third-party Runway imagery may be published.

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
