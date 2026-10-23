from PIL import Image, ImageDraw, ImageFont
import os

# Create contact sheet of 8-direction sprites
sprite_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate'
output_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol'

sprites = {}
for dir_name in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
    path = os.path.join(sprite_dir, f'pistol_{dir_name.lower()}.png')
    sprites[dir_name] = Image.open(path).convert('RGBA')

# Create 2x4 grid contact sheet
cell_size = 256
cols, rows = 4, 2
sheet = Image.new('RGBA', (cols * cell_size, rows * cell_size), (0, 0, 0, 0))
draw = ImageDraw.Draw(sheet)

# Try to load a font
try:
    font = ImageFont.truetype("arial.ttf", 24)
except:
    font = ImageFont.load_default()

positions = {
    'N': (0, 0), 'NE': (1, 0), 'E': (2, 0), 'SE': (3, 0),
    'S': (0, 1), 'SW': (1, 1), 'W': (2, 1), 'NW': (3, 1)
}

for dir_name, (col, row) in positions.items():
    x = col * cell_size
    y = row * cell_size
    sheet.paste(sprites[dir_name], (x, y), sprites[dir_name])
    draw.text((x + 10, y + 10), dir_name, fill=(255, 255, 255, 255), font=font)

contact_path = os.path.join(output_dir, 'pistol_contact_sheet_8dir.png')
sheet.save(contact_path)
print(f"Contact sheet saved: {contact_path}")

# Also create a version with bounding boxes highlighted
sheet_bb = sheet.copy()
draw_bb = ImageDraw.Draw(sheet_bb)
for dir_name, (col, row) in positions.items():
    x = col * cell_size
    y = row * cell_size
    # Find bounds
    img = sprites[dir_name]
    pixels = img.load()
    w, h = img.size
    min_x, min_y = w, h
    max_x, max_y = 0, 0
    found = False
    for yy in range(h):
        for xx in range(w):
            if pixels[xx, yy][3] > 0:
                found = True
                min_x = min(min_x, xx)
                min_y = min(min_y, yy)
                max_x = max(max_x, xx)
                max_y = max(max_y, yy)
    if found:
        # Draw red rectangle around content
        draw_bb.rectangle(
            [x + min_x, y + min_y, x + max_x + 1, y + max_y + 1],
            outline=(255, 0, 0, 255), width=2
        )

contact_bb_path = os.path.join(output_dir, 'pistol_contact_sheet_bounds.png')
sheet_bb.save(contact_bb_path)
print(f"Contact sheet with bounds saved: {contact_bb_path}")

# Now find placeholder weapons for comparison
placeholder_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons'
print("\n=== PLACEHOLDER WEAPONS ===")
for root, dirs, files in os.walk(placeholder_dir):
    for f in files:
        if f.endswith('.png') and 'production' not in root:
            print(os.path.join(root, f))