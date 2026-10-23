#!/usr/bin/env python3
"""Weapon Sprite Render Pipeline for Fallout 2 Reborn Mobile.

Renders 24 weapons × 8 directions for isometric UI/icons.
Output: weapon_atlas.png + weapon_atlas.json + weapon_sprite_frames.tres per weapon.
"""

import bpy
import math
import mathutils
import os
import json
import struct

# Configuration
RENDER_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/renders/weapons"
OUTPUT_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/assets/weapons"
TILE_SIZE = 128
CHAR_HEIGHT = 128  # Weapons are smaller than characters
DIRECTIONS = 8
ELEVATION = math.radians(35.264)
AZIMUTH_BASE = math.radians(45)
DISTANCE = 15.0
ORTHO_SCALE = 4.0

# Direction names (S, SW, W, NW, N, NE, E, SE)
DIR_NAMES = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

# Weapon definitions matching weapons.json
WEAPONS = {
    # Melee
    "scrap_knife": {"type": "MELEE", "subtype": "knife", "color": (0.35, 0.33, 0.30, 1.0), "scale": 1.0},
    "pipe_wrench": {"type": "MELEE", "subtype": "wrench", "color": (0.45, 0.42, 0.38, 1.0), "scale": 1.2},
    "machete": {"type": "MELEE", "subtype": "machete", "color": (0.35, 0.30, 0.25, 1.0), "scale": 1.4},
    "combat_knife": {"type": "MELEE", "subtype": "knife", "color": (0.20, 0.18, 0.16, 1.0), "scale": 1.0},
    "vibro_blade": {"type": "MELEE", "subtype": "knife", "color": (0.15, 0.45, 0.65, 1.0), "scale": 1.0, "emission": (0.0, 0.8, 1.0, 1.0)},
    
    # Pistols
    "scrap_pistol": {"type": "PISTOL", "subtype": "pistol", "color": (0.30, 0.28, 0.25, 1.0), "scale": 1.0},
    "38_revolver": {"type": "PISTOL", "subtype": "revolver", "color": (0.40, 0.38, 0.35, 1.0), "scale": 1.0},
    "9mm_auto": {"type": "PISTOL", "subtype": "auto", "color": (0.25, 0.23, 0.20, 1.0), "scale": 1.0},
    "44_magnum": {"type": "PISTOL", "subtype": "revolver", "color": (0.55, 0.52, 0.48, 1.0), "scale": 1.1},
    "10mm_tactical": {"type": "PISTOL", "subtype": "auto", "color": (0.20, 0.18, 0.15, 1.0), "scale": 1.0},
    
    # SMGs
    "pipe_smg": {"type": "SMG", "subtype": "smg", "color": (0.30, 0.28, 0.25, 1.0), "scale": 1.2},
    "9mm_smg": {"type": "SMG", "subtype": "smg", "color": (0.28, 0.26, 0.23, 1.0), "scale": 1.2},
    "10mm_smg": {"type": "SMG", "subtype": "smg", "color": (0.22, 0.20, 0.18, 1.0), "scale": 1.2},
    
    # Shotguns
    "sawed_off": {"type": "SHOTGUN", "subtype": "sawed_off", "color": (0.35, 0.32, 0.28, 1.0), "scale": 1.1},
    "pump_shotgun": {"type": "SHOTGUN", "subtype": "pump", "color": (0.38, 0.35, 0.30, 1.0), "scale": 1.3},
    "combat_shotgun": {"type": "SHOTGUN", "subtype": "drum", "color": (0.25, 0.23, 0.20, 1.0), "scale": 1.4},
    
    # Rifles
    "hunting_rifle": {"type": "RIFLE", "subtype": "bolt", "color": (0.40, 0.35, 0.28, 1.0), "scale": 1.5},
    "assault_rifle": {"type": "RIFLE", "subtype": "auto", "color": (0.22, 0.20, 0.18, 1.0), "scale": 1.4},
    "sniper_rifle": {"type": "RIFLE", "subtype": "bolt_heavy", "color": (0.18, 0.16, 0.14, 1.0), "scale": 1.6},
    
    # Heavy
    "light_machine_gun": {"type": "HEAVY", "subtype": "belt", "color": (0.25, 0.23, 0.20, 1.0), "scale": 1.8},
    
    # Energy
    "laser_pistol": {"type": "ENERGY", "subtype": "pistol", "color": (0.15, 0.35, 0.55, 1.0), "scale": 1.0, "emission": (0.0, 1.0, 0.3, 1.0)},
    "laser_rifle": {"type": "ENERGY", "subtype": "rifle", "color": (0.12, 0.30, 0.50, 1.0), "scale": 1.5, "emission": (0.0, 1.0, 0.3, 1.0)},
    "plasma_rifle": {"type": "ENERGY", "subtype": "rifle", "color": (0.65, 0.20, 0.10, 1.0), "scale": 1.5, "emission": (1.0, 0.3, 0.0, 1.0)},
    "gauss_rifle": {"type": "ENERGY", "subtype": "coilgun", "color": (0.55, 0.52, 0.48, 1.0), "scale": 1.6, "emission": (0.2, 0.6, 1.0, 1.0)},
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
    fill_light.size = 10.0
    fill_obj = bpy.data.objects.new(name="FillLight", object_data=fill_light)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (-10, 10, 10)
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

def create_weapon_mesh(weapon_id, weapon_info):
    """Create a weapon mesh matching the weapon type."""
    w_type = weapon_info["type"]
    w_subtype = weapon_info["subtype"]
    color = weapon_info["color"]
    scale = weapon_info.get("scale", 1.0)
    emission = weapon_info.get("emission", None)
    
    parts = {}
    
    if w_subtype == "knife":
        # Blade
        bpy.ops.mesh.primitive_plane_add(size=0.1, location=(0, 0, 0.8 * scale))
        blade = bpy.context.active_object
        blade.name = "Blade"
        blade.scale = (0.3 * scale, 1.5 * scale, 1.0)
        # Add thickness
        bpy.ops.object.modifier_add(type='SOLIDIFY')
        blade.modifiers["Solidify"].thickness = 0.02
        parts["blade"] = blade
        
        # Handle
        bpy.ops.mesh.primitive_cylinder_add(radius=0.08 * scale, depth=0.4 * scale, location=(0, 0, 0.3 * scale))
        handle = bpy.context.active_object
        handle.name = "Handle"
        handle.rotation_euler = (math.radians(90), 0, 0)
        parts["handle"] = handle
    
    elif w_subtype == "wrench":
        # Handle
        bpy.ops.mesh.primitive_cylinder_add(radius=0.1 * scale, depth=1.2 * scale, location=(0, 0, 0.4 * scale))
        handle = bpy.context.active_object
        handle.name = "Handle"
        parts["handle"] = handle
        
        # Jaw
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0.35 * scale, 0, 0.9 * scale))
        jaw = bpy.context.active_object
        jaw.name = "Jaw"
        jaw.scale = (1.0, 0.6, 0.4)
        parts["jaw"] = jaw
    
    elif w_subtype == "machete":
        # Blade
        bpy.ops.mesh.primitive_plane_add(size=0.12, location=(0, 0, 1.2 * scale))
        blade = bpy.context.active_object
        blade.name = "Blade"
        blade.scale = (0.35 * scale, 2.0 * scale, 1.0)
        bpy.ops.object.modifier_add(type='SOLIDIFY')
        blade.modifiers["Solidify"].thickness = 0.025
        parts["blade"] = blade
        
        # Handle
        bpy.ops.mesh.primitive_cylinder_add(radius=0.09 * scale, depth=0.45 * scale, location=(0, 0, 0.35 * scale))
        handle = bpy.context.active_object
        handle.name = "Handle"
        handle.rotation_euler = (math.radians(90), 0, 0)
        parts["handle"] = handle
        
        # Guard
        bpy.ops.mesh.primitive_cylinder_add(radius=0.25 * scale, depth=0.05 * scale, location=(0, 0, 0.65 * scale))
        guard = bpy.context.active_object
        guard.name = "Guard"
        parts["guard"] = guard
    
    elif w_subtype in ("pistol", "auto", "revolver"):
        # Frame/Grip
        bpy.ops.mesh.primitive_cube_add(size=0.3 * scale, location=(0, -0.1 * scale, 0.2 * scale))
        frame = bpy.context.active_object
        frame.name = "Frame"
        frame.scale = (1.0, 0.5, 1.2)
        parts["frame"] = frame
        
        # Barrel
        bpy.ops.mesh.primitive_cylinder_add(radius=0.06 * scale, depth=0.5 * scale, location=(0, 0.3 * scale, 0.2 * scale))
        barrel = bpy.context.active_object
        barrel.name = "Barrel"
        barrel.rotation_euler = (math.radians(90), 0, 0)
        parts["barrel"] = barrel
        
        if w_subtype == "revolver":
            # Cylinder
            bpy.ops.mesh.primitive_cylinder_add(radius=0.12 * scale, depth=0.2 * scale, location=(0, 0.05 * scale, 0.35 * scale))
            cylinder = bpy.context.active_object
            cylinder.name = "Cylinder"
            cylinder.rotation_euler = (math.radians(90), 0, 0)
            parts["cylinder"] = cylinder
        
        # Slide (for auto pistols)
        if w_subtype == "auto":
            bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, 0.1 * scale, 0.35 * scale))
            slide = bpy.context.active_object
            slide.name = "Slide"
            slide.scale = (1.2, 0.4, 0.6)
            parts["slide"] = slide
        
        # Magazine
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, -0.25 * scale, 0.0))
        mag = bpy.context.active_object
        mag.name = "Magazine"
        mag.scale = (1.0, 0.4, 1.5)
        parts["magazine"] = mag
    
    elif w_subtype == "smg":
        # Receiver
        bpy.ops.mesh.primitive_cube_add(size=0.4 * scale, location=(0, 0, 0.2 * scale))
        receiver = bpy.context.active_object
        receiver.name = "Receiver"
        receiver.scale = (1.0, 0.6, 0.8)
        parts["receiver"] = receiver
        
        # Barrel
        bpy.ops.mesh.primitive_cylinder_add(radius=0.05 * scale, depth=0.7 * scale, location=(0, 0.45 * scale, 0.2 * scale))
        barrel = bpy.context.active_object
        barrel.name = "Barrel"
        barrel.rotation_euler = (math.radians(90), 0, 0)
        parts["barrel"] = barrel
        
        # Stock
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, -0.4 * scale, 0.2 * scale))
        stock = bpy.context.active_object
        stock.name = "Stock"
        stock.scale = (0.8, 0.4, 0.8)
        parts["stock"] = stock
        
        # Magazine
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, -0.1 * scale, -0.2 * scale))
        mag = bpy.context.active_object
        mag.name = "Magazine"
        mag.scale = (1.0, 0.4, 1.8)
        parts["magazine"] = mag
    
    elif w_subtype in ("sawed_off", "pump", "drum"):
        # Receiver
        bpy.ops.mesh.primitive_cube_add(size=0.4 * scale, location=(0, 0, 0.2 * scale))
        receiver = bpy.context.active_object
        receiver.name = "Receiver"
        receiver.scale = (1.0, 0.5, 0.8)
        parts["receiver"] = receiver
        
        # Barrel(s)
        barrel_count = 2 if w_subtype == "sawed_off" else 1
        for i in range(barrel_count):
            offset = (i - 0.5) * 0.15
            bpy.ops.mesh.primitive_cylinder_add(radius=0.08 * scale, depth=0.5 * scale if w_subtype == "sawed_off" else 0.7 * scale, 
                                                location=(offset * scale, 0.35 * scale, 0.2 * scale))
            barrel = bpy.context.active_object
            barrel.name = f"Barrel_{i}"
            barrel.rotation_euler = (math.radians(90), 0, 0)
            parts[f"barrel_{i}"] = barrel
        
        # Stock (except sawed_off)
        if w_subtype != "sawed_off":
            bpy.ops.mesh.primitive_cube_add(size=0.25 * scale, location=(0, -0.45 * scale, 0.2 * scale))
            stock = bpy.context.active_object
            stock.name = "Stock"
            stock.scale = (1.0, 0.5, 1.0)
            parts["stock"] = stock
        
        if w_subtype == "drum":
            # Drum magazine
            bpy.ops.mesh.primitive_cylinder_add(radius=0.15 * scale, depth=0.2 * scale, location=(0, 0.1 * scale, 0.0))
            drum = bpy.context.active_object
            drum.name = "DrumMag"
            drum.rotation_euler = (math.radians(90), 0, 0)
            parts["drum"] = drum
        elif w_subtype == "pump":
            # Pump grip
            bpy.ops.mesh.primitive_cylinder_add(radius=0.06 * scale, depth=0.5 * scale, location=(0, 0.1 * scale, 0.1 * scale))
            pump = bpy.context.active_object
            pump.name = "Pump"
            pump.rotation_euler = (math.radians(90), 0, 0)
            parts["pump"] = pump
    
    elif w_subtype in ("bolt", "bolt_heavy", "auto"):
        # Receiver
        bpy.ops.mesh.primitive_cube_add(size=0.4 * scale, location=(0, 0, 0.2 * scale))
        receiver = bpy.context.active_object
        receiver.name = "Receiver"
        receiver.scale = (1.0, 0.5, 0.7)
        parts["receiver"] = receiver
        
        # Barrel
        barrel_length = 1.0 if w_subtype == "auto" else 1.3
        bpy.ops.mesh.primitive_cylinder_add(radius=0.05 * scale, depth=barrel_length * scale, location=(0, 0.55 * scale, 0.2 * scale))
        barrel = bpy.context.active_object
        barrel.name = "Barrel"
        barrel.rotation_euler = (math.radians(90), 0, 0)
        parts["barrel"] = barrel
        
        # Stock
        bpy.ops.mesh.primitive_cube_add(size=0.25 * scale, location=(0, -0.5 * scale, 0.2 * scale))
        stock = bpy.context.active_object
        stock.name = "Stock"
        stock.scale = (1.0, 0.5, 1.0)
        parts["stock"] = stock
        
        # Magazine
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, 0.05 * scale, -0.1 * scale))
        mag = bpy.context.active_object
        mag.name = "Magazine"
        mag.scale = (1.0, 0.4, 1.5)
        parts["magazine"] = mag
        
        if w_subtype == "bolt_heavy":
            # Scope
            bpy.ops.mesh.primitive_cylinder_add(radius=0.08 * scale, depth=0.4 * scale, location=(0, 0.1 * scale, 0.4 * scale))
            scope = bpy.context.active_object
            scope.name = "Scope"
            scope.rotation_euler = (math.radians(90), 0, 0)
            parts["scope"] = scope
        
        if w_subtype == "auto":
            # Handguard
            bpy.ops.mesh.primitive_cylinder_add(radius=0.07 * scale, depth=0.6 * scale, location=(0, 0.3 * scale, 0.25 * scale))
            handguard = bpy.context.active_object
            handguard.name = "Handguard"
            handguard.rotation_euler = (math.radians(90), 0, 0)
            parts["handguard"] = handguard
    
    elif w_subtype == "belt":
        # LMG receiver
        bpy.ops.mesh.primitive_cube_add(size=0.5 * scale, location=(0, 0, 0.25 * scale))
        receiver = bpy.context.active_object
        receiver.name = "Receiver"
        receiver.scale = (1.0, 0.7, 1.0)
        parts["receiver"] = receiver
        
        # Barrel
        bpy.ops.mesh.primitive_cylinder_add(radius=0.07 * scale, depth=1.0 * scale, location=(0, 0.65 * scale, 0.25 * scale))
        barrel = bpy.context.active_object
        barrel.name = "Barrel"
        barrel.rotation_euler = (math.radians(90), 0, 0)
        parts["barrel"] = barrel
        
        # Stock
        bpy.ops.mesh.primitive_cube_add(size=0.3 * scale, location=(0, -0.6 * scale, 0.25 * scale))
        stock = bpy.context.active_object
        stock.name = "Stock"
        stock.scale = (1.0, 0.6, 1.0)
        parts["stock"] = stock
        
        # Bipod
        for side, x_off in [("L", -0.2), ("R", 0.2)]:
            bpy.ops.mesh.primitive_cylinder_add(radius=0.04 * scale, depth=0.5 * scale, 
                                                location=(x_off * scale, 0.3 * scale, -0.1 * scale))
            bipod = bpy.context.active_object
            bipod.name = f"Bipod_{side}"
            bipod.rotation_euler = (math.radians(120), 0, 0)
            parts[f"bipod_{side.lower()}"] = bipod
        
        # Belt box
        bpy.ops.mesh.primitive_cube_add(size=0.3 * scale, location=(0.35 * scale, 0.0, 0.2 * scale))
        belt = bpy.context.active_object
        belt.name = "BeltBox"
        belt.scale = (0.6, 0.8, 0.6)
        parts["belt"] = belt
    
    elif w_subtype in ("pistol", "rifle", "coilgun") and w_type == "ENERGY":
        # Energy weapon frame
        bpy.ops.mesh.primitive_cube_add(size=0.3 * scale, location=(0, -0.05 * scale, 0.2 * scale))
        frame = bpy.context.active_object
        frame.name = "Frame"
        frame.scale = (1.0, 0.5, 1.0)
        parts["frame"] = frame
        
        # Barrel/emitter
        barrel_depth = 0.6 if w_subtype == "pistol" else 1.0
        bpy.ops.mesh.primitive_cylinder_add(radius=0.08 * scale, depth=barrel_depth * scale, location=(0, 0.35 * scale, 0.2 * scale))
        barrel = bpy.context.active_object
        barrel.name = "Emitter"
        barrel.rotation_euler = (math.radians(90), 0, 0)
        parts["emitter"] = barrel
        
        # Energy cell / magazine
        bpy.ops.mesh.primitive_cube_add(size=0.2 * scale, location=(0, -0.25 * scale, 0.0))
        cell = bpy.context.active_object
        cell.name = "EnergyCell"
        cell.scale = (1.0, 0.5, 1.5)
        parts["cell"] = cell
        
        if w_subtype in ("rifle", "coilgun"):
            # Stock
            bpy.ops.mesh.primitive_cube_add(size=0.25 * scale, location=(0, -0.5 * scale, 0.2 * scale))
            stock = bpy.context.active_object
            stock.name = "Stock"
            stock.scale = (1.0, 0.5, 1.0)
            parts["stock"] = stock
        
        if w_subtype == "coilgun":
            # Capacitor coils
            for i in range(3):
                bpy.ops.mesh.primitive_cylinder_add(radius=0.12 * scale, depth=0.08 * scale, 
                                                    location=(0, 0.2 * scale + i * 0.2 * scale, 0.3 * scale))
                coil = bpy.context.active_object
                coil.name = f"Coil_{i}"
                coil.rotation_euler = (math.radians(90), 0, 0)
                parts[f"coil_{i}"] = coil
    
    # Create material
    mat = bpy.data.materials.new(name=f"Weapon_{weapon_id}")
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = color
    
    if "leather" in weapon_id or "wood" in weapon_id:
        bsdf.inputs['Roughness'].default_value = 0.5
        for spec_key in ['Specular', 'Specular IOR Level']:
            try:
                bsdf.inputs[spec_key].default_value = 0.3
                break
            except KeyError:
                continue
    elif emission:
        bsdf.inputs['Roughness'].default_value = 0.1
        bsdf.inputs['Metallic'].default_value = 0.8
        bsdf.inputs['Emission Color'].default_value = emission
        bsdf.inputs['Emission Strength'].default_value = 5.0
    elif "metal" in weapon_id or w_type in ("ENERGY", "HEAVY"):
        bsdf.inputs['Roughness'].default_value = 0.25
        bsdf.inputs['Metallic'].default_value = 0.9
    else:
        bsdf.inputs['Roughness'].default_value = 0.4
        bsdf.inputs['Metallic'].default_value = 0.7
    
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
    
    weapon = bpy.context.active_object
    weapon.name = f"Weapon_{weapon_id}"
    weapon.location = (0, 0, 0)
    
    return weapon

