from PIL import Image, ImageDraw, ImageFont
import os
import json

output_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol'

def extract_frames(atlas_path, json_path, output_prefix):
    """Extract individual frames from atlas."""
    with open(json_path) as f:
        data = json.load(f)
    
    atlas = Image.open(atlas_path).convert('RGBA')
    frames = {}
    for frame_info in data['frames']:
        direction = frame_info['direction']
        region = frame_info['region']  # [x, y, w, h]
        frame = atlas.crop((region[0], region[1], region[0] + region[2], region[1] + region[3]))
        frames[direction] = frame
    
    return frames

def measure_bounds(img):
    """Measure non-transparent content bounds."""
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
    if not found:
        return None
    return {
        'width': max_x - min_x + 1,
        'height': max_y - min_y + 1,
        'min_x': min_x, 'min_y': min_y,
        'max_x': max_x, 'max_y': max_y,
        'canvas_width': w, 'canvas_height': h,
        'fill_ratio': ((max_x - min_x + 1) * (max_y - min_y + 1)) / (w * h)
    }

# Extract placeholder frames
print("=== PLACEHOLDER SPRITE BOUNDS ===")
for name in ['scrap_pistol', '9mm_auto', '44_magnum']:
    atlas_path = f'C:\\Code\\REA_FALLOUT\\Fallout2_Reborn_Mobile\\assets\\weapons\\{name}\\{name}_atlas.png'
    json_path = f'C:\\Code\\REA_FALLOUT\\Fallout2_Reborn_Mobile\\assets\\weapons\\{name}\\{name}_atlas.json'
    frames = extract_frames(atlas_path, json_path, name)
    
    print(f"\n{name}:")
    for direction in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
        if direction in frames:
            bounds = measure_bounds(frames[direction])
            if bounds:
                print(f"  {direction}: content={bounds['width']}x{bounds['height']} fill={bounds['fill_ratio']*100:.1f}%")
            else:
                print(f"  {direction}: NO CONTENT")

# Extract production pistol frames
print("\n=== PRODUCTION PISTOL SPRITE BOUNDS ===")
prod_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate'
for dir_name in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
    path = os.path.join(prod_dir, f'pistol_{dir_name.lower()}.png')
    img = Image.open(path).convert('RGBA')
    bounds = measure_bounds(img)
    if bounds:
        print(f"  {dir_name}: content={bounds['width']}x{bounds['height']} fill={bounds['fill_ratio']*100:.1f}% canvas={bounds['canvas_width']}x{bounds['canvas_height']}")

# Create comparison contact sheet: Placeholder vs Production
print("\n=== CREATING COMPARISON ===")
# Use scrap_pistol as representative placeholder
placeholder_frames = extract_frames(
    r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\scrap_pistol\scrap_pistol_atlas.png',
    r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\scrap_pistol\scrap_pistol_atlas.json',
    'scrap_pistol'
)

prod_frames = {}
for dir_name in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
    path = os.path.join(prod_dir, f'pistol_{dir_name.lower()}.png')
    prod_frames[dir_name] = Image.open(path).convert('RGBA')

# Create comparison: 2 rows x 8 cols
# Row 0: Placeholder (scrap_pistol)
# Row 1: Production pistol
cell_w, cell_h = 256, 256
cols = 8
comparison = Image.new('RGBA', (cols * cell_w, 2 * cell_h), (20, 20, 30, 255))
draw = ImageDraw.Draw(comparison)

try:
    font = ImageFont.truetype("arial.ttf", 20)
    title_font = ImageFont.truetype("arial.ttf", 28)
except:
    font = ImageFont.load_default()
    title_font = ImageFont.load_default()

# Title row
draw.text((10, 10), "PLACEHOLDER (scrap_pistol) - 128x128 frames", fill=(200, 200, 200, 255), font=title_font)
draw.text((10, cell_h + 10), "PRODUCTION CANDIDATE - 256x256 frames", fill=(200, 200, 200, 255), font=title_font)

dir_order = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
for col, dir_name in enumerate(dir_order):
    x = col * cell_w
    
    # Placeholder frame (upscale to 256 for comparison)
    ph_frame = placeholder_frames[dir_name].resize((cell_w, cell_h), Image.LANCZOS)
    comparison.paste(ph_frame, (x, cell_w), ph_frame)
    draw.text((x + 10, cell_w + 10), dir_name, fill=(255, 255, 255, 255), font=font)
    
    # Production frame
    comparison.paste(prod_frames[dir_name], (x, cell_h + cell_w), prod_frames[dir_name])
    draw.text((x + 10, cell_h + cell_w + 10), dir_name, fill=(255, 255, 255, 255), font=font)

comp_path = os.path.join(output_dir, 'placeholder_vs_production_comparison.png')
comparison.save(comp_path)
print(f"Comparison saved: {comp_path}")

# Also create side-by-side at native sizes
native_comp = Image.new('RGBA', (128 + 256, 8 * 128), (20, 20, 30, 255))
draw_n = ImageDraw.Draw(native_comp)

for row, dir_name in enumerate(dir_order):
    y = row * 128
    # Placeholder at native 128
    native_comp.paste(placeholder_frames[dir_name], (0, y), placeholder_frames[dir_name])
    draw_n.text((5, y + 5), f"PH:{dir_name}", fill=(200, 200, 200, 255), font=font)
    # Production at native 256
    native_comp.paste(prod_frames[dir_name], (128, y), prod_frames[dir_name])
    draw_n.text((133, y + 5), f"PROD:{dir_name}", fill=(200, 200, 200, 255), font=font)

native_comp_path = os.path.join(output_dir, 'placeholder_vs_production_native.png')
native_comp.save(native_comp_path)
print(f"Native size comparison saved: {native_comp_path}")

# Create a detailed analysis summary
print("\n=== SUMMARY ===")
print("Placeholder frames: 128x128 canvas")
print("Production frames: 256x256 canvas")
print("Both have similar fill ratios (~0.2-0.3%)")
print("Production uses 2x canvas but same tiny content")