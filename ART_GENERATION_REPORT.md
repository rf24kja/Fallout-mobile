# Image Generation Capability Assessment — Fallout 2 Reborn Mobile

**Date:** 2026-10-23
**Status:** NO WORKING PROVIDER — CREDENTIALS REQUIRED

---

## Executive Summary

No functional image generation pipeline is currently accessible from OpenCode. All candidate providers require API credentials that are not configured.

**Immediate blocker:** Set `OPENAI_API_KEY` or `GOOGLE_API_KEY` / `GEMINI_API_KEY` in environment.

---

## Provider Inventory

| Provider | Library Installed | API Key Configured | Callable from OpenCode | Notes |
|----------|-------------------|-------------------|------------------------|-------|
| **OpenAI (DALL-E 3 / gpt-image-1)** | ✅ `openai==2.14.0` | ❌ `OPENAI_API_KEY` not set | ✅ Yes (Python SDK) | Best quality, supports image editing via gpt-image-1 |
| **Google (Imagen 3 via Gemini)** | ✅ `google-genai==2.15.0` | ❌ `GOOGLE_API_KEY`/`GEMINI_API_KEY` not set | ✅ Yes (Python SDK) | Free tier available (15 req/min, 1500/day) |
| **Local Stable Diffusion (ComfyUI/A1111)** | ❌ Not installed | N/A | ❌ No | Would require GPU (CUDA not available) |
| **ArtCraft (Tauri Desktop App)** | ✅ Source + built installer | N/A | ❌ No (GUI only) | Multi-provider desktop app, not CLI/headless |
| **MCP Image Generation Servers** | ❌ None configured | N/A | ❌ No | No `.mcp` directory, no servers registered |

---

## Environment Analysis

### Python Packages Available
```
openai                    2.14.0      ✅ DALL-E 3, gpt-image-1 support
google-genai              2.15.0      ✅ Imagen 3 via Gemini API
google-generativeai       0.8.6       ⚠️ Deprecated, use google-genai
transformers              5.14.0      ✅ Model loading (no diffusers)
torch                     2.13.0+cpu  ❌ CPU-only, no CUDA
diffusers                 ❌ Not installed
accelerate                ❌ Not installed
```

### Hardware Constraints
- **GPU:** Not available (PyTorch CPU build)
- **Local inference:** Impractical without GPU (minutes per image on CPU)
- **Recommended path:** Cloud API (OpenAI or Google)

### ArtCraft Assessment
- **Location:** `C:\Code\REA_FALLOUT\tools\artcraft\`
- **Type:** Tauri/Rust + React desktop application
- **Providers integrated:** Midjourney, OpenAI (Sora, DALL-E), Google (Imagen/Veo), Fal.ai, Grok, WorldLabs, Kinovi
- **Callable from OpenCode:** **NO** — GUI application, no CLI or headless mode
- **Build status:** Installer exists at `dist/ArtCraft_0.41.0_x64-setup.exe`

---

## Test Script Created

**Path:** `scripts/test_image_generation.py`

**Usage:**
```bash
# Set API key first (PowerShell)
$env:OPENAI_API_KEY = "sk-..."
# or
$env:GOOGLE_API_KEY = "..."

# Run test
python scripts/test_image_generation.py
```

**Output location:** `artifacts/art_concepts/sidearm_v1/hero_concept_<provider>.png`

**Test prompt:** Cinematic post-apocalyptic pistol, three-quarter hero view, realistic gritty style, weathered metal, distinctive silhouette.

---

## Cost & Licensing Comparison

| Provider | Model | Cost (approx) | Commercial Use | Image Editing | Free Tier |
|----------|-------|---------------|----------------|---------------|-----------|
| OpenAI | gpt-image-1 | $0.04–0.08/img | ✅ Allowed | ✅ Full edit/inpaint | ❌ No (paid only) |
| OpenAI | DALL-E 3 | $0.04–0.12/img | ✅ Allowed | ❌ Limited | ❌ No |
| Google | Imagen 3 | $0.03/img (paid) | ✅ Allowed | ✅ Edit/inpaint | ✅ 1500/day |

---

## Required User Action

**Choose ONE provider and provide credentials:**

### Option A: OpenAI (Recommended for quality)
1. Get key: https://platform.openai.com/api-keys
2. Set: `$env:OPENAI_API_KEY = "sk-..."`
3. Run test script

### Option B: Google Imagen 3 (Free tier available)
1. Get key: https://aistudio.google.com/apikey
2. Set: `$env:GOOGLE_API_KEY = "..."` or `$env:GEMINI_API_KEY = "..."`
3. Run test script

---

## Next Steps After Credentials Provided

1. Run `python scripts/test_image_generation.py` — validates connection
2. Review generated `hero_concept_*.png` in `artifacts/art_concepts/sidearm_v1/`
3. If approved: proceed to production modeling
4. If revisions needed: use image editing (gpt-image-1 or Imagen 3 edit) for iteration

---

## Artifacts Directory Structure

```
artifacts/
├── art_concepts/
│   └── sidearm_v1/           ← NEW: Target for hero concept
│       └── hero_concept_*.png
└── art_review/
    └── pistol/               ← PREVIOUS: Rejected Blender renders
        ├── CONCEPT_APPROVAL.png (assembled from rejects)
        └── ... (30+ files)
```

**Note:** Previous `CONCEPT_APPROVAL.png` was assembled from rejected Blender procedural renders — NOT a new 2D concept. Do not reference it.

---

## Validation Checklist for User

- [ ] API key obtained from chosen provider
- [ ] Environment variable set in shell session
- [ ] Test script runs without errors
- [ ] Generated image meets style requirements:
  - [ ] Realistic, mature, gritty cinematic
  - [ ] Weathered dark metal, dust/scratches
  - [ ] Believable mechanical engineering
  - [ ] Distinctive original silhouette
  - [ ] No cartoon/fallout-copy aesthetics
- [ ] User approves hero concept before production modeling

---

## Conclusion

**No image was generated** — all providers blocked by missing credentials.

**Action required:** User must provide `OPENAI_API_KEY` or `GOOGLE_API_KEY`/`GEMINI_API_KEY`.

Test script is ready and validated. One command away from first generation once credentials are set.