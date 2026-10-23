#!/usr/bin/env python3
"""
Image Generation Test Script
Tests available providers: OpenAI (DALL-E 3, gpt-image-1) and Google (Imagen 3 via Gemini)
Requires API keys to be set in environment variables.
"""

import os
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

OUTPUT_DIR = Path("artifacts/art_concepts/sidearm_v1")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

PROMPT = """Cinematic post-apocalyptic pistol concept, three-quarter hero view.
Realistic mature style, serious retro-industrial post-apocalypse aesthetic.
Gritty cinematic lighting, highly detailed mechanical design.
Weathered dark metal surfaces with dust, scratches, and surface wear.
Believable engineering, distinctive original silhouette.
No cartoon aesthetics, no direct copying of Fallout 2 weapon artwork.
High resolution, professional concept art quality."""

NEGATIVE_PROMPT = """cartoon, stylized, cel-shaded, anime, sketch, drawing, illustration,
low quality, blurry, distorted, deformed, ugly, bad anatomy,
watermark, text, signature, title, border, frame,
fallout, vault-tec, pip-boy, recognizable game assets"""


def test_openai():
    """Test OpenAI DALL-E 3 / gpt-image-1"""
    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key:
        return {"status": "skipped", "reason": "OPENAI_API_KEY not set"}

    try:
        from openai import OpenAI
        client = OpenAI(api_key=api_key)

        # Test with gpt-image-1 (latest, supports editing) or dall-e-3
        response = client.images.generate(
            model="gpt-image-1",
            prompt=PROMPT,
            size="1024x1024",
            quality="high",
            n=1,
        )

        # Save image
        import base64
        image_data = base64.b64decode(response.data[0].b64_json)
        output_path = OUTPUT_DIR / "hero_concept_openai.png"
        output_path.write_bytes(image_data)

        return {
            "status": "success",
            "provider": "OpenAI",
            "model": "gpt-image-1",
            "output": str(output_path),
            "dimensions": "1024x1024",
            "cost_estimate": "~$0.04-0.08 per image",
            "commercial_use": "Allowed per OpenAI terms",
            "image_editing": "Supported via gpt-image-1 edit endpoint",
        }

    except Exception as e:
        return {"status": "error", "provider": "OpenAI", "error": str(e)}


def test_google():
    """Test Google Imagen 3 via Gemini API (new generate_content method)"""
    api_key = os.environ.get("GOOGLE_API_KEY") or os.environ.get("GEMINI_API_KEY")
    if not api_key:
        return {"status": "skipped", "reason": "GOOGLE_API_KEY/GEMINI_API_KEY not set"}

    try:
        from google import genai
        from google.genai import types
        client = genai.Client(api_key=api_key)

        # Use generate_content with Gemini image model (new API)
        # Try flash model first (more generous free tier)
        response = client.models.generate_content(
            model="gemini-3.1-flash-image",
            contents=PROMPT,
            config=types.GenerateContentConfig(
                response_modalities=["IMAGE"],
            ),
        )

        # Save image from response
        output_path = OUTPUT_DIR / "hero_concept_google.png"
        for part in response.candidates[0].content.parts:
            if part.inline_data:
                output_path.write_bytes(part.inline_data.data)
                break

        return {
            "status": "success",
            "provider": "Google",
            "model": "gemini-3.1-flash-image",
            "output": str(output_path),
            "dimensions": "1024x1024 (default)",
            "cost_estimate": "Free tier: 15 req/min, 1500 req/day; Paid: $0.03/image",
            "commercial_use": "Allowed per Google AI terms",
            "image_editing": "Supported via Gemini image models",
        }

    except Exception as e:
        return {"status": "error", "provider": "Google", "error": str(e)}


def main():
    print("=" * 60)
    print("IMAGE GENERATION PROVIDER TEST")
    print("=" * 60)
    print(f"Output directory: {OUTPUT_DIR.absolute()}")
    print(f"Prompt: {PROMPT[:100]}...")
    print()

    results = []

    # Test OpenAI
    print("Testing OpenAI...")
    result = test_openai()
    results.append(result)
    print(f"  Status: {result['status']}")
    if result['status'] == 'success':
        print(f"  Output: {result['output']}")
    elif result['status'] == 'error':
        print(f"  Error: {result['error']}")
    else:
        print(f"  Reason: {result['reason']}")
    print()

    # Test Google
    print("Testing Google (Imagen 3)...")
    result = test_google()
    results.append(result)
    print(f"  Status: {result['status']}")
    if result['status'] == 'success':
        print(f"  Output: {result['output']}")
    elif result['status'] == 'error':
        print(f"  Error: {result['error']}")
    else:
        print(f"  Reason: {result['reason']}")
    print()

    # Summary
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)

    success_count = sum(1 for r in results if r['status'] == 'success')
    if success_count > 0:
        print(f"[OK] {success_count} provider(s) generated images successfully")
        for r in results:
            if r['status'] == 'success':
                print(f"  - {r['provider']} ({r['model']}): {r['output']}")
    else:
        print("[FAIL] No providers generated images")
        print()
        print("REQUIRED ACTION:")
        print("  Set one of these environment variables:")
        print("    OPENAI_API_KEY     - for DALL-E 3 / gpt-image-1")
        print("    GOOGLE_API_KEY     - for Imagen 3 (Gemini API)")
        print("    GEMINI_API_KEY     - alternative for Google")
        print()
        print("Get keys from:")
        print("  OpenAI: https://platform.openai.com/api-keys")
        print("  Google: https://aistudio.google.com/apikey")

    return 0 if success_count > 0 else 1


if __name__ == "__main__":
    sys.exit(main())