# RADZONE — Visual Art Handoff for OpenCode

## Source of truth
The public product name is **RADZONE**. The previous REBORN MOBILE branding is superseded. The baseline visual direction is defined in [ART_DIRECTION_RADZONE.md](./ART_DIRECTION_RADZONE.md).

## Repository ownership
**ChatGPT:** visual references, original image production, editable art sources, thumbnails, documentation.  
**OpenCode:** Godot game code, scenes, import scripts, UI data binding, gameplay, builds, QA and real device captures.

## File taxonomy
- `github-assets/`: marketing banner, logo and README previews only.
- `docs/art/reference/RADZONE_APPROVED_v2/`: approved **full-resolution PNG concept art** (10 images, to be uploaded).
- `art/production/ui/source/`: separate UI source parts and panels.
- `art/production/ui/preview/`: exports and non-editable previews.
- `art/production/items/`: item-ID-based sources and image exports.
- `art/production/characters/`: eight-direction sprites and animation atlases.
- `art/production/world/`: environment tiles and props.
- `screenshots/actual/`: real screenshots captured from a running Godot build only.

## Engine integration rules
1. Keep engine behavior intact; integrate graphics by replacing textures/themes, not RPG mechanics.
2. Use separate `PanelContainer`, `NinePatchRect`, `RichTextLabel`, `ScrollContainer`, `TextureButton`, etc.
3. All AP values, hit chances, quest text, player stats, item names and dialogue options are runtime data. **Never extract them from image mockups.**
4. Test Android touch, safe areas, scrollable long-form dialogues and minimum 44–48 dp targets.
5. Import source PNG/SVG into Godot; choose appropriate filtering, mipmaps and nine-slice margins.
6. Do not use a full-screen AI concept illustration as a functional scene.
7. Integrate on a dedicated feature branch and commit only changed implementation files and matching assets.
8. Rename Android package/save namespace only as separate migration with tests.

## Asset status
The current GitHub README includes vector branding and a layout storyboard. The 10 large user-approved concept PNGs and WebP gallery are packaged as `RADZONE_Visual_Development_v2_2026-11-09.zip` and require a separate binary upload. **Do not claim they are present until the remote files are verified.**
