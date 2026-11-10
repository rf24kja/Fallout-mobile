# RADZONE — Wave 14: isolated game graphics, not a concept poster

Three independent **actual RGBA game-asset candidates**, cropped and resampled from 1254×1254 newly created original item images. Contents are isolated on transparent backgrounds — these are NOT multi-item promotional sheets.

| Asset | Intended use | Game database | Production status |
| --- | --- | --- | --- |
| `reinforced_knee_guards` | armor component candidate (requires design decision) | **No existing canonical item ID** | staged, NOT a gameplay item |
| `plasma_rifle` | updated appearance for existing energy weapon | existing `data/weapons.json` ID `plasma_rifle`; intended `res://assets/ui/icons/plasma_rifle.png` | candidate only; no replacement |
| `water_purification_tablets` | survival inventory icon | existing `data/utility.json` ID `water_purification_tablets`; intended `res://assets/ui/icons/water_tablets.png` | candidate only; no replacement |

Each asset contains a transparent 64×64 icon, 128×128 icon, 256×256 world/inspect sprite, 512×512 inspection preview and WebP archive of the original generated artwork. Sizes are **downsampled** from source. `source_archive.webp` uses lossy WebP 92, not byte-perfect PNG; `manifest.json` includes original PNG SHA-256 and every saved derivative checksum.

## Godot QA

Open `res://scenes/art_preview/wave14_art_preview.tscn` in Godot 4.7.2 (Android design base). Inspect the actual 64px icons for legibility and the 256px sprites for color fringes/transparent borders. The scene exists only for art QA and does **not** modify the in-game character, equipment system, item registry, damage formula, UI or Android APK.

Run `python tools/art/validate_wave14.py` from the project root. Requires Pillow. Verify all three images in the Godot editor before merging. Never claim Android/runtime pass based on PNG validation.

## Duplication handling

`art/production/catalog/asset_registry.json` has been searched. The knee guards are new artwork with no confirmed old equivalent in manifest IDs; no global pixel-level exhaustive search was possible. Plasma rifle and water tablets already exist in gameplay; this batch records **new art candidates for two old IDs**, not two new RPG objects. The catalog is updated on this branch, pending review.

## Rights

Generated in ChatGPT for this project; commercial-use suitability and any similarity to recognizable game IP require review before release. No real-world manufacturing details or technical schematics are present.