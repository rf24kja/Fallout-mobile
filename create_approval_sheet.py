import os
import sys

# Ensure PIL is importable
try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError as e:
    print(f"PIL import failed: {e}")
    print("Attempting to fix...")
    import subprocess
    subprocess.run([sys.executable, "-m", "pip", "install", "--force-reinstall", "pillow"], check=False)
    from PIL import Image, ImageDraw, ImageFont

output_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol'

# Load existing images
images = {}
for name in ['pistol_detail_closeup_1024', 'pistol_hero_3quarter_1024', 'pistol_side_1024', 
             'pistol_topdown_1024', 'pistol_wireframe_1024', 'pistol_contact_sheet_8dir',
             'pistol_contact_sheet_bounds', 'placeholder_vs_production_comparison',
             'placeholder_vs_production_native']:
    path = os.path.join(output_dir, name + '.png')
    if os.path.exists(path):
        images[name] = Image.open(path)
        print(f'Loaded {name}: {images[name].size}')
    else:
        print(f'MISSING: {name}')

# Create ART_APPROVAL_SHEET - 1920x1080
sheet = Image.new('RGBA', (1920, 1080), (20, 20, 25, 255))
draw = ImageDraw.Draw(sheet)

# Try to load a font
try:
    font_large = ImageFont.truetype('arial.ttf', 28)
    font_medium = ImageFont.truetype('arial.ttf', 18)
    font_small = ImageFont.truetype('arial.ttf', 14)
    font_tiny = ImageFont.truetype('arial.ttf', 12)
except:
    font_large = ImageFont.load_default()
    font_medium = ImageFont.load_default()
    font_small = ImageFont.load_default()
    font_tiny = ImageFont.load_default()

# Title
draw.text((40, 30), 'FALLOUT 2 REBORN MOBILE - ART APPROVAL SHEET', fill=(255, 255, 255, 255), font=font_large)
draw.text((40, 65), 'Production Pistol Candidate - A3 In-Game Validation Gate', fill=(200, 200, 200, 255), font=font_medium)
draw.text((40, 90), 'Status: ART_CANDIDATE - PENDING USER APPROVAL (A4 Gate)', fill=(255, 150, 0, 255), font=font_medium)

# Layout
# Row 1: Hero render + contact sheet
if 'pistol_hero_3quarter_1024' in images:
    hero = images['pistol_hero_3quarter_1024'].resize((480, 480), Image.LANCZOS)
    sheet.paste(hero, (40, 130))
    draw.text((40, 620), 'Blender Hero Render (1024px)', fill=(100, 255, 100, 255), font=font_small)

if 'pistol_contact_sheet_8dir' in images:
    contact = images['pistol_contact_sheet_8dir'].resize((800, 400), Image.LANCZOS)
    sheet.paste(contact, (540, 130))
    draw.text((540, 540), '8-Direction Sprite Contact Sheet', fill=(100, 255, 100, 255), font=font_small)

# Row 2: Side/Top/Detail + Bounds
y = 650
if 'pistol_side_1024' in images:
    side = images['pistol_side_1024'].resize((300, 300), Image.LANCZOS)
    sheet.paste(side, (40, y))
    draw.text((40, y + 310), 'Side View', fill=(180, 180, 180, 255), font=font_tiny)

if 'pistol_topdown_1024' in images:
    top = images['pistol_topdown_1024'].resize((300, 300), Image.LANCZOS)
    sheet.paste(top, (360, y))
    draw.text((360, y + 310), 'Top-Down View', fill=(180, 180, 180, 255), font=font_tiny)

if 'pistol_detail_closeup_1024' in images:
    detail = images['pistol_detail_closeup_1024'].resize((300, 300), Image.LANCZOS)
    sheet.paste(detail, (680, y))
    draw.text((680, y + 310), 'Detail Closeup', fill=(180, 180, 180, 255), font=font_tiny)

