#!/usr/bin/env python3
"""Character Isometric Render Pipeline for Fallout 2 Reborn Mobile.

Renders 8-directional sprite sheets for cinematic characters:
- Idle (8 dirs × 4 frames)
- Walk (8 dirs × 8 frames)
- Attack/Ranged (8 dirs × 6 frames)
- Melee (8 dirs × 6 frames)
- Hit (8 dirs × 3 frames)
- Death (8 dirs × 6 frames)

Camera: 35.264° elevation, 45° azimuth (standard 2:1 isometric)
Orthographic scale: 8.0 (character scale)
Render resolution: 128x256 per frame (tall for characters)
"""

import bpy
import math
import mathutils
import os

# Configuration
RENDER_DIR = "C:/Code/REA_FALLOUT/Fallout2_Reborn_Mobile/renders/characters"
TILE_SIZE = 128
CHAR_HEIGHT = 256  # Characters are 2x tall
DIRECTIONS = 8
ELEVATION = math.radians(35.264)
AZIMUTH_BASE = math.radians(45)
DISTANCE = 30.0
ORTHO_SCALE = 8.0

# Animation specs: (name, frames_per_dir, start_frame, end_frame)
ANIMATIONS = [
    ("idle", 4, 1, 4),
    ("walk", 8, 1, 8),
    ("attack_ranged", 6, 1, 6),
    ("attack_melee", 6, 1, 6),
    ("hit", 3, 1, 3),
    ("death", 6, 1, 6),
]

# Direction names in order (starting from South = 0, going counter-clockwise)
DIR_NAMES = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

def clear_scene():
    """Remove all objects except camera and lights."""
    # Keep camera and lights
    for obj in bpy.data.objects:
        if obj.type not in ('CAMERA', 'LIGHT'):
            bpy.data.objects.remove(obj, do_unlink=True)
    
    # Clear orphaned data
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
    
    # Position camera for 35.264° elevation, 45° azimuth
    x = DISTANCE * math.cos(ELEVATION) * math.sin(AZIMUTH_BASE)
    y = -DISTANCE * math.cos(ELEVATION) * math.cos(AZIMUTH_BASE)
    z = DISTANCE * math.sin(ELEVATION)
    
    cam_obj.location = (x, y, z)
    
    # Point at origin
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
    
    # Render layers
    scene.view_layers["ViewLayer"].use_pass_combined = True
    scene.view_layers["ViewLayer"].use_pass_diffuse_color = True
    scene.view_layers["ViewLayer"].use_pass_normal = True
    scene.view_layers["ViewLayer"].use_pass_z = True
    
    # Light rig
    # Key light (sun)
    key_light = bpy.data.lights.new(name="KeyLight", type='SUN')
    key_light.energy = 4.0
    key_light.angle = 0.53
    key_obj = bpy.data.objects.new(name="KeyLight", object_data=key_light)
    bpy.context.collection.objects.link(key_obj)
    key_obj.rotation_euler = (math.radians(45), 0, math.radians(-45))
    
    # Fill light
    fill_light = bpy.data.lights.new(name="FillLight", type='AREA')
    fill_light.energy = 80.0
    fill_light.size = 15.0
    fill_obj = bpy.data.objects.new(name="FillLight", object_data=fill_light)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (-15, 15, 15)
    fill_obj.rotation_euler = (math.radians(-45), 0, math.radians(45))
    
    # Rim light
    rim_light = bpy.data.lights.new(name="RimLight", type='SUN')
    rim_light.energy = 1.5
    rim_obj = bpy.data.objects.new(name="RimLight", object_data=rim_light)
    bpy.context.collection.objects.link(rim_obj)
    rim_obj.rotation_euler = (math.radians(-30), 0, math.radians(135))
    
    # Ambient world lighting
    world = bpy.data.worlds["World"]
    try:
        world.use_nodes = True
        bg = world.node_tree.nodes["Background"]
        bg.inputs[0].default_value = (0.05, 0.04, 0.03, 1.0)
        bg.inputs[1].default_value = 0.3
    except (KeyError, AttributeError):
        pass  # Skip if nodes not available
    
    return cam_obj

