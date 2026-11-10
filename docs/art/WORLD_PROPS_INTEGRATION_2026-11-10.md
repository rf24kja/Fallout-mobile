# RADZONE — World Prop Prefabs: usable graphics with grounded anchors

**Status:** 14 instantiable Godot 4.7.2 Node2D prefab scenes created on PR #28 branch. **Not yet tested in running Godot.**

- [Catalog scene](../../scenes/art_preview/world_props_catalog.tscn) lays out all fourteen reusable props without altering the main menu.
- [Prefab scenes](../../scenes/world/props/painterly_v3/) reference the existing **real** transparent PNGs under `art/production/painterly_v3/world/`.
- [Machine-readable manifest](../../scenes/world/props/painterly_v3/MANIFEST.json) contains the PNG SHA-256 and actual alpha bounds.
- Each prefab has a manually inspectable `Art` Sprite2D with linear texture filtering, fixed origin by alpha bbox; ground contact is bottom center except for the road tile (center).
- No collision or y-sorting behavior was invented; OpenCode needs to test and add it where relevant for each level.

## OpenCode verification commands (PowerShell)

```powershell
git fetch origin
git switch art/pipeline-staging-20261110
# Run with installed Godot executable, adjusting its actual path:
& godot --headless --path . --editor --quit
& godot --headless --path . --check-only
```

**Critical check:** open `scenes/art_preview/world_props_catalog.tscn` in the editor and run it separately. Confirm all 14 art textures render with correct ground pivots, transparency, mobile scale and no z-sort glitches. Do not mark `IN_GAME_VERIFIED` until runtime evidence is available. The gallery is QA-only, not a real Fallout 2 location.

These are **actual reusable Godot scene resources**, not newly generated concept art or promised images. No production gameplay or existing art has been replaced.
