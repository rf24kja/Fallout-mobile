#!/usr/bin/env python3
"""
Create CONCEPT_QUALITY_REVIEW.png - Quality review sheet for concept art
Evaluates concept against VISUAL_DIRECTION.md criteria
"""

import os
from PIL import Image, ImageDraw, ImageFont

ARTIFACTS_DIR = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol"
OUTPUT_PATH = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol\CONCEPT_QUALITY_REVIEW.png"

COLORS = {
    "bg_dark": (18, 18, 22),
    "bg_panel": (30, 30, 36),
    "accent_amber": (255, 165, 0),
    "accent_rust": (183, 65, 14),
    "accent_green": (80, 200, 100),
    "accent_red": (220, 60, 60),
    "text_primary": (235, 235, 235),
    "text_secondary": (160, 160, 170),
    "text_warning": (255, 180, 50),
    "border": (60, 60, 70),
    "pass_bg": (20, 50, 30),
    "fail_bg": (60, 20, 20),
    "warn_bg": (60, 45, 15),
}

def get_font(size, bold=False):
    try:
        font_paths = [
            "C:/Windows/Fonts/segoeui.ttf",
            "C:/Windows/Fonts/arial.ttf",
        ]
        for fp in font_paths:
            if os.path.exists(fp):
                return ImageFont.truetype(fp, size)
    except:
        pass
    return ImageFont.load_default()