def create_character_base(character_type="survivor"):
    """Create a base character mesh. This is a placeholder - replace with actual character model."""
    # For now, create a simple humanoid proxy using primitives
    # In production, import your actual character .blend file here
    
    # Body parts
    parts = {}
    
    # Torso
    bpy.ops.mesh.primitive_cylinder_add(radius=0.35, depth=1.2, location=(0, 0, 1.0))
    torso = bpy.context.active_object
    torso.name = "Torso"
    parts["torso"] = torso
    
    # Head
    bpy.ops.mesh.primitive_uv_sphere_add(radius=0.22, location=(0, 0, 1.85))
    head = bpy.context.active_object
    head.name = "Head"
    parts["head"] = head
    
    # Arms
    for side, x_offset in [("L", -0.45), ("R", 0.45)]:
        bpy.ops.mesh.primitive_cylinder_add(radius=0.12, depth=0.85, location=(x_offset, 0, 1.3))
        arm = bpy.context.active_object
        arm.name = f"Arm_{side}"
        arm.rotation_euler = (math.radians(90), 0, 0)
        parts[f"arm_{side.lower()}"] = arm
    
    # Legs
    for side, x_offset in [("L", -0.2), ("R", 0.2)]:
        bpy.ops.mesh.primitive_cylinder_add(radius=0.15, depth=1.0, location=(x_offset, 0, 0.5))
        leg = bpy.context.active_object
        leg.name = f"Leg_{side}"
        parts[f"leg_{side.lower()}"] = leg
    
    # Apply materials based on character type
    apply_character_materials(parts, character_type)
    
    # Join into single object for easier animation
    bpy.ops.object.select_all(action='DESELECT')
    for part in parts.values():
        part.select_set(True)
    bpy.context.view_layer.objects.active = parts["torso"]
    bpy.ops.object.join()
    
    character = bpy.context.active_object
    character.name = f"Character_{character_type}"
    character.location = (0, 0, 0)
    
    return character

def apply_character_materials(parts, character_type):
    """Apply materials based on character archetype."""
    colors = {
        "survivor": {
            "skin": (0.75, 0.65, 0.55, 1.0),
            "clothing": (0.25, 0.22, 0.18, 1.0),
            "leather": (0.18, 0.14, 0.10, 1.0),
            "metal": (0.35, 0.33, 0.30, 1.0),
        },
        "npc_friendly": {
            "skin": (0.72, 0.62, 0.52, 1.0),
            "clothing": (0.20, 0.28, 0.20, 1.0),
            "leather": (0.22, 0.18, 0.14, 1.0),
            "metal": (0.40, 0.38, 0.35, 1.0),
        },
        "hostile": {
            "skin": (0.65, 0.55, 0.50, 1.0),
            "clothing": (0.15, 0.12, 0.10, 1.0),
            "leather": (0.12, 0.08, 0.06, 1.0),
            "metal": (0.25, 0.22, 0.20, 1.0),
        }
    }
    
    palette = colors.get(character_type, colors["survivor"])
    
    # Skin material
    skin_mat = bpy.data.materials.new(name="Skin")
    skin_mat.use_nodes = True
    nodes = skin_mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = palette["skin"]
    bsdf.inputs['Roughness'].default_value = 0.7
    # Subsurface scattering (name varies by Blender version)
    try:
        bsdf.inputs['Subsurface'].default_value = 0.15
        bsdf.inputs['Subsurface Radius'].default_value = (1.2, 0.5, 0.3)
    except KeyError:
        pass  # Skip if not available in this Blender version
    skin_mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    # Clothing material
    cloth_mat = bpy.data.materials.new(name="Clothing")
    cloth_mat.use_nodes = True
    nodes = cloth_mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = palette["clothing"]
    bsdf.inputs['Roughness'].default_value = 0.9
    cloth_mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    # Leather material
    leather_mat = bpy.data.materials.new(name="Leather")
    leather_mat.use_nodes = True
    nodes = leather_mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = palette["leather"]
    bsdf.inputs['Roughness'].default_value = 0.6
    try:
        bsdf.inputs['Specular'].default_value = 0.3
    except KeyError:
        pass
    leather_mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    # Metal material
    metal_mat = bpy.data.materials.new(name="Metal")
    metal_mat.use_nodes = True
    nodes = metal_mat.node_tree.nodes
    nodes.clear()
    out = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = palette["metal"]
    bsdf.inputs['Roughness'].default_value = 0.4
    bsdf.inputs['Metallic'].default_value = 0.8
    metal_mat.node_tree.links.new(bsdf.outputs['BSDF'], out.inputs['Surface'])
    
    # Assign materials (simplified - in production use vertex groups)
    for part_name, obj in parts.items():
        if "head" in part_name:
            obj.data.materials.append(skin_mat)
        elif "arm" in part_name or "leg" in part_name:
            obj.data.materials.append(cloth_mat)
        else:
            obj.data.materials.append(cloth_mat)

