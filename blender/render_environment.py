#!/usr/bin/env python3
"""Environment Art Render Pipeline for Fallout 2 Reborn Mobile.

Renders isometric tiles for wasteland environment:
- Ground tiles (8 variants × 4 states = 32 tiles)
- Wall tiles (8 variants × 3 damage states = 24 tiles)
- Container props (4 types × 3 states = 12 props)
- Debris/scenery (8 types × 2 states = 16 props)
- Road pieces (6 types)

Output: atlas.png + atlas.json + tilemap.tres per category.
"""

import bpy
import math
import mathutils
import os
import json

# Configuration
RENDER_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/renders/environment"
OUTPUT_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/assets/environment"
TILE_SIZE = 128
DIRECTIONS = 1  # Environment tiles don't rotate - single orthographic view
ELEVATION = math.radians(35.264)
AZIMUTH_BASE = math.radians(45)
DISTANCE = 25.0
ORTHO_SCALE = 8.0

# Direction names
DIR_NAMES = ["ISO"]

# Environment tile definitions
ENVIRONMENT = {
    "ground": {
        "variants": [
            {"id": "dirt_01", "color": (0.35, 0.30, 0.25, 1.0), "roughness": 0.8},
            {"id": "dirt_02", "color": (0.32, 0.28, 0.23, 1.0), "roughness": 0.85},
            {"id": "cracked_earth_01", "color": (0.28, 0.24, 0.20, 1.0), "roughness": 0.9},
            {"id": "cracked_earth_02", "color": (0.30, 0.26, 0.22, 1.0), "roughness": 0.9},
            {"id": "rubble_01", "color": (0.38, 0.35, 0.32, 1.0), "roughness": 0.7},
            {"id": "rubble_02", "color": (0.40, 0.37, 0.34, 1.0), "roughness": 0.7},
            {"id": "scorched_01", "color": (0.20, 0.18, 0.16, 1.0), "roughness": 0.95},
            {"id": "asphalt_01", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6},
        ],
        "states": ["clean", "stained", "cracked", "puddle"],
    },
    "wall": {
        "variants": [
            {"id": "concrete_01", "color": (0.45, 0.42, 0.38, 1.0), "roughness": 0.6},
            {"id": "concrete_02", "color": (0.48, 0.45, 0.41, 1.0), "roughness": 0.55},
            {"id": "brick_01", "color": (0.55, 0.35, 0.25, 1.0), "roughness": 0.7},
            {"id": "brick_02", "color": (0.50, 0.30, 0.20, 1.0), "roughness": 0.75},
            {"id": "metal_01", "color": (0.50, 0.48, 0.45, 1.0), "roughness": 0.3, "metallic": 0.8},
            {"id": "metal_02", "color": (0.45, 0.43, 0.40, 1.0), "roughness": 0.35, "metallic": 0.85},
            {"id": "sandbag_01", "color": (0.42, 0.38, 0.32, 1.0), "roughness": 0.8},
            {"id": "barrier_01", "color": (0.35, 0.32, 0.28, 1.0), "roughness": 0.6},
        ],
        "states": ["intact", "damaged", "destroyed"],
    },
    "container": {
        "variants": [
            {"id": "crate_wood_01", "color": (0.45, 0.35, 0.25, 1.0), "roughness": 0.7, "scale": 1.0},
            {"id": "crate_wood_02", "color": (0.40, 0.32, 0.22, 1.0), "roughness": 0.75, "scale": 0.8},
            {"id": "crate_metal_01", "color": (0.48, 0.46, 0.43, 1.0), "roughness": 0.4, "metallic": 0.7, "scale": 1.0},
            {"id": "barrel_01", "color": (0.35, 0.30, 0.25, 1.0), "roughness": 0.5, "scale": 0.7},
            {"id": "barrel_02", "color": (0.55, 0.30, 0.15, 1.0), "roughness": 0.4, "scale": 0.7},
            {"id": "box_01", "color": (0.38, 0.35, 0.30, 1.0), "roughness": 0.6, "scale": 0.8},
            {"id": "locker_01", "color": (0.42, 0.40, 0.38, 1.0), "roughness": 0.5, "metallic": 0.6, "scale": 1.5},
            {"id": "dumpster_01", "color": (0.25, 0.23, 0.20, 1.0), "roughness": 0.7, "scale": 2.0},
        ],
        "states": ["closed", "open", "damaged"],
    },
    "debris": {
        "variants": [
            {"id": "rubble_pile_01", "color": (0.38, 0.35, 0.32, 1.0), "roughness": 0.75, "scale": 1.2},
            {"id": "rubble_pile_02", "color": (0.35, 0.32, 0.28, 1.0), "roughness": 0.8, "scale": 0.8},
            {"id": "pipe_pile_01", "color": (0.30, 0.28, 0.25, 1.0), "roughness": 0.4, "metallic": 0.7, "scale": 0.8},
            {"id": "tire_pile_01", "color": (0.12, 0.10, 0.08, 1.0), "roughness": 0.9, "scale": 1.0},
            {"id": "car_wreck_01", "color": (0.25, 0.22, 0.18, 1.0), "roughness": 0.5, "metallic": 0.6, "scale": 2.5},
            {"id": "car_wreck_02", "color": (0.35, 0.15, 0.10, 1.0), "roughness": 0.6, "metallic": 0.5, "scale": 2.5},
            {"id": "concrete_block_01", "color": (0.42, 0.40, 0.38, 1.0), "roughness": 0.6, "scale": 1.0},
            {"id": "scrap_metal_01", "color": (0.40, 0.38, 0.35, 1.0), "roughness": 0.35, "metallic": 0.8, "scale": 1.0},
        ],
        "states": ["clean", "weathered"],
    },
    "road": {
        "variants": [
            {"id": "road_straight", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6, "type": "straight"},
            {"id": "road_curve", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6, "type": "curve"},
            {"id": "road_t_junction", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6, "type": "t_junction"},
            {"id": "road_cross", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6, "type": "cross"},
            {"id": "road_end", "color": (0.22, 0.20, 0.18, 1.0), "roughness": 0.6, "type": "end"},
            {"id": "road_dirt_path", "color": (0.35, 0.30, 0.25, 1.0), "roughness": 0.8, "type": "dirt"},
        ],
        "states": ["intact"],
    },
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
    scene.render.resolution_y = TILE_SIZE
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

def create_material(name, color, roughness=0.5, metallic=0.0, emission=None):
    """Create a PBR material."""
    mat = bpy.data.materials.new(name=name)
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = color
    bsdf.inputs['Roughness'].default_value = roughness
    bsdf.inputs['Metallic'].default_value = metallic
    
    if emission:
        bsdf.inputs['Emission Color'].default_value = emission
        bsdf.inputs['Emission Strength'].default_value = 3.0
    
    # Specular handling for Blender 5.2+
    for spec_key in ['Specular', 'Specular IOR Level']:
        try:
            bsdf.inputs[spec_key].default_value = 0.5
            break
        except KeyError:
            continue
    
    mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    return mat

# ============================================================
# GROUND TILES
# ============================================================
def create_ground_tile(variant, state):
    """Create a ground tile mesh."""
    scale = 1.0
    
    # Base plane
    bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0, 0, 0))
    tile = bpy.context.active_object
    tile.name = f"Tile_{variant['id']}_{state}"
    
    # Apply material
    base_color = variant["color"]
    rough = variant.get("roughness", 0.8)
    
    if state == "stained":
        base_color = tuple(c * 0.85 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.1, 1.0)
    elif state == "cracked":
        base_color = tuple(c * 0.9 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.05, 1.0)
    elif state == "puddle":
        base_color = tuple(c * 0.6 for c in base_color[:3]) + (1.0,)
        rough = 0.1
    
    mat = create_material(f"Ground_{variant['id']}_{state}", base_color, rough)
    tile.data.materials.append(mat)
    
    # Collect all objects to join
    objects_to_join = [tile]
    
    # Add crack geometry for cracked state
    if state == "cracked":
        for i in range(3):
            bpy.ops.mesh.primitive_plane_add(size=0.02, location=(
                (i - 1) * 0.3, (i - 1) * 0.2, 0.002))
            crack = bpy.context.active_object
            crack.name = f"Crack_{i}"
            crack.rotation_euler = (0, 0, math.radians(i * 30 + 15))
            crack.data.materials.append(mat)
            objects_to_join.append(crack)
    
    # Add puddle geometry
    if state == "puddle":
        bpy.ops.mesh.primitive_circle_add(radius=0.35, location=(0, 0, 0.003))
        puddle = bpy.context.active_object
        puddle.name = "Puddle"
        puddle.data.materials.append(mat)
        objects_to_join.append(puddle)
    
    # Add stain geometry
    if state == "stained":
        for i in range(2):
            bpy.ops.mesh.primitive_circle_add(radius=0.15, location=(
                (i - 0.5) * 0.3, (i - 0.5) * 0.2, 0.001))
            stain = bpy.context.active_object
            stain.name = f"Stain_{i}"
            stain.data.materials.append(mat)
            objects_to_join.append(stain)
    
    # Join all into single object
    bpy.ops.object.select_all(action='DESELECT')
    for obj in objects_to_join:
        obj.select_set(True)
    bpy.context.view_layer.objects.active = tile
    bpy.ops.object.join()
    
    return bpy.context.active_object

