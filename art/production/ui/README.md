# RADZONE — Provisional UI Component Library

This folder contains **19 original editable SVG source graphics** in the RADZONE style.

All panels intentionally contain **no embedded dialogue, numbers, stats or button captions**. The Godot integrator should place dynamic text/control nodes on top.

## Integration

Use `NinePatchRect` / `StyleBoxTexture` for panel borders, `TextureButton` for the three visual states, and your existing Godot AP controller for individual AP indicator textures. Validate corner margins against each SVG's actual border thickness. Convert to raster PNG if the current engine export toolchain handles SVG poorly.

These are **provisional vector UI skins** inspired by the user-approved v2 concept visuals, not final approved exact painted cutouts. Check them in Android portrait UI before changing production scenes. Do not delete or overwrite working placeholder art until replacements are tested.

User approved reference artwork (PNG/preview WebP) will be added separately under `docs/art/reference/RADZONE_APPROVED_v2/` and `github-assets/screens/`.