def setup_character_armature(character):
    """Add a basic armature for posing. In production, use a proper rig."""
    # For this prototype, we'll use simple object rotation for directions
    # A real pipeline would use a full armature with IK
    pass

def render_character_sheet(character_type="survivor"):
    """Render full 8-direction sprite sheet for a character type."""
    clear_scene()
    cam = setup_camera_and_lights()
    character = create_character_base(character_type)
    
    # Create output directory
    out_dir = os.path.join(RENDER_DIR, character_type)
    os.makedirs(out_dir, exist_ok=True)
    
    scene = bpy.context.scene
    
    print(f"\n=== Rendering {character_type} ===")
    
    for anim_name, frames, start_f, end_f in ANIMATIONS:
        print(f"  Animation: {anim_name} ({frames} frames × {DIRECTIONS} dirs)")
        
        for dir_idx in range(DIRECTIONS):
            dir_name = DIR_NAMES[dir_idx]
            
            # Rotate character to face direction
            # In isometric, character faces camera-relative directions
            # South (0) = facing camera, North (4) = away from camera
            angle = dir_idx * (2 * math.pi / DIRECTIONS)
            character.rotation_euler = (0, 0, angle)
            
            for frame in range(start_f, end_f + 1):
                scene.frame_set(frame)
                
                # Apply animation pose (simplified)
                apply_animation_pose(character, anim_name, frame, frames)
                
                # Render
                output_path = os.path.join(out_dir, f"{anim_name}_{dir_name}_{frame:02d}.png")
                scene.render.filepath = output_path
                bpy.ops.render.render(write_still=True)
                
                print(f"    {anim_name}_{dir_name}_{frame:02d}.png")
    
    print(f"Done! Output: {out_dir}")

def apply_animation_pose(character, anim_name, frame, total_frames):
    """Apply simple procedural animation poses. Replace with actual armature animation."""
    # This is a placeholder - in production, use actual armature animations
    # For now, just add subtle variations per frame
    progress = frame / total_frames
    
    if anim_name == "walk":
        # Subtle body bob
        character.location.z = math.sin(progress * 2 * math.pi) * 0.02
    elif anim_name in ("attack_ranged", "attack_melee"):
        # Lean forward during attack
        lean = math.sin(progress * math.pi) * 0.1
        character.rotation_euler.x = lean
    elif anim_name == "hit":
        # Flinch back
        flinch = math.sin(progress * math.pi) * 0.05
        character.location.y = flinch
    elif anim_name == "death":
        # Collapse
        collapse = progress * 1.5
        character.location.z = -collapse
        character.rotation_euler.x = collapse * 0.5

def render_all_characters():
    """Render all three character types."""
    for char_type in ["survivor", "npc_friendly", "hostile"]:
        render_character_sheet(char_type)
    
    print("\n=== All characters rendered! ===")
    print(f"Output directory: {RENDER_DIR}")

if __name__ == "__main__":
    render_all_characters()