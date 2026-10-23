# Art Quality Review — Production Pistol Candidate

**Status:** ART_CANDIDATE — PENDING USER APPROVAL (A4 Gate)  
**Date:** 2026-10-22  
**Asset:** `assets/weapons/production_pistol_candidate/`  
**Review Sheet:** `artifacts/art_review/pistol/ART_APPROVAL_SHEET.png`

---

## 1. Blender 3D Model Inspection

| Property | Value |
|----------|-------|
| **Mesh Objects** | 40 named parts |
| **Base Triangles** | 1,052 (pre-subdivision) |
| **Frame Verts** | 0 (bevel modifier only — procedural) |
| **Modifiers** | Subdivision Surface (level 2), Bevel (0.02m, 4 segments) on all metal parts |
| **Materials** | 9 distinct PBR materials (procedural, no UVs) |

### Materials
| Material | Metallic | Roughness | Purpose |
|----------|----------|-----------|---------|
| Mat_Slide | 0.95 | 0.25 | Blued steel slide with wear |
| Mat_Frame | 0.90 | 0.30 | Matte steel frame |
| Mat_Barrel | 0.98 | 0.15 | Polished barrel bore/hood |
| Mat_Grip | 0.05 | 0.75 | Polymer grip panels |
| Mat_Trigger | 0.85 | 0.35 | Trigger/hammer assembly |
| Mat_Sights | 0.90 | 0.20 | Front/rear iron sights |
| Mat_Magazine | 0.80 | 0.40 | Magazine body + base plate |
| Mat_Accent | 0.60 | 0.50 | Brass pins, screws, mag release |
| Mat_Spring | 0.70 | 0.30 | Recoil spring guide rod |

### Camera & Lighting
- **Camera:** Orthographic (isometric)
- **Elevation:** 35.264° (true isometric)
- **Azimuth:** 45°
- **Ortho Scale:** 0.35 (fixed framing for sprite content)
- **Lighting:** 3-point studio (key 1200lm, fill 400lm, rim 800lm) + bounce 200lm

---

## 2. Render Outputs

### High-Resolution Inspection Renders (1024×1024)
| File | Description |
|------|-------------|
| `pistol_hero_3quarter_1024.png` | 3/4 hero view with dramatic lighting |
| `pistol_side_1024.png` | Pure side profile |
| `pistol_topdown_1024.png` | Top-down mechanical view |
| `pistol_detail_closeup_1024.png` | Close-up of action/trigger area |
| `pistol_wireframe_1024.png` | Wireframe overlay (Freestyle — partial) |

### 8-Directional Sprite Renders (256×256 each)
| Direction | Content Bounds | Fill Ratio |
|-----------|----------------|------------|
| N | 43×28 px | 1.8% |
| NE | 47×47 px | 3.4% |
| E | 28×43 px | 1.8% |
| SE | 47×47 px | 3.4% |
| S | 43×28 px | 1.8% |
| SW | 47×47 px | 3.4% |
| W | 28×43 px | 1.8% |
| NW | 47×47 px | 3.4% |

**Note:** Fixed framing (`ortho_scale=0.35`) improved from original 0.1-0.2% fill to 1.8-3.4%. Still below placeholder 2.9-4.8% fill.

### Comparison Assets
- `placeholder_vs_production_comparison.png` — Scaled side-by-side
- `placeholder_vs_production_native.png` — 1:1 pixel comparison
- `pistol_contact_sheet_8dir.png` / `_bounds.png` — Contact sheets with bounding boxes

---

## 3. Godot Integration

| Component | Status |
|-----------|--------|
| **CharacterVisual.gd** | ✅ Added `production_pistol` to `WEAPON_SPRITE_PATHS` |
| **Atlas + SpriteFrames** | ✅ `production_pistol_atlas.png` (2048×256) + `.tres` |
| **weapons.json** | ⚠️ Removed (dev candidate) → `data/weapons_dev.json` |
| **Paperdoll Layer** | ✅ WeaponSprite (z-index 6) |
| **In-Game Screenshots** | ❌ **NOT CAPTURED** — headless viewport capture fails |

