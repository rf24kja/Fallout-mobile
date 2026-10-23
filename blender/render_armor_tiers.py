#!/usr/bin/env python3
"""Armor Tier Paperdoll Render Pipeline for Fallout 2 Reborn Mobile.

Renders armor overlays for 4 armor tiers that can be layered on character base:
- Tier 1: Clothing/Leather (vault suit, leather armor, leather jacket)
- Tier 2: Light Metal (metal armor, combat armor)
- Tier 3: Heavy Metal (power armor, tesla armor)
- Tier 4: Advanced (enclave power armor, advanced power armor)

Each armor piece rendered in 8 directions, matching character frame size (128x256).
Output: armor_atlas.png + armor_atlas.json + armor_sprite_frames.tres per tier.
"""

import bpy
import math
import mathutils
import os
import json
import struct

# Configuration
RENDER_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/renders/armor"
OUTPUT_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/assets/characters"
TILE_SIZE = 128
CHAR_HEIGHT = 256
DIRECTIONS = 8
ELEVATION = math.radians(35.264)
AZIMUTH_BASE = math.radians(45)
DISTANCE = 30.0
ORTHO_SCALE = 8.0

# Direction names in order (starting from South = 0, going counter-clockwise)
DIR_NAMES = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

# Armor tier definitions
ARMOR_TIERS = {
    "tier_1_clothing": {
        "name": "Clothing/Leather",
        "pieces": ["vault_suit", "leather_armor", "leather_jacket"],
        "material": {
            "cloth": (0.25, 0.22, 0.18, 1.0),
            "leather": (0.18, 0.14, 0.10, 1.0),
            "metal": (0.35, 0.33, 0.30, 1.0),
        }
    },
    "tier_2_light_metal": {
        "name": "Light Metal",
        "pieces": ["metal_armor", "combat_armor"],
        "material": {
            "cloth": (0.20, 0.18, 0.16, 1.0),
            "leather": (0.16, 0.14, 0.12, 1.0),
            "metal": (0.55, 0.52, 0.48, 1.0),
        }
    },
    "tier_3_heavy_metal": {
        "name": "Heavy Metal",
        "pieces": ["power_armor", "tesla_armor"],
        "material": {
            "cloth": (0.15, 0.13, 0.11, 1.0),
            "leather": (0.12, 0.10, 0.08, 1.0),
            "metal": (0.65, 0.62, 0.58, 1.0),
        }
    },
    "tier_4_advanced": {
        "name": "Advanced",
        "pieces": ["enclave_power_armor", "advanced_power_armor"],
        "material": {
            "cloth": (0.10, 0.09, 0.08, 1.0),
            "leather": (0.08, 0.07, 0.06, 1.0),
            "metal": (0.75, 0.72, 0.68, 1.0),
        }
    }
}

# Armor piece shapes (simplified - in production use actual armor models)
ARMOR_PIECE_SHAPES = {
    "vault_suit": {"type": "full_body", "color_key": "cloth"},
    "leather_armor": {"type": "torso_arms", "color_key": "leather"},
    "leather_jacket": {"type": "torso_arms", "color_key": "leather"},
    "metal_armor": {"type": "torso_arms", "color_key": "metal"},
    "combat_armor": {"type": "full_body", "color_key": "metal"},
    "power_armor": {"type": "full_body_heavy", "color_key": "metal"},
    "tesla_armor": {"type": "full_body_heavy", "color_key": "metal"},
    "enclave_power_armor": {"type": "full_body_heavy", "color_key": "metal"},
    "advanced_power_armor": {"type": "full_body_heavy", "color_key": "metal"},
}

def clear_scene():
    """Remove all objects except camera and lights."""
    for obj in bpy.data.objects:
        if obj.type not in ('CAMERA', 'LIGHT'):
            bpy.data.objects.remove(obj, do_unlink=True)
    
    for block in bpy.data.meshes:
        if block.users == 0:
            bpy.data.meshes.remove(block)
    for block in bpy.data.materials:
        if block.users == 0:
            bpy.data.materials.remove(block)