def render_weapon(weapon_id, weapon_info):
    """Render a single weapon in all 8 directions."""
    clear_scene()
    cam = setup_camera_and_lights()
    
    raw_dir = os.path.join(RENDER_DIR, weapon_id)
    os.makedirs(raw_dir, exist_ok=True)
    
    scene = bpy.context.scene
    
    weapon = create_weapon_mesh(weapon_id, weapon_info)
    
    piece_frames = []
    
    for dir_idx in range(DIRECTIONS):
        dir_name = DIR_NAMES[dir_idx]
        angle = dir_idx * (2 * math.pi / DIRECTIONS)
        weapon.rotation_euler = (0, 0, angle)
        
        output_path = os.path.join(raw_dir, f"{weapon_id}_{dir_name}.png")
        scene.render.filepath = output_path
        bpy.ops.render.render(write_still=True)
        
        piece_frames.append({
            "weapon": weapon_id,
            "direction": dir_name,
            "file": f"{weapon_id}_{dir_name}.png"
        })
        
        print(f"  {weapon_id}_{dir_name}.png")
    
    # Clean up
    bpy.data.objects.remove(weapon, do_unlink=True)
    
    # Create atlas and tres
    create_atlas_and_tres(raw_dir, piece_frames, weapon_id)
    
    print(f"Done! Output: {OUTPUT_DIR}/{weapon_id}")

