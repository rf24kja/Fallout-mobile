from PIL import Image
import os

sprite_dir = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate'
for dir_name in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
    path = os.path.join(sprite_dir, f'pistol_{dir_name.lower()}.png')
    img = Image.open(path)
    if img.mode != 'RGBA':
        print(f'{dir_name}: Not RGBA')
        continue
    pixels = img.load()
    width, height = img.size
    
    min_x, min_y = width, height
    max_x, max_y = 0, 0
    found = False
    
    for y in range(height):
        for x in range(width):
            if pixels[x, y][3] > 0:
                found = True
                min_x = min(min_x, x)
                min_y = min(min_y, y)
                max_x = max(max_x, x)
                max_y = max(max_y, y)
    
    if not found:
        print(f'{dir_name}: NO CONTENT')
        continue
    
    content_w = max_x - min_x + 1
    content_h = max_y - min_y + 1
    fill_ratio = (content_w * content_h) / (width * height)
    print(f'{dir_name}: content={content_w}x{content_h} at ({min_x},{min_y})-({max_x},{max_y}) fill={fill_ratio*100:.1f}% canvas={width}x{height}')