def setup_camera_and_lights():
    """Create the standard isometric camera and light rig."""
    # Camera
    cam_data = bpy.data.cameras.new(name="IsometricCamera")
    cam_data.type = 'ORTHO'
    cam_data.ortho_scale = ORTHO_SCALE
    
    cam_obj = bpy.data.objects.new(name="IsometricCamera", object_data=cam_data)
    bpy.context.collection.objects.link(cam_obj)
    
    x = DISTANCE * math.cos(ELEVATION) * math.sin(AZIMUTH_BASE)
    y = -DISTANCE * math.cos(ELEVATION) * math.cos(AZIMUTH_BASE)
    z = DISTANCE * math.sin(ELEVATION)
    
    cam_obj.location = (x, y, z)
    
    direction = mathutils.Vector((0, 0, 0)) - cam_obj.location
    rot_quat = direction.to_track_quat('-Z', 'Y')
    cam_obj.rotation_euler = rot_quat.to_euler()
    
    bpy.context.scene.camera = cam_obj
    
    # Render settings
    scene = bpy.context.scene
    scene.render.resolution_x = TILE_SIZE
    scene.render.resolution_y = CHAR_HEIGHT
    scene.render.resolution_percentage = 100
    scene.render.film_transparent = True
    scene.render.image_settings.color_mode = 'RGBA'
    scene.render.image_settings.file_format = 'PNG'
    scene.render.engine = 'CYCLES'
    
    if scene.render.engine == 'CYCLES':
        scene.cycles.samples = 64
        scene.cycles.use_denoising = True
        scene.cycles.preview_samples = 32
    
    # Light rig
    key_light = bpy.data.lights.new(name="KeyLight", type='SUN')
    key_light.energy = 4.0
    key_light.angle = 0.53
    key_obj = bpy.data.objects.new(name="KeyLight", object_data=key_light)
    bpy.context.collection.objects.link(key_obj)
    key_obj.rotation_euler = (math.radians(45), 0, math.radians(-45))
    
    fill_light = bpy.data.lights.new(name="FillLight", type='AREA')
    fill_light.energy = 80.0
    fill_light.size = 15.0
    fill_obj = bpy.data.objects.new(name="FillLight", object_data=fill_light)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (-15, 15, 15)
    fill_obj.rotation_euler = (math.radians(-45), 0, math.radians(45))
    
    rim_light = bpy.data.lights.new(name="RimLight", type='SUN')
    rim_light.energy = 1.5
    rim_obj = bpy.data.objects.new(name="RimLight", object_data=rim_light)
    bpy.context.collection.objects.link(rim_obj)
    rim_obj.rotation_euler = (math.radians(-30), 0, math.radians(135))
    
    world = bpy.data.worlds["World"]
    try:
        bg = world.node_tree.nodes["Background"]
        bg.inputs[0].default_value = (0.05, 0.04, 0.03, 1.0)
        bg.inputs[1].default_value = 0.3
    except (KeyError, AttributeError):
        pass
    
    return cam_obj

def create_armor_piece(piece_name, tier_materials):
    """Create an armor piece mesh matching character proportions."""
    shape_info = ARMOR_PIECE_SHAPES.get(piece_name, {"type": "torso_arms", "color_key": "cloth"})
    piece_type = shape_info["type"]
    color_key = shape_info["color_key"]
    color = tier_materials.get(color_key, (0.5, 0.5, 0.5, 1.0))
    
    parts = {}
    
    if piece_type in ("torso_arms", "full_body", "full_body_heavy"):
        # Torso
        bpy.ops.mesh.primitive_cylinder_add(radius=0.37, depth=1.25, location=(0, 0, 1.0))
        torso = bpy.context.active_object
        torso.name = "Armor_Torso"
        parts["torso"] = torso
    
    if piece_type in ("torso_arms", "full_body", "full_body_heavy"):
        # Arms
        for side, x_offset in [("L", -0.47), ("R", 0.47)]:
            bpy.ops.mesh.primitive_cylinder_add(radius=0.13, depth=0.9, location=(x_offset, 0, 1.3))
            arm = bpy.context.active_object
            arm.name = f"Armor_Arm_{side}"
            arm.rotation_euler = (math.radians(90), 0, 0)
            parts[f"arm_{side.lower()}"] = arm
    
    if piece_type in ("full_body", "full_body_heavy"):
        # Legs
        for side, x_offset in [("L", -0.22), ("R", 0.22)]:
            bpy.ops.mesh.primitive_cylinder_add(radius=0.17, depth=1.05, location=(x_offset, 0, 0.5))
            leg = bpy.context.active_object
            leg.name = f"Armor_Leg_{side}"
            parts[f"leg_{side.lower()}"] = leg
    
    # Create material
    mat = bpy.data.materials.new(name=f"Armor_{piece_name}")
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = color
    
    if color_key == "metal":
        bsdf.inputs['Roughness'].default_value = 0.3
        bsdf.inputs['Metallic'].default_value = 0.9
    elif color_key == "leather":
        bsdf.inputs['Roughness'].default_value = 0.5
        # Specular input renamed in Blender 5.2+
        for spec_key in ['Specular', 'Specular IOR Level']:
            try:
                bsdf.inputs[spec_key].default_value = 0.3
                break
            except KeyError:
                continue
    else:  # cloth
        bsdf.inputs['Roughness'].default_value = 0.9
    
    mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    # Apply material
    for obj in parts.values():
        obj.data.materials.append(mat)
    
    # Join into single object
    bpy.ops.object.select_all(action='DESELECT')
    for part in parts.values():
        part.select_set(True)
    if parts:
        bpy.context.view_layer.objects.active = list(parts.values())[0]
        bpy.ops.object.join()
    
    armor = bpy.context.active_object
    armor.name = f"Armor_{piece_name}"
    armor.location = (0, 0, 0)
    
    return armor