def create_atlas_and_tres(raw_dir, frames, weapon_id):
    """Pack rendered frames into atlas and create SpriteFrames .tres."""
    
    # Calculate atlas size - 8 frames per weapon
    frames_per_row = 8
    rows = math.ceil(len(frames) / frames_per_row)
    atlas_width = frames_per_row * TILE_SIZE
    atlas_height = rows * CHAR_HEIGHT
    
    # Create atlas image using Blender
    atlas_name = f"{weapon_id}_atlas"
    if atlas_name in bpy.data.images:
        bpy.data.images.remove(bpy.data.images[atlas_name])
    
    atlas_img = bpy.data.images.new(atlas_name, width=atlas_width, height=atlas_height, alpha=True, float_buffer=False)
    pixels = [0.0] * (atlas_width * atlas_height * 4)
    atlas_img.pixels = pixels
    
    atlas_data = {
        "weapon": weapon_id,
        "atlas_file": f"{weapon_id}_atlas.png",
        "frame_size": [TILE_SIZE, CHAR_HEIGHT],
        "frames": []
    }
    
    for i, frame_info in enumerate(frames):
        frame_path = os.path.join(raw_dir, frame_info["file"])
        if os.path.exists(frame_path):
            frame_img_name = f"frame_{i}"
            if frame_img_name in bpy.data.images:
                bpy.data.images.remove(bpy.data.images[frame_img_name])
            frame_img = bpy.data.images.load(frame_path)
            frame_img.name = frame_img_name
            
            row = i // frames_per_row
            col = i % frames_per_row
            x = col * TILE_SIZE
            y = row * CHAR_HEIGHT
            
            copy_image_to_atlas(frame_img, atlas_img, x, y, TILE_SIZE, CHAR_HEIGHT)
            
            atlas_data["frames"].append({
                "weapon": frame_info["weapon"],
                "direction": frame_info["direction"],
                "region": [x, y, TILE_SIZE, CHAR_HEIGHT],
                "atlas_index": i
            })
            
            bpy.data.images.remove(frame_img)
    
    # Save atlas
    output_dir = os.path.join(OUTPUT_DIR, weapon_id)
    os.makedirs(output_dir, exist_ok=True)
    
    atlas_path = os.path.join(output_dir, f"{weapon_id}_atlas.png")
    atlas_img.filepath_raw = atlas_path
    atlas_img.file_format = 'PNG'
    atlas_img.save()
    
    # Save atlas JSON
    atlas_json_path = os.path.join(output_dir, f"{weapon_id}_atlas.json")
    with open(atlas_json_path, 'w') as f:
        json.dump(atlas_data, f, indent=2)
    
    # Create SpriteFrames .tres
    create_sprite_frames_tres(atlas_data, output_dir, weapon_id, atlas_path)
    
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

