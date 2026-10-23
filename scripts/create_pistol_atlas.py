"""
Create production pistol atlas and SpriteFrames.tres for Godot integration.
Uses 8 fixed-direction sprites (256x256 each) in a horizontal strip.
"""
import os
import json
from PIL import Image

SPRITE_DIR = r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate'
OUTPUT_DIR = SPRITE_DIR

# 8 directions in Godot order (matches existing atlases: S, SW, W, NW, N, NE, E, SE)
directions = ['S', 'SW', 'W', 'NW', 'N', 'NE', 'E', 'SE']

# Load frames
frames = {}
for dir_name in directions:
    path = os.path.join(SPRITE_DIR, f'pistol_{dir_name.lower()}.png')
    if os.path.exists(path):
        frames[dir_name] = Image.open(path).convert('RGBA')
        print(f"Loaded {dir_name}: {frames[dir_name].size}")
    else:
        print(f"MISSING: {dir_name}")

# Create horizontal atlas (8 frames x 256px = 2048px wide)
frame_w, frame_h = 256, 256
atlas = Image.new('RGBA', (frame_w * 8, frame_h), (0, 0, 0, 0))

for i, dir_name in enumerate(directions):
    if dir_name in frames:
        atlas.paste(frames[dir_name], (i * frame_w, 0), frames[dir_name])

atlas_path = os.path.join(OUTPUT_DIR, 'production_pistol_atlas.png')
atlas.save(atlas_path)
print(f"\nAtlas saved: {atlas_path} ({atlas.size})")

# Create JSON metadata
json_data = {
    'weapon': 'production_pistol',
    'atlas_file': 'production_pistol_atlas.png',
    'frame_size': [frame_w, frame_h],
    'frames': []
}

for i, dir_name in enumerate(directions):
    json_data['frames'].append({
        'weapon': 'production_pistol',
        'direction': dir_name,
        'region': [i * frame_w, 0, frame_w, frame_h],
        'atlas_index': i
    })

json_path = os.path.join(OUTPUT_DIR, 'production_pistol_atlas.json')
with open(json_path, 'w') as f:
    json.dump(json_data, f, indent=2)
print(f"JSON saved: {json_path}")

# Create SpriteFrames.tres
tres_content = f'''[gd_resource type="SpriteFrames" load_steps=1 format=3 uid://bk9vq7d8e9fgh]

[resource]
animations = {{
"production_pistol_S": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_SW": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_W": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_NW": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_N": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_NE": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_E": {{
"frames": 1,
"loop": false,
"speed": 5.0
}},
"production_pistol_SE": {{
"frames": 1,
"loop": false,
"speed": 5.0
}}
}}
animation_set = "production_pistol_S"
frames = {{
"production_pistol_S": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 0, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_SW": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 256, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_W": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 512, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_NW": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 768, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_N": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 1024, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_NE": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 1280, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_E": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 1536, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}},
"production_pistol_SE": [{{
"duration": 1.0,
"texture": {{"__enable_path__": true, "path": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png"}},
"region": {{"x": 1792, "y": 0, "w": 256, "h": 256}},
"filter_clip": {{"x": 0, "y": 0, "w": 0, "h": 0}}
}}
}}
'''

tres_path = os.path.join(OUTPUT_DIR, 'production_pistol_sprite_frames.tres')
with open(tres_path, 'w') as f:
    f.write(tres_content)
print(f"SpriteFrames.tres saved: {tres_path}")

print("\nDone! Production pistol atlas and SpriteFrames ready for Godot.")