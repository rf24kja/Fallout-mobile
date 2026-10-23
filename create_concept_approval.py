#!/usr/bin/env python3
"""
Create CONCEPT_APPROVAL.png - Concept art sheet for post-apocalyptic sidearm
Using Rev2 3D renders as concept candidate with clear tool limitation annotations.
"""

import os
from PIL import Image, ImageDraw, ImageFont

# Paths
ARTIFACTS_DIR = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol"
OUTPUT_PATH = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol\CONCEPT_APPROVAL.png"

# Source images from Rev2 renders
SOURCES = {
    "hero_3quarter": "pistol_hero_3q_rev2.png",          # Large 3/4 hero view
    "side_ortho": "pistol_side_rev2.png",                # Side orthographic
    "top_ortho": "pistol_top_rev2.png",                  # Top orthographic  
    "closeup": "pistol_closeup_rev2.png",                # Close-up detail
    "wireframe": "pistol_wireframe_rev2.png",            # Wireframe/technical
    "contact_8dir": "pistol_contact_sheet_8dir.png",    # 8-direction contact sheet
    "inspection": "inspection_rev2.png",                 # Inspection view
    "player_equipped": "player_equipped_rev2.png",      # In-game equipped
}

# Fallback to lower-res versions if high-res not found
FALLBACKS = {
    "hero_3quarter": "pistol_hero_3quarter_1024.png",
    "side_ortho": "pistol_side_1024.png",
    "top_ortho": "pistol_topdown_1024.png",
    "closeup": "pistol_detail_closeup_1024.png",
    "wireframe": "pistol_wireframe_1024.png",
}

# Colors per VISUAL_DIRECTION.md
COLORS = {
    "bg_dark": (18, 18, 22),           # Near-black background
    "bg_panel": (30, 30, 36),          # Dark panel background
    "accent_amber": (255, 165, 0),     # Amber accent
    "accent_rust": (183, 65, 14),      # Rust orange
    "text_primary": (235, 235, 235),   # Off-white text
    "text_secondary": (160, 160, 170), # Muted gray
    "text_warning": (255, 180, 50),    # Warning amber
    "border": (60, 60, 70),            # Subtle border
    "callout_bg": (40, 35, 25),        # Callout background
    "callout_border": (180, 120, 30),  # Callout border
}

def load_image(name, max_size=None):
    """Load image with fallback to lower resolution."""
    path = os.path.join(ARTIFACTS_DIR, SOURCES.get(name, ""))
    if not os.path.exists(path) and name in FALLBACKS:
        path = os.path.join(ARTIFACTS_DIR, FALLBACKS[name])
    if not os.path.exists(path):
        print(f"WARNING: {name} not found at {path}")
        return None
    
    img = Image.open(path).convert("RGBA")
    if max_size:
        img.thumbnail(max_size, Image.LANCZOS)
    return img

def get_font(size, bold=False):
    """Get a font, fallback to default if not available."""
    try:
        # Try to find a decent font on Windows
        font_paths = [
            "C:/Windows/Fonts/segoeui.ttf",
            "C:/Windows/Fonts/arial.ttf",
            "C:/Windows/Fonts/calibri.ttf",
        ]
        for fp in font_paths:
            if os.path.exists(fp):
                return ImageFont.truetype(fp, size)
    except:
        pass
    return ImageFont.load_default()

