# RADZONE Wave 03 — 24 RGBA source cuts (2026-11-09)

## Art delivered in ChatGPT (NOT YET IN GITHUB)

One fresh 1536×1024 transparent-background painterly art sheet has been separated into **24 individual PNG RGBA files**. A separate source sheet, a two-background preview (dark/light), a machine-readable manifest (file paths, crop regions, source components, image dimensions and SHA-256) and CSV catalog are included in a downloadable ZIP.

- Bundle name: `RADZONE_WAVE03_24_TRUE_ALPHA_PNG.zip`
- Bundle SHA-256: `10c78a18988561be02b9e6166d85628f116b1d85238baa58544e3de46a0ce58b`
- Source-sheet SHA-256: `1a225c7d36c1fef9b57bbb7d8993bd4195c1fde90cf317d1dd2eeb340bf74a15`
- Local bundle size: 5,916,169 bytes
- Images: 24 individual PNGs, source sheet plus QA preview.
- Transparency validation: all 24 PNGs have RGBA, zero-alpha exterior padding and verified SHA-256.
- **Limits:** The generated source sheet includes some symbols/product-inspired text. Treat those items as artwork references pending IP review and possible repaint. The art is **not approved as final production sprites and NOT Android-tested**. Some objects share categories with earlier waves; 24 PNGs does not mean 24 unique game item IDs.

## Asset inventory

| Row | Assets |
|---|---|
| Weapons & utility | `weathered_autopistol`, `compact_smg`, `pump_shotgun`, `field_knife`, `field_injector`, `wrist_computer` |
| Wearables | `blue_work_jacket`, `patched_leather_coat`, `steel_field_helmet`, `heavy_respirator`, `rolltop_scout_pack`, `field_medical_case` |
| Wasteland props | `radioactive_waste_drum`, `military_ammo_case`, `reinforced_supply_crate`, `red_vending_machine`, `campfire_with_kettle`, `torn_settlement_sofa` |
| Interior/exterior machinery | `scavenger_workbench`, `double_bunk_bed`, `steel_filing_cabinet`, `retro_crt_console`, `portable_generator`, `antenna_radio_tower` |

## Delivery boundary

**The archive is currently linked in the ChatGPT conversation, not uploaded to GitHub.** This document records the handoff without inventing URLs to unavailable binaries. Do not mark any item `IN_GAME_VERIFIED`. Keep existing Godot assets untouched.

## Safe import instructions for local OpenCode

Download the ZIP from the ChatGPT message first, then use an isolated branch on the authorized Windows machine:

```powershell
cd C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile
git fetch origin
git switch master
git pull --ff-only origin master
git switch -c art/radzone-wave03-png-import
$zip = "$env:USERPROFILE\Downloads\RADZONE_WAVE03_24_TRUE_ALPHA_PNG.zip"
$actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $zip).Hash.ToLowerInvariant()
if ($actual -ne '10c78a18988561be02b9e6166d85628f116b1d85238baa58544e3de46a0ce58b') { throw "ZIP hash mismatch" }
New-Item -ItemType Directory -Force art\production\painterly_v4\wave03 | Out-Null
Expand-Archive -LiteralPath $zip -DestinationPath art\production\painterly_v4\wave03 -Force
# Inspect all 24 PNGs with checkerboard and both light/dark backgrounds before approval.
git add art/production/painterly_v4/wave03
git diff --cached --stat
git commit -m "art(radzone): import wave-03 source sheet and 24 draft RGBA crops"
git push -u origin art/radzone-wave03-png-import
```

Open a PR for the binary import and verify uploaded file paths and hashes before merge. Do not alter engine code or public README artwork as part of this task.

## Production QA follow-up

1. Manually inspect alpha holes (mask, helmet, machinery) and hairline edges. Automatic transparency checks cannot prove visual perfection.
2. Replace any artwork with leftover text/third-party marks before a commercial release.
3. Finalize canonical item IDs and world-scale/pivot metadata, including eight-direction equipment sockets where required.
4. Only after human review integrate a subset through the existing CharacterVisual + Player Godot equipment path and capture Android runtime evidence.

Related: [Wave 02](./RADZONE_WAVE_02_IMPORT.md), [Wave 01](./RADZONE_WAVE_01.md), [1,200 asset plan](./RADZONE_1200_ASSET_PLAN.md), [approved concepts](../APPROVED_VISUAL_CATALOG.md).