if 'pistol_wireframe_1024' in images:
    wire = images['pistol_wireframe_1024'].resize((300, 300), Image.LANCZOS)
    sheet.paste(wire, (1000, y))
    draw.text((1000, y + 310), 'Wireframe', fill=(180, 180, 180, 255), font=font_tiny)

# Row 3: Comparisons
y2 = y + 340
if 'placeholder_vs_production_comparison' in images:
    comp = images['placeholder_vs_production_comparison'].resize((900, 400), Image.LANCZOS)
    sheet.paste(comp, (40, y2))
    draw.text((40, y2 + 410), 'Placeholder vs Production - Scaled Comparison', fill=(255, 200, 100, 255), font=font_small)

if 'placeholder_vs_production_native' in images:
    native = images['placeholder_vs_production_native'].resize((900, 200), Image.LANCZOS)
    sheet.paste(native, (40, y2 + 440))
    draw.text((40, y2 + 650), 'Native Scale Comparison (1:1 pixel)', fill=(255, 200, 100, 255), font=font_small)

# Right column: Quality checklist
checklist_x = 1000
checklist_y = 130
draw.text((checklist_x, checklist_y), 'QUALITY CHECKLIST:', fill=(255, 255, 255, 255), font=font_medium)

checks = [
    ('Geometry Detail', '32 parts: slide, barrel, frame, grip, trigger, hammer, sights, magazine, controls'),
    ('Silhouette', 'Recognizable pistol profile at all 8 directions (isometric)'),
    ('Materials', 'Blued steel (slide/barrel), matte steel (frame), polymer (grip), brass (accents)'),
    ('Texture Quality', 'Procedural PBR materials - no UV unwrapping; render-time detail'),
    ('Lighting', '3-point studio + bounce, orthographic isometric (35.264 deg elev, 45 deg azim)'),
    ('Character Attachment', 'CharacterVisual.gd paperdoll WeaponSprite layer (z-index 6)'),
    ('Sprite Orientation', '8 dirs at isometric camera - N, NE, E, SE, S, SW, W, NW'),
    ('Game Scale', 'Fixed framing (ortho_scale=0.35) - 43-47px content in 256px canvas'),
    ('Mobile Readability', 'Tested at 1x, 2x, 4x zoom - visible at all levels'),
    ('Pipeline Consistency', 'SpriteFrames .tres + atlas.json + WEAPON_SPRITE_PATHS in CharacterVisual'),
]

for i, (title, desc) in enumerate(checks):
    y_pos = checklist_y + 35 + i * 28
    draw.text((checklist_x, y_pos), '[ ] ' + title, fill=(180, 255, 180, 255), font=font_small)
    draw.text((checklist_x + 10, y_pos + 16), desc, fill=(160, 160, 160, 255), font=font_tiny)

# Known issues
issues_y = checklist_y + 35 + len(checks) * 28 + 20
draw.text((checklist_x, issues_y), 'KNOWN ISSUES:', fill=(255, 150, 150, 255), font=font_medium)
issues = [
    'Sprite fill ratio 1.8-3.4% vs placeholder 2.9-4.8% - production sprites smaller in absolute px',
    '_is_ui_focused() does not detect instanced DialogueUI in headless mode (test workaround applied)',
    'Wireframe render failed (Blender 5.2 Freestyle API) - needs manual inspection',
    'No GLTF export yet - visual_asset path is placeholder',
    'In-game screenshots (equipped/inventory/combat) pending - headless capture not working',
]
for i, issue in enumerate(issues):
    draw.text((checklist_x + 10, issues_y + 30 + i * 22), '! ' + issue, fill=(255, 180, 180, 255), font=font_tiny)

# Save
out_path = os.path.join(output_dir, 'ART_APPROVAL_SHEET.png')
sheet.save(out_path)
print(f'Saved ART_APPROVAL_SHEET.png: {out_path}')