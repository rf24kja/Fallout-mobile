#!/usr/bin/env python3
"""Generate a simple test ground tile for pipeline validation."""

from PIL import Image, ImageDraw
import os

def create_test_tile(name, color_base, pattern=None):
    """Create a 128x128 test tile."""
    img = Image.new('RGBA', (128, 128), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Base color
    draw.rectangle([0, 0, 127, 127], fill=color_base)
    
    # Add pattern if specified
    if pattern == 'grid':
        for i in range(0, 128, 16):
            draw.line([(i, 0), (i, 127)], fill=tuple(min(c+30, 255) for c in color_base[:3]) + (255,), width=1)
            draw.line([(0, i), (127, i)], fill=tuple(min(c+30, 255) for c in color_base[:3]) + (255,), width=1)
    elif pattern == 'cracked':
        # Draw some cracks
        draw.line([(10, 10), (118, 118)], fill=(20, 20, 20, 255), width=2)
        draw.line([(118, 10), (10, 118)], fill=(20, 20, 20, 255), width=2)
        draw.line([(64, 0), (64, 127)], fill=(30, 30, 30, 255), width=1)
        draw.line([(0, 64), (127, 64)], fill=(30, 30, 30, 255), width=1)
    elif pattern == 'rubble':
        # Scattered debris
        import random
        random.seed(42)
        for _ in range(30):
            x = random.randint(5, 122)
            y = random.randint(5, 122)
            r = random.randint(2, 8)
            draw.ellipse([x-r, y-r, x+r, y+r], fill=(40, 35, 30, 255))
    elif pattern == 'blood':
        # Blood splatter
        import random
        random.seed(123)
        for _ in range(20):
            x = random.randint(10, 118)
            y = random.randint(10, 118)
            r = random.randint(3, 12)
            draw.ellipse([x-r, y-r, x+r, y+r], fill=(120, 20, 20, 200))
    
    # Add border for tile identification
    draw.rectangle([0, 0, 127, 127], outline=(255, 255, 255, 100), width=1)
    
    return img

# Create ground variants
os.makedirs('tiles/ground', exist_ok=True)

variants = [
    ('ground_01_clean', (80, 70, 60), None),
    ('ground_02_grid', (75, 65, 55), 'grid'),
    ('ground_03_cracked', (70, 60, 50), 'cracked'),
    ('ground_04_rubble', (65, 55, 45), 'rubble'),
    ('ground_05_blood', (80, 70, 60), 'blood'),
    ('ground_06_dark', (50, 45, 40), None),
    ('ground_07_ash', (90, 85, 80), None),
    ('ground_08_sand', (120, 110, 95), None),
]

for name, color, pattern in variants:
    img = create_test_tile(name, color, pattern)
    img.save(f'tiles/ground/{name}.png')
    print(f"Created: tiles/ground/{name}.png")

print("\nCreated 8 ground tile variants. Now run:")
print("  python tools/atlas_builder.py --input tiles/ground --output atlases")