# ============================================================
# WALL TILES
# ============================================================
def create_wall_tile(variant, state):
    """Create a wall tile mesh (vertical, 2 tiles high)."""
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, 0, 1.0))
    wall = bpy.context.active_object
    wall.name = f"Wall_{variant['id']}_{state}"
    wall.scale = (1.0, 0.25, 2.0)
    
    base_color = variant["color"]
    rough = variant.get("roughness", 0.6)
    metallic = variant.get("metallic", 0.0)
    
    if state == "damaged":
        base_color = tuple(c * 0.8 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.15, 1.0)
        # Add crack lines
        for i in range(4):
            bpy.ops.mesh.primitive_plane_add(size=0.02, location=(
                0.51, (i - 1.5) * 0.4, 0.5 + i * 0.3))
            crack = bpy.context.active_object
            crack.name = f"Crack_{i}"
            crack.rotation_euler = (0, math.radians(90), math.radians(i * 20 - 30))
            crack.scale = (1.0, 2.0, 1.0)
    elif state == "destroyed":
        base_color = tuple(c * 0.6 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.2, 1.0)
        wall.scale = (1.0, 0.25, 1.2)
        # Add rubble at base
        for i in range(5):
            bpy.ops.mesh.primitive_cube_add(size=0.15, location=(
                (i - 2) * 0.2, 0.2, 0.07))
            rubble = bpy.context.active_object
            rubble.name = f"Rubble_{i}"
            rubble.scale = (1.0 + (i % 3) * 0.3, 0.8, 0.5)
    
    mat = create_material(f"Wall_{variant['id']}_{state}", base_color, rough, metallic)
    wall.data.materials.append(mat)
    
    return wall

