# RADZONE — Environment Prop Sources v3

These are **original provisional 2D vector environment prop sources**. They are not screenshots, not photos, not original Fallout 2 game assets, and not final approved production paintings. They are usable as isolated SVG reference/source for a Godot texture pipeline.

## Coordinate convention

- Standard source canvas: **512 × 512 SVG**.
- Every object is isolated on a transparent canvas, with a subtle ground shadow where appropriate.
- Most objects are seen in **three-quarter isometric-inspired view**.
- Default ground anchor: **bottom center** (approx. `x=256,y=450`), but scene placement must be calibrated against the real TileMap.
- `road_tile_iso.svg` is an isolated diamond tile with natural perimeter transparency; for a real TileSet, match tile edge dimensions and eliminate seams.

## Files

- `supply_crate.svg`
- `rust_barrel.svg`
- `water_drum.svg`
- `concrete_barricade.svg`
- `sandbag_wall.svg`
- `scrap_pile.svg`
- `crt_terminal.svg`
- `generator.svg`
- `floodlight_pole.svg`
- `road_sign.svg`
- `bunker_door.svg`
- `water_pump.svg`
- `chainlink_fence.svg`
- `road_tile_iso.svg`

## Implementation instructions for OpenCode

1. Use existing `assets/environment/*` atlases as the runtime baseline; **do not overwrite them blindly**.
2. Export candidates to RGBA PNG at 1×/2× with a deterministic rasterizer and verify alpha.
3. Compare the actual Godot map scale, object pivot and lighting before import.
4. Verify there is no collision-shape mismatch or tile sorting issue.
5. Integrate candidates one by one only after visual inspection; keep the originals as fallback.

**Art status:** DRAFT / Provisional starter assets. The user's approved RADZONE concept art (v2) is the style reference, while these simpler vector props require refinement to match its painterly realism.
