# RADZONE — Painterly v4 / Wave 02 production handoff (2026-11-09)

## Completed source-art work

An additional **18 distinct image-generation source crops** have been prepared as **individual RGBA PNGs** from three newly generated 1672×941 source sheets. This is an actual visual-art production output, not a hypothetical backlog.

A **15 MB ZIP bundle** was created in the ChatGPT session, including:
- 18 separate transparent PNG cutouts with 24px alpha padding;
- three complete, original generated PNG source sheets;
- a contact-sheet JPG preview;
- an exact SHA-256/dimensions/coordinates JSON manifest;
- `verify_radzone_wave02.py` checksum/dimension verification;
- a rebuild script and CSV catalog.

**Crucial delivery state:** ChatGPT sandbox bundle exists and the local checksum test passed. **These 21 PNG binaries are NOT yet uploaded to this GitHub repository**, because this environment's authenticated GitHub connector only exposes text-write operations and blob creation requires inline binary transfer. Do not mark the original GitHub publication task complete until real PNGs are committed and linked.

ZIP SHA-256 (over the completed, reproducible bundle):
`b07e457f30b45cc95002729f0e502b0aa1bcd75550601f42e0673d064acc69c5`

## Detailed asset index

| Asset category | 6 objects |
|---|---|
| Survival / inventory (`items/survival`) | `first_aid_kit`, `stim_injector`, `field_canteen`, `ration_tin`, `lockpick_roll`, `geiger_counter` |
| Wearable equipment (`items/equipment`) | `leather_vest`, `scrap_metal_chest_armor`, `heavy_combat_helmet`, `wasteland_backpack`, `gas_mask`, `reinforced_boots` |
| Settlement environment (`world/settlement`) | `bus_stop_shelter`, `scrap_market_stall`, `roadside_drop_box`, `abandoned_payphone_booth`, `dead_desert_tree`, `fortified_scrap_shack` |

**Existing painterly v3.1 package:** 58 PNGs in `art/production/painterly_v3/`. These wave-02 sources are NEW GRAPHICS, but some are different designs of the same subject class; do not claim that 58+18 necessarily equals 76 distinct gameplay item IDs.

## Local authenticated Git/OpenCode import (not yet executed)

1. Download `RADZONE_painterly_v4_wave02_18_assets.zip` from the ChatGPT handoff message to the Windows machine containing the game repository.
2. Inspect the contact sheet and the 18 RGBA cutouts; reject any incorrectly masked/cropped asset.
3. In Windows PowerShell, from the existing authorized Godot repository (`C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile`), execute:

```powershell
git fetch origin
git switch master
git pull --ff-only origin master
git switch -c art/radzone-v4-wave02-png-import
$zip = "$env:USERPROFILE\Downloads\RADZONE_painterly_v4_wave02_18_assets.zip"
$hash = (Get-FileHash $zip -Algorithm SHA256).Hash.ToLowerInvariant()
if ($hash -ne 'b07e457f30b45cc95002729f0e502b0aa1bcd75550601f42e0673d064acc69c5') { throw "ZIP SHA-256 mismatch" }
New-Item -ItemType Directory -Force art\production\painterly_v4 | Out-Null
Expand-Archive -LiteralPath $zip -DestinationPath art\production\painterly_v4 -Force
python art\production\painterly_v4\painterly_v4_wave02\verify_radzone_wave02.py art\production\painterly_v4\painterly_v4_wave02
git add art/production/painterly_v4/painterly_v4_wave02
git diff --cached --stat
git commit -m "art(radzone): import 18 RGBA cutouts and 3 original v4 source sheets"
git push -u origin art/radzone-v4-wave02-png-import
```

4. Open a PR to `master` and verify 18 alpha-cutout PNGs + 3 original sheet PNGs + exact manifest. Godot code must remain unchanged.
5. Mark materials `AUTO_SEGMENTED_NEEDS_HUMAN_QA`. Import into Godot only after real mobile QA. No new armor/weapon paperdoll runtime support is implied.

## QA performed in ChatGPT environment

- 18 individual RGBA PNGs produced from image-generated sources.
- All 18 had a transparent (zero-alpha) 12px outside safety border.
- Manifest file paths, image dimensions and SHA-256 verified for all **18 cutouts + 3 original sheets**.
- Contact preview assembled on checkerboard dark background to reveal unwanted white halos.
- **Not performed:** manual high-zoom artistic approval, original item ID linkage, animation sockets, UI readability, 8-way turnarounds, Godot and real Android render screenshots.

## Coordination

- Keep issue #7 for Godot paperdoll/visible equipment/Android integration.
- Keep issue #2 for the separate ten owner-approved original PNG concepts.
- Keep `docs/art/production/RADZONE_WAVE_01.md` for the earlier 18 subjects generated in another workspace but not binary-imported yet.
- Reference design target: `docs/art/APPROVED_VISUAL_CATALOG.md`.

This handoff is intentionally explicit about which graphics have been generated, cut and verified, and which binaries have actually reached GitHub.