### Integration Files Created
- `assets/weapons/production_pistol_candidate/production_pistol_atlas.png`
- `assets/weapons/production_pistol_candidate/production_pistol_atlas.json`
- `assets/weapons/production_pistol_candidate/production_pistol_sprite_frames.tres`
- `data/weapons_dev.json` (provisional stats for testing only)

---

## 4. Quality Checklist

| # | Criterion | Status | Notes |
|---|-----------|--------|-------|
| 1 | Geometry Detail | ✅ PASS | 32 distinct mechanical parts |
| 2 | Silhouette Recognition | ✅ PASS | Recognizable at all 8 directions |
| 3 | Material Realism | ⚠️ PARTIAL | Procedural PBR good, no surface wear maps |
| 4 | Texture Quality | ⚠️ PARTIAL | Render-time detail only, no baked textures |
| 5 | Lighting Consistency | ✅ PASS | Studio 3-point + bounce, isometric |
| 6 | Character Attachment | ✅ PASS | Paperdoll WeaponSprite layer works |
| 7 | Sprite Orientation | ✅ PASS | True isometric (35.264°/45°) |
| 8 | Game Scale | ⚠️ MARGINAL | 1.8-3.4% fill vs 2.9-4.8% placeholders |
| 9 | Mobile Readability | ✅ PASS | Visible at 1x/2x/4x zoom |
| 10 | Pipeline Consistency | ✅ PASS | SpriteFrames + atlas + CharacterVisual paths |

---

## 5. Known Deficiencies

| # | Issue | Severity | Impact |
|---|-------|----------|--------|
| 1 | **Sprite fill ratio below placeholders** | Medium | Production sprites render smaller in absolute pixels despite 256px canvas |
| 2 | **No surface wear/grime maps** | Medium | Materials look "clean/factory-new" not post-apocalyptic worn |
| 3 | **Wireframe render failed** | Low | Cannot verify topology quality in approval sheet |
| 4 | **No GLTF export** | Medium | `visual_asset` path in weapons.json is placeholder |
| 5 | **In-game screenshots missing** | High | Cannot validate actual gameplay appearance at mobile scale |
| 6 | **No normal/roughness baked maps** | Medium | Runtime PBR only, no texture atlas for materials |
| 7 | **Frame has 0 verts (bevel-only)** | Low | Procedural geometry — valid but unconventional |

---

## 6. Android Build Verification

| Property | Value |
|----------|-------|
| **APK** | `builds/android/Fallout2_Reborn_Mobile_Debug.apk` |
| **Size** | 49.6 MB (was 48.7 MB) |
| **Package ID** | `com.example.wastelandrpgprototype` (Godot) / `asia.go24.wastelandprototype` (manifest) |
| **Min SDK** | 24 (Android 7.0) |
| **Target SDK** | 36 (Android 16) |
| **Debuggable** | true |
| **Assets Included** | All character sprites, environment tiles, weapon sprites |
| **Build Timestamp** | 2026-10-22 09:27 |

---

## 7. User Action Required (A4 Gate)

**DECISION REQUIRED:** Approve or reject the production pistol candidate for mass production scaling.

### To Approve:
1. Review `artifacts/art_review/pistol/ART_APPROVAL_SHEET.png`
2. Verify quality meets "cinematic post-apocalyptic" standard per `docs/VISUAL_DIRECTION.md`
3. Confirm sprite scale/readability acceptable for mobile
4. Authorize scaling to: Character bases (3), Armor tiers (4), Weapon catalog (24), Environment (102)

### To Reject/Iterate:
Specify exact deficiencies (from Section 5 or new observations) and required fixes before re-review.

---

## 8. Next Steps After Approval

| Phase | Action | Est. Effort |
|-------|--------|-------------|
| A5 | Model 3 character bases to approved standard | 1-2 weeks |
| A6 | Model 4 armor tiers with weathering | 1 week |
| A7 | Scale to 24 weapons | 1-2 weeks |
| A8 | Environment production (102 tiles) | 1-2 weeks |
| **Total** | **Full art catalog** | **4-7 weeks** |

---

**Do not scale production until A4 approval is explicitly granted.**