def create_quality_review():
    canvas_w = 2400
    canvas_h = 3200
    canvas = Image.new("RGBA", (canvas_w, canvas_h), COLORS["bg_dark"])
    draw = ImageDraw.Draw(canvas)
    
    font_title = get_font(42, bold=True)
    font_section = get_font(28, bold=True)
    font_body = get_font(20)
    font_small = get_font(16)
    font_tiny = get_font(14)
    
    # Header
    draw.rectangle([0, 0, canvas_w, 100], fill=COLORS["bg_panel"])
    draw.line([0, 100, canvas_w, 100], fill=COLORS["border"], width=2)
    draw.text((50, 20), "CONCEPT QUALITY REVIEW", font=font_title, fill=COLORS["accent_amber"])
    draw.text((50, 60), "Post-Apocalyptic Sidearm — Rev2 3D Render Candidate", font=get_font(22), fill=COLORS["text_secondary"])
    
    y = 130
    
    # ============================================================
    # SECTION 1: VISUAL DIRECTION COMPLIANCE
    # ============================================================
    draw.text((50, y), "1. VISUAL DIRECTION COMPLIANCE", font=font_section, fill=COLORS["accent_amber"])
    y += 45
    
    criteria_1 = [
        ("Color Palette", "Muted earth tones, rust accents, olive/drab bases — Rev2 uses gunmetal grays, limited rust", "PARTIAL", COLORS["text_warning"]),
        ("Materials", "Weathered metal, cracked polymer, faded paint, oil stains — Rev2 materials are flat/procedural", "FAIL", COLORS["accent_red"]),
        ("Lighting", "Harsh directional, deep shadows, rim highlights — Rev2 uses flat studio lighting", "FAIL", COLORS["accent_red"]),
        ("Composition", "Asymmetrical, rule of thirds, negative space — Orthographic renders are centered/symmetrical", "PARTIAL", COLORS["text_warning"]),
        ("Detail Density", "High-frequency detail at hero scale, readable at thumbnail — Rev2 lacks micro-detail", "FAIL", COLORS["accent_red"]),
    ]
    
    for label, desc, verdict, color in criteria_1:
        bg_color = {"PASS": COLORS["pass_bg"], "PARTIAL": COLORS["warn_bg"], "FAIL": COLORS["fail_bg"]}[verdict]
        draw.rectangle([50, y, canvas_w - 50, y + 70], fill=bg_color, outline=COLORS["border"], width=1)
        draw.text((70, y + 5), label, font=font_body, fill=COLORS["accent_amber"])
        draw.text((70, y + 35), desc, font=font_small, fill=COLORS["text_secondary"])
        draw.text((canvas_w - 180, y + 20), verdict, font=font_body, fill=color)
        y += 80
    
    y += 20
    
    # ============================================================
    # SECTION 2: SILHOUETTE & READABILITY
    # ============================================================
    draw.text((50, y), "2. SILHOUETTE & GAMEPLAY READABILITY", font=font_section, fill=COLORS["accent_amber"])
    y += 45
    
    criteria_2 = [
        ("64px Thumbnail", "Distinct pistol shape at inventory icon size — Boxy proportions reduce distinctiveness", "PARTIAL", COLORS["text_warning"]),
        ("Grip Recognition", "Grip angle and shape clearly pistol-like — Grip readable but blocky", "PARTIAL", COLORS["text_warning"]),
        ("Barrel/Sights", "Front sight post + rear notch visible — Sights present but low detail", "PASS", COLORS["accent_green"]),
        ("Slide Profile", "Distinct slide vs frame separation — Separation visible but edges soft", "PARTIAL", COLORS["text_warning"]),
        ("Magazine Well", "Readable at small scale — Present but not prominent", "PARTIAL", COLORS["text_warning"]),
    ]
    
    for label, desc, verdict, color in criteria_2:
        bg_color = {"PASS": COLORS["pass_bg"], "PARTIAL": COLORS["warn_bg"], "FAIL": COLORS["fail_bg"]}[verdict]
        draw.rectangle([50, y, canvas_w - 50, y + 60], fill=bg_color, outline=COLORS["border"], width=1)
        draw.text((70, y + 5), label, font=font_body, fill=COLORS["accent_amber"])
        draw.text((70, y + 30), desc, font=font_small, fill=COLORS["text_secondary"])
        draw.text((canvas_w - 180, y + 15), verdict, font=font_body, fill=color)
        y += 70
    
    y += 20
    
    # ============================================================
    # SECTION 3: PRODUCTION READINESS
    # ============================================================
    draw.text((50, y), "3. PRODUCTION READINESS (for modeling pipeline)", font=font_section, fill=COLORS["accent_amber"])
    y += 45
    
    criteria_3 = [
        ("Orthographic Accuracy", "Side/Top/Front views align perfectly — Rev2 orthos generated from 3D, accurate", "PASS", COLORS["accent_green"]),
        ("Part Separation", "Clear mesh groups for slide, frame, barrel, grip, trigger, sights — Wireframe shows groups", "PASS", COLORS["accent_green"]),
        ("Edge Flow", "Clean topology for deformation — Procedural edges, not optimized for animation", "FAIL", COLORS["accent_red"]),
        ("UV Layout Ready", "Logical UV seams at part boundaries — Not UVed, would need manual layout", "FAIL", COLORS["accent_red"]),
        ("LOD Strategy", "Clear high/med/low poly targets — Single density procedural mesh", "FAIL", COLORS["accent_red"]),
        ("Sprite Atlas Ready", "8-direction renders align to grid — 8-dir contact sheet generated, aligned", "PASS", COLORS["accent_green"]),
    ]
    
    for label, desc, verdict, color in criteria_3:
        bg_color = {"PASS": COLORS["pass_bg"], "PARTIAL": COLORS["warn_bg"], "FAIL": COLORS["fail_bg"]}[verdict]
        draw.rectangle([50, y, canvas_w - 50, y + 60], fill=bg_color, outline=COLORS["border"], width=1)
        draw.text((70, y + 5), label, font=font_body, fill=COLORS["accent_amber"])
        draw.text((70, y + 30), desc, font=font_small, fill=COLORS["text_secondary"])
        draw.text((canvas_w - 180, y + 15), verdict, font=font_body, fill=color)
        y += 70
    
    y += 20
    
    # ============================================================
    # SECTION 4: FALLOUT 2 AUTHENTICITY
    # ============================================================
    draw.text((50, y), "4. FALLOUT 2 AUTHENTICITY", font=font_section, fill=COLORS["accent_amber"])
    y += 45
    
    criteria_4 = [
        ("10mm Pistol DNA", "Evokes classic FO2 10mm silhouette — Generic modern pistol, lacks FO2 character", "FAIL", COLORS["accent_red"]),
        ("Pre-War Aesthetic", "Clean lines, military-spec, mass-produced — Somewhat generic tactical look", "PARTIAL", COLORS["text_warning"]),
        ("Post-War Wear", "Scavenged, repaired, personalized — No narrative wear, only procedural", "FAIL", COLORS["accent_red"]),
        ("Iconic Details", "Distinctive slide serrations, grip texture, hammer — Missing hammer, generic serrations", "FAIL", COLORS["accent_red"]),
    ]
    
    for label, desc, verdict, color in criteria_4:
        bg_color = {"PASS": COLORS["pass_bg"], "PARTIAL": COLORS["warn_bg"], "FAIL": COLORS["fail_bg"]}[verdict]
        draw.rectangle([50, y, canvas_w - 50, y + 60], fill=bg_color, outline=COLORS["border"], width=1)
        draw.text((70, y + 5), label, font=font_body, fill=COLORS["accent_amber"])
        draw.text((70, y + 30), desc, font=font_small, fill=COLORS["text_secondary"])
        draw.text((canvas_w - 180, y + 15), verdict, font=font_body, fill=color)
        y += 70
    
    y += 20
    
    # ============================================================
    # SUMMARY SCORECARD
    # ============================================================
    draw.rectangle([50, y, canvas_w - 50, y + 200], fill=COLORS["bg_panel"], outline=COLORS["accent_rust"], width=3)
    y += 30
    draw.text((70, y), "OVERALL ASSESSMENT", font=font_title, fill=COLORS["accent_rust"])
    y += 50
    
    # Score breakdown
    total = 17
    passed = 3
    partial = 6
    failed = 8
    
    draw.text((70, y), f"PASS: {passed}/{total}    PARTIAL: {partial}/{total}    FAIL: {failed}/{total}", font=font_body, fill=COLORS["text_primary"])
    y += 40
    
    # Progress bar
    bar_w = canvas_w - 140
    draw.rectangle([70, y, 70 + bar_w, y + 30], fill=(40, 40, 50), outline=COLORS["border"])
    # Pass segment
    pass_w = int(bar_w * passed / total)
    draw.rectangle([70, y, 70 + pass_w, y + 30], fill=COLORS["accent_green"])
    # Partial segment
    part_w = int(bar_w * partial / total)
    draw.rectangle([70 + pass_w, y, 70 + pass_w + part_w, y + 30], fill=COLORS["text_warning"])
    # Fail segment
    fail_w = bar_w - pass_w - part_w
    draw.rectangle([70 + pass_w + part_w, y, 70 + pass_w + part_w + fail_w, y + 30], fill=COLORS["accent_red"])
    y += 50
    
    draw.text((70, y), "VERDICT: REJECTED FOR PRODUCTION — Requires professional 2D concept pass before modeling", 
              font=font_section, fill=COLORS["accent_red"])
    y += 40
    draw.text((70, y), "NEXT STEPS:", font=font_body, fill=COLORS["accent_amber"])
    y += 30
    steps = [
        "1. Commission hand-painted 2D concept art (silhouette, materials, lighting per VISUAL_DIRECTION.md)",
        "2. Iterate on silhouette for stronger FO2 10mm pistol identity",
        "3. Define material callouts with photo reference (weathered steel, Bakelite, rust, oil)",
        "4. Create orthographic reference from APPROVED 2D concept (not from 3D)",
        "5. Build production model from approved 2D reference with clean topology",
    ]
    for step in steps:
        draw.text((90, y), step, font=font_small, fill=COLORS["text_secondary"])
        y += 28
    
    # Footer
    y = canvas_h - 80
    draw.line([50, y, canvas_w - 50, y], fill=COLORS["border"], width=1)
    y += 15
    draw.text((50, y), "Generated from Rev2 procedural 3D renders | Tool limitation: No 2D concept art generation available | See CONCEPT_APPROVAL.png for visual reference", 
              font=font_tiny, fill=COLORS["text_secondary"])
    
    canvas.save(OUTPUT_PATH)
    print(f"Saved CONCEPT_QUALITY_REVIEW.png: {OUTPUT_PATH}")
    return OUTPUT_PATH

if __name__ == "__main__":
    create_quality_review()