# RADZONE — Initial Item Icon Sources v3

This directory contains **16 new original vector item illustrations**, each isolated on a **256×256 transparent SVG canvas**. There is **no baked item text, price, damage value or Fallout 2 item ID** in these icons.

These are **provisional starter source assets**, not final user-approved painterly production icons; the user's approved v2 gallery is the fidelity target.

## Items

- `10mm_pistol.svg`
- `hunting_rifle.svg`
- `combat_knife.svg`
- `pistol_ammo.svg`
- `shotgun_shells.svg`
- `medkit.svg`
- `stim_injector.svg`
- `canteen.svg`
- `gas_mask.svg`
- `backpack.svg`
- `radio_detector.svg`
- `scrap_gears.svg`
- `lockpick_set.svg`
- `bottle_caps.svg`
- `binoculars.svg`
- `bandage_roll.svg`
- `wrench.svg`

## How OpenCode should integrate them

- Compare icon subject to actual item DB **before** linking a specific entry. Do not assign an item's JSON ID using filename guesswork.
- Preserve all existing original stats, action costs and item behavior.
- Rasterize SVG to PNG 128×128 and 64×64 (optional 256×256 for inspection), with RGBA transparency and premultiplied-alpha quality check.
- Audit visual readability at 64 px and avoid shimmering in mobile UI. Set texture filter appropriate for the final pixel-art/high-resolution look.
- Store icon data links in an explicit mapping file **only after** verifying the current item database.
- Do not overwrite older icon textures until game integration tests pass.