def create_sprite_frames_tres(atlas_data, output_dir, weapon_id, atlas_path):
    """Create Godot SpriteFrames .tres resource."""
    rel_atlas_path = atlas_path.replace("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/", "res://").replace("\\", "/")
    
    lines = [
        f'[gd_resource type="SpriteFrames" load_steps={len(atlas_data["frames"]) + 2} format=3 uid://{weapon_id}_sprite_frames]',
        '',
        f'[sub_resource type="Texture2D" id="Texture2D_main"]',
        f'resource_path = "{rel_atlas_path}"',
        ''
    ]
    
    # Create AtlasTexture sub-resources
    for frame in atlas_data["frames"]:
        region = frame["region"]
        lines.append(f'[sub_resource type="AtlasTexture" id="AtlasTexture_{weapon_id}_{frame["direction"]}"]')
        lines.append(f'atlas = SubResource("Texture2D_main")')
        lines.append(f'region = Rect2({region[0]}, {region[1]}, {region[2]}, {region[3]})')
        lines.append('')
    
    # Animation - idle for each direction
    lines.append('[resource]')
    lines.append(' animations = {')
    
    # Create one animation per direction
    anim_entries = []
    for dir_name in DIR_NAMES:
        # Find frame for this direction
        frame = next((f for f in atlas_data["frames"] if f["direction"] == dir_name), None)
        if frame:
            anim_name = f"idle_{dir_name}"
            frame_ref = f'{{"texture": SubResource("AtlasTexture_{weapon_id}_{frame["direction"]}"), "duration": 1.0}}'
            anim_entries.append(f'"{anim_name}": [{frame_ref}]')
    
    lines.append('  ' + ', '.join(anim_entries))
    lines.append(' }')
    
    tres_path = os.path.join(output_dir, f"{weapon_id}_sprite_frames.tres")
    with open(tres_path, 'w') as f:
        f.write('\n'.join(lines))
    
    print(f"  Created: {os.path.basename(tres_path)}")

def render_all_weapons():
    """Render all weapons."""
    print(f"Rendering {len(WEAPONS)} weapons × {DIRECTIONS} directions...")
    
    for weapon_id, weapon_info in WEAPONS.items():
        print(f"\n=== Rendering Weapon: {weapon_id} ({weapon_info['type']}) ===")
        render_weapon(weapon_id, weapon_info)
    
    print(f"\n=== All weapons rendered! ===")
    print(f"Output directory: {OUTPUT_DIR}")

if __name__ == "__main__":
    render_all_weapons()