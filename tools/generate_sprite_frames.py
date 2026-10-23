#!/usr/bin/env python3
"""Generate Godot SpriteFrames .tres files from character atlas metadata."""

import json
from pathlib import Path

ASSETS_DIR = Path("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/assets/characters")
CHARACTERS = ["survivor", "npc_friendly", "hostile"]

ANIMATIONS = [
    ("idle", 4),
    ("walk", 8),
    ("attack_ranged", 6),
    ("attack_melee", 6),
    ("hit", 3),
    ("death", 6),
]

DIR_NAMES = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

def generate_sprite_frames_tres(char_type):
    """Generate a complete SpriteFrames .tres file."""
    meta_path = ASSETS_DIR / f"{char_type}_atlas.json"
    with open(meta_path) as f:
        meta = json.load(f)
    
    # Build frame lookup
    frame_lookup = {}
    for fd in meta["frames"]:
        key = (fd["anim"], fd["dir"], fd["frame"])
        frame_lookup[key] = fd
    
    # Generate sub-resources for each frame
    sub_resources = []
    frame_res_ids = {}
    
    res_id = 1
    for anim_name, frame_count in ANIMATIONS:
        for dir_name in DIR_NAMES:
            for frame in range(1, frame_count + 1):
                key = (anim_name, dir_name, frame)
                if key in frame_lookup:
                    fd = frame_lookup[key]
                    res_name = f"AtlasTexture_{char_type}_{anim_name}_{dir_name}_{frame:02d}"
                    frame_res_ids[key] = res_name
                    
                    sub_resources.append({
                        "id": res_id,
                        "type": "AtlasTexture",
                        "name": res_name,
                        "atlas": "Texture2D_main",
                        "region": f"Rect2({fd['x']}, {fd['y']}, {fd['w']}, {fd['h']})"
                    })
                    res_id += 1
    
    # Build animations dictionary
    animations = {}
    for anim_name, frame_count in ANIMATIONS:
        anim_directions = []
        for dir_name in DIR_NAMES:
            dir_frames = []
            for frame in range(1, frame_count + 1):
                key = (anim_name, dir_name, frame)
                if key in frame_res_ids:
                    dir_frames.append(f'SubResource("{frame_res_ids[key]}")')
            if dir_frames:
                anim_directions.append({
                    "direction": dir_name,
                    "frames": dir_frames
                })
        if anim_directions:
            animations[anim_name] = anim_directions
    
    # Write .tres file
    tres_path = ASSETS_DIR / f"{char_type}_sprite_frames.tres"
    
    with open(tres_path, 'w') as f:
        f.write(f'[gd_resource type="SpriteFrames" load_steps={len(sub_resources) + 2} format=3 uid://{char_type}_sprite_frames]\n\n')
        
        # Main texture
        f.write(f'[sub_resource type="Texture2D" id="Texture2D_main"]\n')
        f.write(f'resource_path = "res://assets/characters/{char_type}_atlas.png"\n\n')
        
        # Sub-resources (AtlasTextures)
        for sr in sub_resources:
            f.write(f'[sub_resource type="AtlasTexture" id="{sr["name"]}"]\n')
            f.write(f'atlas = SubResource("Texture2D_main")\n')
            f.write(f'region = {sr["region"]}\n\n')
        
        # Resource
        f.write('[resource]\n')
        f.write('animations = {\n')
        
        for anim_name, anim_data in animations.items():
            f.write(f'  "{anim_name}": [\n')
            for ad in anim_data:
                frames_str = ", ".join(ad["frames"])
                f.write(f'    {{"direction": "{ad["direction"]}", "frames": [{frames_str}], "speed": {10 if anim_name == "walk" else 8 if anim_name in ("attack_ranged", "attack_melee") else 6 if anim_name == "death" else 4}}},\n')
            f.write('  ],\n')
        
        f.write('}\n')
    
    print(f"Generated: {tres_path}")

def main():
    for char_type in CHARACTERS:
        generate_sprite_frames_tres(char_type)
    print("\nDone! All SpriteFrames .tres files generated.")

if __name__ == "__main__":
    main()