# ============================================================
# CONTAINER PROPS
# ============================================================
def create_container(variant, state):
    """Create a container prop."""
    scale = variant.get("scale", 1.0)
    
    if "crate" in variant["id"] or "box" in variant["id"]:
        bpy.ops.mesh.primitive_cube_add(size=0.8 * scale, location=(0, 0, 0.4 * scale))
        container = bpy.context.active_object
        container.name = f"{variant['id']}_{state}"
        
        if "wood" in variant["id"]:
            # Add wood planks detail
            for i in range(3):
                bpy.ops.mesh.primitive_plane_add(size=0.75 * scale, location=(
                    0, 0.38 * scale, (i - 1) * 0.27 * scale + 0.4 * scale))
                plank = bpy.context.active_object
                plank.name = f"Plank_{i}"
                plank.rotation_euler = (math.radians(90), 0, 0)
                plank.parent = container
        
        if state == "open":
            # Lid open
            bpy.ops.mesh.primitive_plane_add(size=0.85 * scale, location=(
                0, -0.45 * scale, 0.8 * scale))
            lid = bpy.context.active_object
            lid.name = "Lid"
            lid.rotation_euler = (math.radians(-120), 0, 0)
            lid.parent = container
        elif state == "damaged":
            container.scale = (1.0, 1.0, 0.7)
    
    elif "barrel" in variant["id"]:
        bpy.ops.mesh.primitive_cylinder_add(radius=0.4 * scale, depth=1.0 * scale, location=(0, 0, 0.5 * scale))
        container = bpy.context.active_object
        container.name = f"{variant['id']}_{state}"
        
        # Top/bottom rims
        for z, name in [(0.5 * scale, "TopRim"), (-0.5 * scale, "BottomRim")]:
            bpy.ops.mesh.primitive_cylinder_add(radius=0.45 * scale, depth=0.05 * scale, location=(0, 0, z))
            rim = bpy.context.active_object
            rim.name = name
            rim.parent = container
        
        if state == "open":
            # Remove top
            pass  # just don't render top rim
        elif state == "damaged":
            container.scale = (1.0, 1.0, 0.8)
            # Add dent
            bpy.ops.mesh.primitive_uv_sphere_add(radius=0.15 * scale, location=(0.3 * scale, 0, 0.2 * scale))
            dent = bpy.context.active_object
            dent.name = "Dent"
            dent.scale = (1.0, 1.5, 0.5)
            dent.parent = container
    
    elif "locker" in variant["id"]:
        bpy.ops.mesh.primitive_cube_add(size=0.6 * scale, location=(0, 0, 1.5 * scale))
        container = bpy.context.active_object
        container.name = f"{variant['id']}_{state}"
        container.scale = (0.8, 0.4, 2.5)
        
        # Door
        bpy.ops.mesh.primitive_plane_add(size=0.55 * scale, location=(
            0, 0.21 * scale, 1.5 * scale))
        door = bpy.context.active_object
        door.name = "Door"
        door.rotation_euler = (0, 0, 0)
        
        if state == "open":
            door.rotation_euler = (0, math.radians(-90), 0)
            door.location = (-0.28 * scale, 0.21 * scale, 1.5 * scale)
        elif state == "damaged":
            door.rotation_euler = (0, math.radians(-45), 0)
            door.location = (-0.2 * scale, 0.21 * scale, 1.5 * scale)
        door.parent = container
    
    elif "dumpster" in variant["id"]:
        bpy.ops.mesh.primitive_cube_add(size=1.0 * scale, location=(0, 0, 1.2 * scale))
        container = bpy.context.active_object
        container.name = f"{variant['id']}_{state}"
        container.scale = (1.5, 1.0, 2.0)
        
        # Lid
        bpy.ops.mesh.primitive_plane_add(size=1.4 * scale, location=(0, -0.52 * scale, 2.4 * scale))
        lid = bpy.context.active_object
        lid.name = "Lid"
        lid.rotation_euler = (math.radians(-10), 0, 0)
        lid.parent = container
    
    base_color = variant["color"]
    rough = variant.get("roughness", 0.5)
    metallic = variant.get("metallic", 0.0)
    
    if state == "damaged":
        base_color = tuple(c * 0.75 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.15, 1.0)
    elif state == "open":
        rough = min(rough + 0.05, 1.0)
    
    mat = create_material(f"Container_{variant['id']}_{state}", base_color, rough, metallic)
    container.data.materials.append(mat)
    
    # Apply to children
    for child in container.children:
        child.data.materials.append(mat)
    
    return container

