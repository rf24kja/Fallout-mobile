# RADZONE — Wasteland objects / wave 12

**Status:** `CANDIDATE_ART` — actual transparent PNG game resources in GitHub, **not yet verified in running Godot or Android**. This update adds NO fake animations or gameplay changes.

## Contents

- **10 distinct art subjects**, including **2 modular derivatives of the same roadblock illustration** (the mixed barrier, bare concrete barrier, and tire stack are not three independently illustrated concepts).
- **26 raster RGBA PNG files**, at 64/128/256 px for personal items and 256/384 px for environment props.
- **4 instantiable Godot Node2D + Sprite2D prefab scenes**, one for each world prop.
- **1 isolated 1280×720 visual review scene** for Godot.
- **1 contact sheet** to inspect visually; never substitute it for sprites.
- **1 provenance manifest** with per-file SHA256, alpha bounding box and exact source crop.

## Real subjects

Portable radiation meter, retro CRT terminal, rolled field/surgical tools, scavenger backpack, field boots, helmet with goggles, blue jumpsuit jacket, roadside barrier with tires, standalone concrete block and tire stack.

## Pipeline

Original input: user-provided RGBA sheet `Постапокалиптический арсенал выжившего.png`. Images were cropped, alpha-isolated, resized, and exported as independent PNGs; the source image is not newly generated in this wave. Further validation requires both **copyright review** (some references resemble established game IP) and **runtime art QA**.

- `python tools/art/validate_wave12.py` checks PNG signature, decoding, RGBA, dimensions, alpha and SHA256. This does not assert visual quality.
- In Godot 4.7, open `scenes/art_preview/wave12_worldprops_review.tscn`, check scale, filtered vs nearest edges and floor pivots. It is intentionally not the active game map.
- Place prefabs from `scenes/world/props/wave12/` in a sandbox only; collisions/interaction remain unspecified pending the real game scale.
- Do **not** silently map these candidate inventory illustrations to unrelated item IDs or override existing sprites; integration must follow an item ID and visual approval.

**No GitHub Actions workflows or external paid compute are required for this asset import.**