def render_armor_tier(tier_id, tier_info):
    """Render all armor pieces for a tier."""
    clear_scene()
    cam = setup_camera_and_lights()
    
    tier_output_dir = os.path.join(OUTPUT_DIR, f"armor_{tier_id}")
    os.makedirs(tier_output_dir, exist_ok=True)
    
    # Also create renders dir for raw frames
    raw_dir = os.path.join(RENDER_DIR, tier_id)
    os.makedirs(raw_dir, exist_ok=True)
    
    scene = bpy.context.scene
    
    print(f"\n=== Rendering Armor Tier: {tier_info['name']} ({tier_id}) ===")
    
    all_frames = []
    frame_index = 0
    
    for piece_name in tier_info["pieces"]:
        armor = create_armor_piece(piece_name, tier_info["material"])
        
        piece_frames = []
        
        for dir_idx in range(DIRECTIONS):
            dir_name = DIR_NAMES[dir_idx]
            angle = dir_idx * (2 * math.pi / DIRECTIONS)
            armor.rotation_euler = (0, 0, angle)
            
            # Render single frame (idle pose) per direction
            output_path = os.path.join(raw_dir, f"{piece_name}_{dir_name}.png")
            scene.render.filepath = output_path
            bpy.ops.render.render(write_still=True)
            
            piece_frames.append({
                "piece": piece_name,
                "direction": dir_name,
                "file": f"{piece_name}_{dir_name}.png",
                "atlas_index": frame_index
            })
            frame_index += 1
            
            print(f"  {piece_name}_{dir_name}.png")
        
        all_frames.extend(piece_frames)
        
        # Clean up armor object for next piece
        bpy.data.objects.remove(armor, do_unlink=True)
    
    # Create atlas from rendered frames
    atlas_path = os.path.join(tier_output_dir, f"armor_{tier_id}_atlas.png")
    atlas_json_path = os.path.join(tier_output_dir, f"armor_{tier_id}_atlas.json")
    tres_path = os.path.join(tier_output_dir, f"armor_{tier_id}_sprite_frames.tres")
    
    # Use atlas builder to pack frames
    create_atlas_and_tres(raw_dir, all_frames, tier_output_dir, tier_id)
    
    print(f"Done! Output: {tier_output_dir}")

def create_atlas_and_tres(raw_dir, frames, output_dir, tier_id):
    """Pack rendered frames into atlas using Blender's image API and create SpriteFrames .tres."""
    
    # Calculate atlas size
    frames_per_row = 8
    rows = math.ceil(len(frames) / frames_per_row)
    atlas_width = frames_per_row * TILE_SIZE
    atlas_height = rows * CHAR_HEIGHT
    
    # Create atlas image using Blender
    atlas_name = f"armor_{tier_id}_atlas"
    if atlas_name in bpy.data.images:
        bpy.data.images.remove(bpy.data.images[atlas_name])
    
    atlas_img = bpy.data.images.new(atlas_name, width=atlas_width, height=atlas_height, alpha=True, float_buffer=False)
    # Initialize with transparent pixels
    pixels = [0.0] * (atlas_width * atlas_height * 4)
    atlas_img.pixels = pixels
    
    atlas_data = {
        "tier": tier_id,
        "atlas_file": f"armor_{tier_id}_atlas.png",
        "frame_size": [TILE_SIZE, CHAR_HEIGHT],
        "frames": []
    }
    
    for i, frame_info in enumerate(frames):
        frame_path = os.path.join(raw_dir, frame_info["file"])
        if os.path.exists(frame_path):
            # Load frame image
            frame_img_name = f"frame_{i}"
            if frame_img_name in bpy.data.images:
                bpy.data.images.remove(bpy.data.images[frame_img_name])
            frame_img = bpy.data.images.load(frame_path)
            frame_img.name = frame_img_name
            
            row = i // frames_per_row
            col = i % frames_per_row
            x = col * TILE_SIZE
            y = row * CHAR_HEIGHT
            
            # Copy frame pixels into atlas
            copy_image_to_atlas(frame_img, atlas_img, x, y, TILE_SIZE, CHAR_HEIGHT)
            
            atlas_data["frames"].append({
                "piece": frame_info["piece"],
                "direction": frame_info["direction"],
                "region": [x, y, TILE_SIZE, CHAR_HEIGHT],
                "atlas_index": i
            })
            
            # Clean up frame image
            bpy.data.images.remove(frame_img)
    
    # Save atlas
    atlas_path = os.path.join(output_dir, f"armor_{tier_id}_atlas.png")
    atlas_img.filepath_raw = atlas_path
    atlas_img.file_format = 'PNG'
    atlas_img.save()
    
    # Save atlas JSON
    atlas_json_path = os.path.join(output_dir, f"armor_{tier_id}_atlas.json")
    with open(atlas_json_path, 'w') as f:
        json.dump(atlas_data, f, indent=2)
    
    # Create SpriteFrames .tres
    create_sprite_frames_tres(atlas_data, output_dir, tier_id, atlas_path)
    
    # Clean up
    bpy.data.images.remove(atlas_img)