# ============================================================
# DEBRIS
# ============================================================
def create_debris(variant, state):
    """Create debris/scenery prop."""
    scale = variant.get("scale", 1.0)
    
    if "rubble" in variant["id"]:
        # Irregular pile of rocks
        bpy.ops.mesh.primitive_uv_sphere_add(radius=0.5 * scale, location=(0, 0, 0.3 * scale))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        debris.scale = (1.5, 1.2, 0.6)
        bpy.ops.object.modifier_add(type='SUBSURF')
        debris.modifiers["Subdivision"].levels = 1
        
        # Add smaller rocks
        for i in range(4):
            bpy.ops.mesh.primitive_uv_sphere_add(radius=0.15 * scale, location=(
                (i % 2 - 0.5) * 0.6 * scale, (i // 2 - 0.5) * 0.6 * scale, 0.1 * scale))
            rock = bpy.context.active_object
            rock.name = f"Rock_{i}"
            rock.parent = debris
    
    elif "pipe" in variant["id"]:
        # Stack of pipes
        bpy.ops.mesh.primitive_cylinder_add(radius=0.15 * scale, depth=1.5 * scale, location=(0, 0, 0.75 * scale))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        
        for i in range(2):
            for j in range(2):
                bpy.ops.mesh.primitive_cylinder_add(radius=0.12 * scale, depth=1.5 * scale, location=(
                    (i - 0.5) * 0.25 * scale, (j - 0.5) * 0.25 * scale, 0.75 * scale + i * 0.25 * scale))
                pipe = bpy.context.active_object
                pipe.name = f"Pipe_{i}_{j}"
                pipe.parent = debris
    
    elif "tire" in variant["id"]:
        # Stack of tires
        bpy.ops.mesh.primitive_torus_add(major_radius=0.4 * scale, minor_radius=0.1 * scale, location=(0, 0, 0.2 * scale))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        
        for i in range(3):
            bpy.ops.mesh.primitive_torus_add(major_radius=0.35 * scale, minor_radius=0.08 * scale, location=(
                0, 0, 0.2 * scale + i * 0.15 * scale))
            tire = bpy.context.active_object
            tire.name = f"Tire_{i}"
            tire.parent = debris
    
    elif "car_wreck" in variant["id"]:
        # Car body
        bpy.ops.mesh.primitive_cube_add(size=1.0 * scale, location=(0, 0, 0.4 * scale))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        debris.scale = (2.0, 1.0, 0.6)
        
        # Cab
        bpy.ops.mesh.primitive_cube_add(size=0.6 * scale, location=(0.6 * scale, 0, 1.0 * scale))
        cab = bpy.context.active_object
        cab.name = "Cab"
        cab.scale = (0.8, 0.8, 1.0)
        cab.parent = debris
        
        # Wheels (2 remaining)
        for side, x in [("F", 0.8), ("R", -0.8)]:
            bpy.ops.mesh.primitive_cylinder_add(radius=0.3 * scale, depth=0.15 * scale, location=(x * scale, 0.6 * scale, 0.3 * scale))
            wheel = bpy.context.active_object
            wheel.name = f"Wheel_{side}"
            wheel.rotation_euler = (math.radians(90), 0, 0)
            wheel.parent = debris
        
        if state == "weathered":
            debris.scale = (1.9, 0.95, 0.5)
    
    elif "concrete_block" in variant["id"]:
        bpy.ops.mesh.primitive_cube_add(size=1.0 * scale, location=(0, 0, 0.5 * scale))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        debris.scale = (1.2, 0.8, 1.0)
        
        # Rebar sticking out
        for i in range(4):
            bpy.ops.mesh.primitive_cylinder_add(radius=0.02 * scale, depth=0.3 * scale, location=(
                (i % 2 - 0.5) * 0.5 * scale, (i // 2 - 0.5) * 0.3 * scale, 0.65 * scale))
            rebar = bpy.context.active_object
            rebar.name = f"Rebar_{i}"
            rebar.parent = debris
    
    elif "scrap_metal" in variant["id"]:
        # Bent metal sheets
        bpy.ops.mesh.primitive_plane_add(size=1.0 * scale, location=(0, 0, 0))
        debris = bpy.context.active_object
        debris.name = f"{variant['id']}_{state}"
        
        for i in range(3):
            bpy.ops.mesh.primitive_plane_add(size=0.8 * scale, location=(
                0, 0, i * 0.2 * scale))
            sheet = bpy.context.active_object
            sheet.name = f"Sheet_{i}"
            sheet.rotation_euler = (math.radians(i * 30 - 30), math.radians(i * 15), 0)
            sheet.parent = debris
    
    base_color = variant["color"]
    rough = variant.get("roughness", 0.7)
    metallic = variant.get("metallic", 0.0)
    
    if state == "weathered":
        base_color = tuple(c * 0.7 for c in base_color[:3]) + (1.0,)
        rough = min(rough + 0.2, 1.0)
    
    mat = create_material(f"Debris_{variant['id']}_{state}", base_color, rough, metallic)
    debris.data.materials.append(mat)
    
    for child in debris.children:
        child.data.materials.append(mat)
    
    return debris

# ============================================================
# ROAD PIECES
# ============================================================
def create_road(variant, state):
    """Create a road tile."""
    bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0, 0, 0))
    road = bpy.context.active_object
    road.name = f"{variant['id']}_{state}"
    
    base_color = variant["color"]
    rough = variant.get("roughness", 0.6)
    
    mat = create_material(f"Road_{variant['id']}_{state}", base_color, rough)
    road.data.materials.append(mat)
    
    # Add road markings for non-dirt roads
    if variant["type"] != "dirt":
        # Center line
        if variant["type"] in ("straight", "dirt"):
            bpy.ops.mesh.primitive_plane_add(size=0.02, location=(0, 0, 0.01))
            line = bpy.context.active_object
            line.name = "CenterLine"
            line.scale = (1.0, 0.5, 1.0)
            line_mat = create_material("RoadLine", (0.9, 0.85, 0.1, 1.0), 0.2)
            line.data.materials.append(line_mat)
            line.parent = road
        
        # Edge lines
        for y, name in [(-0.48, "EdgeLine_L"), (0.48, "EdgeLine_R")]:
            bpy.ops.mesh.primitive_plane_add(size=0.01, location=(0, y, 0.01))
            edge = bpy.context.active_object
            edge.name = name
            edge.scale = (1.0, 1.0, 1.0)
            edge_mat = create_material("RoadEdge", (1.0, 1.0, 1.0, 1.0), 0.2)
            edge.data.materials.append(edge_mat)
            edge.parent = road
    
    # Add cracks for dirt path
    if variant["type"] == "dirt":
        for i in range(4):
            bpy.ops.mesh.primitive_plane_add(size=0.015, location=(
                (i - 1.5) * 0.25, (i - 1.5) * 0.15, 0.005))
            crack = bpy.context.active_object
            crack.name = f"Crack_{i}"
            crack.rotation_euler = (0, 0, math.radians(i * 25 + 10))
            crack_mat = create_material("DirtCrack", tuple(c * 0.5 for c in base_color[:3]) + (1.0,), 0.9)
            crack.data.materials.append(crack_mat)
            crack.parent = road
    
    return road

# ============================================================
# RENDER FUNCTIONS
# ============================================================
def render_category(category_name, category_data):
    """Render all variants and states for a category."""
    clear_scene()
    cam = setup_camera_and_lights()
    
    raw_dir = os.path.join(RENDER_DIR, category_name)
    os.makedirs(raw_dir, exist_ok=True)
    
    scene = bpy.context.scene
    
    frames = []
    
    for variant in category_data["variants"]:
        for state in category_data["states"]:
            print(f"  Rendering {variant['id']}_{state}...")
            
            if category_name == "ground":
                obj = create_ground_tile(variant, state)
            elif category_name == "wall":
                obj = create_wall_tile(variant, state)
            elif category_name == "container":
                obj = create_container(variant, state)
            elif category_name == "debris":
                obj = create_debris(variant, state)
            elif category_name == "road":
                obj = create_road(variant, state)
            else:
                continue
            
            frame_name = f"{variant['id']}_{state}"
            output_path = os.path.join(raw_dir, f"{frame_name}.png")
            scene.render.filepath = output_path
            bpy.ops.render.render(write_still=True)
            
            frames.append({
                "id": variant["id"],
                "state": state,
                "file": f"{frame_name}.png",
                "type": category_name,
            })
            
            # Clean up object (children are auto-removed with parent)
            bpy.data.objects.remove(obj, do_unlink=True)
    
    # Create atlas and tres
    create_atlas_and_tres(raw_dir, frames, category_name)
    
    print(f"Done! Output: {OUTPUT_DIR}/{category_name}")

def create_atlas_and_tres(raw_dir, frames, category_name):
    """Pack rendered frames into atlas and create TileMap .tres."""
    
    # Calculate atlas size
    frames_per_row = 8
    rows = math.ceil(len(frames) / frames_per_row)
    atlas_width = frames_per_row * TILE_SIZE
    atlas_height = rows * TILE_SIZE
    
    # Create atlas image using Blender
    atlas_name = f"{category_name}_atlas"
    if atlas_name in bpy.data.images:
        bpy.data.images.remove(bpy.data.images[atlas_name])
    
    atlas_img = bpy.data.images.new(atlas_name, width=atlas_width, height=atlas_height, alpha=True, float_buffer=False)
    pixels = [0.0] * (atlas_width * atlas_height * 4)
    atlas_img.pixels = pixels
    
    atlas_data = {
        "category": category_name,
        "atlas_file": f"{category_name}_atlas.png",
        "tile_size": [TILE_SIZE, TILE_SIZE],
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
            y = row * TILE_SIZE
            
            copy_image_to_atlas(frame_img, atlas_img, x, y, TILE_SIZE, TILE_SIZE)
            
            atlas_data["frames"].append({
                "id": frame_info["id"],
                "state": frame_info["state"],
                "region": [x, y, TILE_SIZE, TILE_SIZE],
                "atlas_index": i
            })
            
            bpy.data.images.remove(frame_img)
    
    # Save atlas
    output_dir = os.path.join(OUTPUT_DIR, category_name)
    os.makedirs(output_dir, exist_ok=True)
    
    atlas_path = os.path.join(output_dir, f"{category_name}_atlas.png")
    atlas_img.filepath_raw = atlas_path
    atlas_img.file_format = 'PNG'
    atlas_img.save()
    
    # Save atlas JSON
    atlas_json_path = os.path.join(output_dir, f"{category_name}_atlas.json")
    with open(atlas_json_path, 'w') as f:
        json.dump(atlas_data, f, indent=2)
    
    # Create TileMap .tres (atlas texture array)
    create_tilemap_tres(atlas_data, output_dir, category_name, atlas_path)
    
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

def create_tilemap_tres(atlas_data, output_dir, category_name, atlas_path):
    """Create Godot TileMap .tres resource using AtlasTexture."""
    rel_atlas_path = atlas_path.replace("C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/", "res://").replace("\\", "/")
    
    lines = [
        f'[gd_resource type="TileSet" load_steps={len(atlas_data["frames"]) + 2} format=3 uid://{category_name}_tileset]',
        '',
        f'[sub_resource type="Texture2D" id="Texture2D_main"]',
        f'resource_path = "{rel_atlas_path}"',
        ''
    ]
    
    # Create AtlasTexture sub-resources
    for frame in atlas_data["frames"]:
        region = frame["region"]
        tile_id = f"{frame['id']}_{frame['state']}"
        lines.append(f'[sub_resource type="AtlasTexture" id="AtlasTexture_{tile_id}"]')
        lines.append(f'atlas = SubResource("Texture2D_main")')
        lines.append(f'region = Rect2({region[0]}, {region[1]}, {region[2]}, {region[3]})')
        lines.append('')
    
    # Create TileSet source and tiles
    lines.append('[sub_resource type="TileSetAtlasSource" id="AtlasSource"]')
    lines.append(f'texture = SubResource("Texture2D_main")')
    lines.append(f'margins = Vector2i(0, 0)')
    lines.append(f'separation = Vector2i(0, 0)')
    lines.append(f'tile_size = Vector2i({TILE_SIZE}, {TILE_SIZE})')
    lines.append('')
    
    lines.append('[resource]')
    lines.append('sources = [SubResource("AtlasSource")]')
    lines.append('tiles = {')
    
    tile_entries = []
    for i, frame in enumerate(atlas_data["frames"]):
        tile_id = f"{frame['id']}_{frame['state']}"
        tile_entries.append(f'{i}: {{"atlas_coords": Vector2i({i % 8}, {i // 8}), "source_id": 0, "modulate": Color(1, 1, 1, 1)}}')
    
    lines.append('  ' + ', '.join(tile_entries))
    lines.append(' }')
    
    tres_path = os.path.join(output_dir, f"{category_name}_tileset.tres")
    with open(tres_path, 'w') as f:
        f.write('\n'.join(lines))
    
    print(f"  Created: {os.path.basename(tres_path)}")

def render_all_environment():
    """Render all environment categories."""
    total_tiles = sum(len(cat["variants"]) * len(cat["states"]) for cat in ENVIRONMENT.values())
    print(f"Rendering {total_tiles} environment tiles...")
    
    for category_name, category_data in ENVIRONMENT.items():
        print(f"\n=== Rendering Category: {category_name} ===")
        render_category(category_name, category_data)
    
    print(f"\n=== All environment tiles rendered! ===")
    print(f"Output directory: {OUTPUT_DIR}")

if __name__ == "__main__":
    render_all_environment()