def create_concept_sheet():
    """Create the concept approval sheet."""
    
    # Load all source images
    images = {}
    for key in SOURCES:
        images[key] = load_image(key)
        if images[key]:
            print(f"Loaded {key}: {images[key].size}")
        else:
            print(f"MISSING: {key}")
    
    # Canvas size - large enough for all elements
    canvas_w = 3200
    canvas_h = 2400
    canvas = Image.new("RGBA", (canvas_w, canvas_h), COLORS["bg_dark"])
    draw = ImageDraw.Draw(canvas)
    
    # Fonts
    font_title = get_font(48, bold=True)
    font_subtitle = get_font(32, bold=True)
    font_body = get_font(22)
    font_small = get_font(18)
    font_tiny = get_font(14)
    font_callout = get_font(16, bold=True)
    
    # ============================================================
    # HEADER SECTION
    # ============================================================
    header_h = 120
    draw.rectangle([0, 0, canvas_w, header_h], fill=COLORS["bg_panel"])
    draw.line([0, header_h, canvas_w, header_h], fill=COLORS["border"], width=2)
    
    # Title
    draw.text((60, 20), "FALLOUT 2 REBORN MOBILE", font=font_title, fill=COLORS["accent_amber"])
    draw.text((60, 70), "CONCEPT ART APPROVAL — Post-Apocalyptic Sidearm", font=font_subtitle, fill=COLORS["text_primary"])
    
    # Status badges
    badge_x = canvas_w - 400
    draw.rectangle([badge_x, 15, badge_x + 180, 55], fill=COLORS["callout_bg"], outline=COLORS["callout_border"], width=2)
    draw.text((badge_x + 10, 20), "CONCEPT CANDIDATE", font=font_callout, fill=COLORS["accent_amber"])
    
    draw.rectangle([badge_x, 65, badge_x + 180, 105], fill=(60, 30, 20), outline=COLORS["accent_rust"], width=2)
    draw.text((badge_x + 10, 70), "Rev2 3D RENDERS", font=font_callout, fill=COLORS["accent_rust"])
    
    # ============================================================
    # TOOL LIMITATION NOTICE
    # ============================================================
    notice_y = header_h + 20
    draw.rectangle([40, notice_y, canvas_w - 40, notice_y + 80], fill=(45, 30, 20), outline=COLORS["accent_rust"], width=2)
    draw.text((60, notice_y + 10), "⚠ TOOL LIMITATION NOTICE", font=font_subtitle, fill=COLORS["accent_rust"])
    draw.text((60, notice_y + 45), 
        "No professional 2D concept art generation tools available (no Stable Diffusion, Midjourney, ComfyUI, or API keys configured). "
        "This sheet uses Rev2 procedural 3D renders as concept candidate. Rev2 was REJECTED for production quality "
        "(box-like proportions, flat materials, insufficient weathering, weak gameplay detail). "
        "A hand-painted 2D concept pass is REQUIRED before production modeling.",
        font=font_body, fill=COLORS["text_warning"])
    
    # ============================================================
    # MAIN LAYOUT - Three columns
    # ============================================================
    content_y = notice_y + 100
    col_w = (canvas_w - 120) // 3
    col_gap = 30
    
    # Column 1: Hero 3/4 view (large)
    col1_x = 60
    hero_img = images.get("hero_3quarter")
    if hero_img:
        # Scale to fit column width, maintain aspect
        target_w = col_w * 2 + col_gap  # Span 2 columns
        target_h = int(target_w * hero_img.height / hero_img.width)
        if target_h > 900:
            target_h = 900
            target_w = int(target_h * hero_img.width / hero_img.height)
        hero_resized = hero_img.resize((target_w, target_h), Image.LANCZOS)
        canvas.paste(hero_resized, (col1_x, content_y), hero_resized)
        
        # Label
        label_y = content_y + target_h + 10
        draw.text((col1_x, label_y), "HERO THREE-QUARTER VIEW", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col1_x, label_y + 35), "Primary concept illustration — shows silhouette, proportions, major forms", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # Column 2-3 area: Side + Top orthographics
    col2_x = col1_x + col_w + col_gap
    side_img = images.get("side_ortho")
    top_img = images.get("top_ortho")
    
    ortho_h = 400
    if side_img:
        sw = int(ortho_h * side_img.width / side_img.height)
        side_resized = side_img.resize((sw, ortho_h), Image.LANCZOS)
        canvas.paste(side_resized, (col2_x, content_y), side_resized)
        draw.text((col2_x, content_y + ortho_h + 10), "SIDE ORTHOGRAPHIC", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col2_x, content_y + ortho_h + 40), "Reference for modeling — grip angle, slide profile, sight alignment", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    col3_x = col2_x + col_w + col_gap
    if top_img:
        tw = int(ortho_h * top_img.width / top_img.height)
        top_resized = top_img.resize((tw, ortho_h), Image.LANCZOS)
        canvas.paste(top_resized, (col3_x, content_y), top_resized)
        draw.text((col3_x, content_y + ortho_h + 10), "TOP ORTHOGRAPHIC", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col3_x, content_y + ortho_h + 40), "Width profile — slide width, trigger guard, magazine well", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # ============================================================
    # SECOND ROW: Close-up + Wireframe + Contact Sheet
    # ============================================================
    row2_y = content_y + 550
    
    # Close-up material study
    closeup_img = images.get("closeup")
    if closeup_img:
        cw = col_w
        ch = int(cw * closeup_img.height / closeup_img.width)
        if ch > 450:
            ch = 450
            cw = int(ch * closeup_img.width / closeup_img.height)
        closeup_resized = closeup_img.resize((cw, ch), Image.LANCZOS)
        canvas.paste(closeup_resized, (col1_x, row2_y), closeup_resized)
        draw.text((col1_x, row2_y + ch + 10), "CLOSE-UP MATERIAL STUDY", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col1_x, row2_y + ch + 40), "Surface detail — machining marks, wear patterns, material transitions", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # Wireframe/technical
    wireframe_img = images.get("wireframe")
    if wireframe_img:
        ww = col_w
        wh = int(ww * wireframe_img.height / wireframe_img.width)
        if wh > 450:
            wh = 450
            ww = int(wh * wireframe_img.width / wireframe_img.height)
        wire_resized = wireframe_img.resize((ww, wh), Image.LANCZOS)
        canvas.paste(wire_resized, (col2_x, row2_y), wire_resized)
        draw.text((col2_x, row2_y + wh + 10), "WIREFRAME / TECHNICAL", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col2_x, row2_y + wh + 40), "Edge flow, topology density, part separation for modeling reference", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # 8-direction contact sheet
    contact_img = images.get("contact_8dir")
    if contact_img:
        ctw = col_w
        cth = int(ctw * contact_img.height / contact_img.width)
        if cth > 450:
            cth = 450
            ctw = int(cth * contact_img.width / contact_img.height)
        contact_resized = contact_img.resize((ctw, cth), Image.LANCZOS)
        canvas.paste(contact_resized, (col3_x, row2_y), contact_resized)
        draw.text((col3_x, row2_y + cth + 10), "8-DIRECTION CONTACT SHEET", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col3_x, row2_y + cth + 40), "Gameplay sprite reference — N, NE, E, SE, S, SW, W, NW", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # ============================================================
    # THIRD ROW: Material Palette + Design Callouts
    # ============================================================
    row3_y = row2_y + 550
    
    # Material palette panel
    palette_w = col_w * 2 + col_gap
    palette_h = 200
    draw.rectangle([col1_x, row3_y, col1_x + palette_w, row3_y + palette_h], 
                   fill=COLORS["bg_panel"], outline=COLORS["border"], width=1)
    draw.text((col1_x + 20, row3_y + 20), "MATERIAL & COLOR PALETTE", font=font_subtitle, fill=COLORS["accent_amber"])
    
    # Palette swatches
    swatches = [
        ("Slide / Frame", (60, 55, 50), (90, 85, 80)),      # Dark gunmetal
        ("Worn Edges", (120, 100, 80), (160, 130, 100)),    # Brass/bronze wear
        ("Grip Polymer", (35, 35, 40), (55, 55, 60)),       # Dark polymer
        ("Sights / Accents", (200, 180, 60), (255, 220, 100)), # Tritium/amber
        ("Rust / Corrosion", (140, 50, 20), (180, 80, 30)),   # Rust spots
        ("Oil / Grime", (25, 20, 15), (45, 35, 25)),         # Dark grime
    ]
    
    swatch_x = col1_x + 30
    swatch_y = row3_y + 60
    swatch_w = 100
    swatch_h = 60
    gap = 20
    
    for i, (label, dark, light) in enumerate(swatches):
        x = swatch_x + (i % 3) * (swatch_w + gap)
        y = swatch_y + (i // 3) * (swatch_h + 30)
        
        # Gradient swatch
        for px in range(swatch_w):
            ratio = px / swatch_w
            r = int(dark[0] + (light[0] - dark[0]) * ratio)
            g = int(dark[1] + (light[1] - dark[1]) * ratio)
            b = int(dark[2] + (light[2] - dark[2]) * ratio)
            draw.line([(x + px, y), (x + px, y + swatch_h)], fill=(r, g, b))
        
        draw.rectangle([x, y, x + swatch_w, y + swatch_h], outline=COLORS["border"], width=1)
        draw.text((x, y + swatch_h + 5), label, font=font_small, fill=COLORS["text_secondary"])
    
    # Design identity callouts
    callout_x = col3_x
    callout_w = col_w
    callout_h = palette_h
    draw.rectangle([callout_x, row3_y, callout_x + callout_w, row3_y + callout_h], 
                   fill=COLORS["callout_bg"], outline=COLORS["callout_border"], width=2)
    draw.text((callout_x + 20, row3_y + 20), "DESIGN IDENTITY CALLOUTS", font=font_subtitle, fill=COLORS["accent_amber"])
    
    callouts = [
        "✓ Distinct silhouette — recognizable at 64px",
        "✓ Clear grip / slide / barrel separation",
        "✓ Visible sights (front post + rear notch)",
        "✓ Magazine well readable at small scale",
        "✗ Proportions slightly boxy (Rev2 limitation)",
        "✗ Materials lack hand-painted weathering",
        "✗ Surface detail insufficient for close-up",
        "✗ Weathering feels procedural, not narrative",
    ]
    
    for i, callout in enumerate(callouts):
        y = row3_y + 65 + i * 24
        color = COLORS["text_primary"] if callout.startswith("✓") else COLORS["accent_rust"]
        draw.text((callout_x + 20, y), callout, font=font_body, fill=color)
    
    # ============================================================
    # FOURTH ROW: In-Game Context
    # ============================================================
    row4_y = row3_y + palette_h + 40
    
    # Player equipped
    equipped_img = images.get("player_equipped")
    if equipped_img:
        ew = col_w
        eh = int(ew * equipped_img.height / equipped_img.width)
        if eh > 300:
            eh = 300
            ew = int(eh * equipped_img.width / equipped_img.height)
        equipped_resized = equipped_img.resize((ew, eh), Image.LANCZOS)
        canvas.paste(equipped_resized, (col1_x, row4_y), equipped_resized)
        draw.text((col1_x, row4_y + eh + 10), "IN-GAME EQUIPPED VIEW", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col1_x, row4_y + eh + 40), "Scale reference — weapon in player hand, inventory icon context", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # Inspection view
    inspect_img = images.get("inspection")
    if inspect_img:
        iw = col_w
        ih = int(iw * inspect_img.height / inspect_img.width)
        if ih > 300:
            ih = 300
            iw = int(ih * inspect_img.width / inspect_img.height)
        inspect_resized = inspect_img.resize((iw, ih), Image.LANCZOS)
        canvas.paste(inspect_resized, (col2_x, row4_y), inspect_resized)
        draw.text((col2_x, row4_y + ih + 10), "INSPECTION VIEW (1024px)", font=font_subtitle, fill=COLORS["accent_amber"])
        draw.text((col2_x, row4_y + ih + 40), "Close-up UI view — shows detail level needed for inspection screen", 
                  font=font_body, fill=COLORS["text_secondary"])
    
    # ============================================================
    # FOOTER: APPROVAL BLOCK
    # ============================================================
    footer_y = canvas_h - 180
    draw.rectangle([40, footer_y, canvas_w - 40, canvas_h - 40], 
                   fill=COLORS["bg_panel"], outline=COLORS["border"], width=2)
    
    draw.text((60, footer_y + 20), "CONCEPT APPROVAL DECISION", font=font_title, fill=COLORS["accent_amber"])
    
    # Approval options
    options_y = footer_y + 80
    draw.text((60, options_y), "☐ APPROVED — Proceed to hand-painted 2D concept pass → Production modeling", 
              font=font_body, fill=COLORS["text_primary"])
    draw.text((60, options_y + 35), "☐ REVISE — Direction approved, iterate on proportions/materials in 3D", 
              font=font_body, fill=COLORS["text_secondary"])
    draw.text((60, options_y + 70), "☐ REJECTED — New concept direction required (see ART_QUALITY_REVIEW.md)", 
              font=font_body, fill=COLORS["accent_rust"])
    
    # Signature lines
    sig_y = footer_y + 120
    draw.text((60, sig_y), "Art Director: _________________________    Date: ___________", font=font_body, fill=COLORS["text_secondary"])
    draw.text((canvas_w // 2 + 20, sig_y), "Tech Artist: _________________________    Date: ___________", font=font_body, fill=COLORS["text_secondary"])
    
    # Bottom note
    draw.text((60, canvas_h - 30), 
              "Generated from Rev2 procedural 3D renders | Next step: Commission professional 2D concept artist | VISUAL_DIRECTION.md compliant", 
              font=font_tiny, fill=COLORS["text_secondary"])
    
    # Save
    canvas.save(OUTPUT_PATH)
    print(f"Saved CONCEPT_APPROVAL.png: {OUTPUT_PATH} ({canvas_w}x{canvas_h})")
    return OUTPUT_PATH

if __name__ == "__main__":
    create_concept_sheet()