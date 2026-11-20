# RADZONE — Industrial Prop Sprites v1 (actual PNG art)

**Twelve individual transparent PNG files (256×256), not a concept collage.** Extracted from owner-supplied illustrated source; no image-generation API or paid service used.

- [12 PNGs](./) and [manifest](./MANIFEST.json) with SHA-256 + alpha bounding boxes.
- [12 reusable Godot scenes](../../../scenes/world/props/industrial_v1/) with alpha-based ground pivot.
- [Godot preview scene](../../../scenes/art_preview/industrial_props_catalog.tscn) to visually inspect all twelve.

Image QA: signature/decodability, 256×256 dimensions, transparent pixels and SHA-256 of each file checked prior to publication. The ground anchor is at source texture pixel (128,248). Godot and Android runtime tests are **not yet executed**. Scenes have **no assumed collisions, navigation or interaction scripts**. Separate user approval for production usage still required.

Do not confuse the source's 3×4 item collection with a working game scene. These PNGs ARE distinct raster game-texture candidates; they are not demonstrated in Godot yet.
