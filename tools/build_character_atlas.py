#!/usr/bin/env python3
"""Character Atlas Builder for Fallout 2 Reborn Mobile.

Packs rendered character frames into optimized texture atlases.
Generates Godot TextureAtlas and AnimationPlayer resources.
"""

import os
import json
from PIL import Image
from pathlib import Path

RENDER_DIR = Path("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/renders/characters")
OUTPUT_DIR = Path("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/assets/characters")
ATLAS_SIZE = 4096
FRAME_W = 128
FRAME_H = 256

ANIMATIONS = [
    ("idle", 4),
    ("walk", 8),
    ("attack_ranged", 6),
    ("attack_melee", 6),
    ("hit", 3),
    ("death", 6),
]

DIR_NAMES = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

CHARACTERS = ["survivor", "npc_friendly", "hostile"]

def pack_character_atlas(char_type):
    """Pack all frames for one character into a single atlas."""
    char_dir = RENDER_DIR / char_type
    if not char_dir.exists():
        print(f"Missing: {char_dir}")
        return None
    
    # Calculate total frames
    total_frames = sum(frames * 8 for _, frames in ANIMATIONS)
    
    # Create atlas grid
    cols = min(32, total_frames)
    rows = (total_frames + cols - 1) // cols
    
    atlas_w = min(cols * FRAME_W, ATLAS_SIZE)
    atlas_h = min(rows * FRAME_H, ATLAS_SIZE)
    
    # Create atlas image
    atlas = Image.new('RGBA', (atlas_w, atlas_h), (0, 0, 0, 0))
    
    frame_data = []
    frame_idx = 0
    
    for anim_name, frame_count in ANIMATIONS:
        for dir_idx, dir_name in enumerate(DIR_NAMES):
            for frame in range(1, frame_count + 1):
                filename = f"{anim_name}_{dir_name}_{frame:02d}.png"
                filepath = char_dir / filename
                
                if filepath.exists():
                    img = Image.open(filepath)
                    # Ensure correct size
                    if img.size != (FRAME_W, FRAME_H):
                        img = img.resize((FRAME_W, FRAME_H), Image.LANCZOS)
                    
                    # Position in atlas
                    col = frame_idx % cols
                    row = frame_idx // cols
                    x = col * FRAME_W
                    y = row * FRAME_H
                    
                    atlas.paste(img, (x, y))
                    
                    # Store frame metadata
                    frame_data.append({
                        "anim": anim_name,
                        "dir": dir_name,
                        "frame": frame,
                        "x": x,
                        "y": y,
                        "w": FRAME_W,
                        "h": FRAME_H,
                        "index": frame_idx
                    })
                    
                    frame_idx += 1
                else:
                    print(f"Missing frame: {filepath}")
    
    # Save atlas
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    atlas_path = OUTPUT_DIR / f"{char_type}_atlas.png"
    atlas.save(atlas_path)
    print(f"Saved atlas: {atlas_path} ({atlas_w}x{atlas_h}, {frame_idx} frames)")
    
    # Save metadata
    meta = {
        "character": char_type,
        "atlas_size": [atlas_w, atlas_h],
        "frame_size": [FRAME_W, FRAME_H],
        "animations": ANIMATIONS,
        "directions": DIR_NAMES,
        "frames": frame_data
    }
    
    meta_path = OUTPUT_DIR / f"{char_type}_atlas.json"
    with open(meta_path, 'w') as f:
        json.dump(meta, f, indent=2)
    
    return meta

def generate_godot_atlas_tres(char_type, meta):
    """Generate Godot TextureAtlas (.tres) file."""
    atlas_path = OUTPUT_DIR / f"{char_type}_atlas.png"
    
    # Create region entries
    regions = []
    for fd in meta["frames"]:
        region = {
            "name": f"{fd['anim']}_{fd['dir']}_{fd['frame']:02d}",
            "region": {
                "x": fd["x"],
                "y": fd["y"],
                "w": fd["w"],
                "h": fd["h"]
            }
        }
        regions.append(region)
    
    # Sort by name for consistent ordering
    regions.sort(key=lambda r: r["name"])
    
    # Build .tres content
    tres_content = f'''[gd_resource type="AtlasTexture" load_steps=2 format=3 uid://{char_type}_atlas]

[sub_resource type="Texture2D" id="Texture2D_{char_type}"]
resource_path = "res://assets/characters/{char_type}_atlas.png"

[resource]
atlas = SubResource("Texture2D_{char_type}")
region = Rect2(0, 0, {FRAME_W}, {FRAME_H})
'''
    
    # Actually, let's create individual AtlasTexture resources instead
    # and an AnimationPlayer with sprite frames
    return regions

def generate_sprite_frames_tres(char_type, meta):
    """Generate SpriteFrames resource for Godot AnimationPlayer."""
    # This creates a .tres that defines all animations
    # We'll output a Python dict that can be used to create the resource
    
    animations = {}
    for anim_name, frame_count in ANIMATIONS:
        anim_frames = []
        for dir_idx, dir_name in enumerate(DIR_NAMES):
            dir_frames = []
            for frame in range(1, frame_count + 1):
                frame_name = f"{anim_name}_{dir_name}_{frame:02d}"
                # Find the frame data
                fd = next((f for f in meta["frames"] 
                          if f["anim"] == anim_name and f["dir"] == dir_name and f["frame"] == frame), None)
                if fd:
                    dir_frames.append({
                        "texture": f"res://assets/characters/{char_type}_atlas.png",
                        "region": [fd["x"], fd["y"], fd["w"], fd["h"]],
                        "duration": 0.1 if anim_name == "walk" else 0.15
                    })
            if dir_frames:
                anim_frames.append({
                    "direction": dir_name,
                    "frames": dir_frames
                })
        if anim_frames:
            animations[anim_name] = anim_frames
    
    return animations

def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    
    all_metadata = {}
    
    for char_type in CHARACTERS:
        print(f"\n=== Packing {char_type} ===")
        meta = pack_character_atlas(char_type)
        if meta:
            all_metadata[char_type] = meta
            
            # Generate Godot-ready animation data
            anim_data = generate_sprite_frames_tres(char_type, meta)
            anim_path = OUTPUT_DIR / f"{char_type}_animations.json"
            with open(anim_path, 'w') as f:
                json.dump(anim_data, f, indent=2)
            print(f"Saved animation data: {anim_path}")
    
    # Create master index
    index = {
        "characters": list(all_metadata.keys()),
        "atlas_format": "RGBA",
        "frame_size": [FRAME_W, FRAME_H],
        "animations": [a[0] for a in ANIMATIONS],
        "directions": DIR_NAMES
    }
    
    with open(OUTPUT_DIR / "characters_index.json", 'w') as f:
        json.dump(index, f, indent=2)
    
    print(f"\n=== Done! Output: {OUTPUT_DIR} ===")

if __name__ == "__main__":
    main()