def copy_image_to_atlas(src_img, dst_img, dst_x, dst_y, w, h):
    """Copy source image pixels into destination atlas at given position."""
    src_pixels = list(src_img.pixels)
    dst_pixels = list(dst_img.pixels)
    
    src_w = src_img.size[0]
    src_h = src_img.size[1]
    dst_w = dst_img.size[0]
    
    for sy in range(h):
        for sx in range(w):
            src_idx = ((src_h - 1 - sy) * src_w + sx) * 4
            dy = dst_y + sy
            dx = dst_x + sx
            if dy < dst_img.size[1] and dx < dst_w:
                dst_idx = (dy * dst_w + dx) * 4
                dst_pixels[dst_idx:dst_idx+4] = src_pixels[src_idx:src_idx+4]
    
    dst_img.pixels = dst_pixels

def create_sprite_frames_tres(atlas_data, output_dir, tier_id, atlas_path):
    """Create Godot SpriteFrames .tres resource."""
    rel_atlas_path = atlas_path.replace("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/", "res://")
    
    lines = [
        f'[gd_resource type="SpriteFrames" load_steps={len(atlas_data["frames"]) + 2} format=3 uid://armor_{tier_id}_sprite_frames]',
        '',
        f'[sub_resource type="Texture2D" id="Texture2D_main"]',
        f'resource_path = "{rel_atlas_path.replace(chr(92), "/")}"',
        ''
    ]
    
    # Create AtlasTexture sub-resources
    for i, frame in enumerate(atlas_data["frames"]):
        region = frame["region"]
        lines.append(f'[sub_resource type="AtlasTexture" id="AtlasTexture_armor_{tier_id}_{frame["piece"]}_{frame["direction"]}"]')
        lines.append(f'atlas = SubResource("Texture2D_main")')
        lines.append(f'region = Rect2({region[0]}, {region[1]}, {region[2]}, {region[3]})')
        lines.append('')
    
    # Animation definitions
    lines.append('[resource]')
    lines.append(f' animations = {{')
    
    # Group frames by piece
    pieces = {}
    for frame in atlas_data["frames"]:
        piece = frame["piece"]
        if piece not in pieces:
            pieces[piece] = []
        pieces[piece].append(frame)
    
    anim_entries = []
    for piece, piece_frames in pieces.items():
        # Sort by direction order
        piece_frames.sort(key=lambda f: DIR_NAMES.index(f["direction"]))
        
        anim_name = f"armor_{piece}"
        frame_refs = []
        for frame in piece_frames:
            frame_refs.append(f'{{"texture": SubResource("AtlasTexture_armor_{tier_id}_{frame["piece"]}_{frame["direction"]}"), "duration": 1.0}}')
        
        anim_entries.append(f'"{anim_name}": [{", ".join(frame_refs)}]')
    
    lines.append('  ' + ', '.join(anim_entries))
    lines.append(' }')
    
    tres_path = os.path.join(output_dir, f"armor_{tier_id}_sprite_frames.tres")
    with open(tres_path, 'w') as f:
        f.write('\n'.join(lines))
    
    print(f"  Created: {os.path.basename(tres_path)}")

def render_all_armor_tiers():
    """Render all armor tiers."""
    for tier_id, tier_info in ARMOR_TIERS.items():
        render_armor_tier(tier_id, tier_info)
    
    print("\n=== All armor tiers rendered! ===")
    print(f"Output directory: {OUTPUT_DIR}")

if __name__ == "__main__":
    render_all_armor_tiers()