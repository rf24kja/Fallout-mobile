"""
High-Quality Inspection Renders for Art Quality Review
Creates 1024x1024 renders from the existing production pistol model.
"""
import bpy
import bmesh
import math
import os
from mathutils import Vector, Euler, Matrix

OUTPUT_DIR = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\artifacts\art_review\pistol"
RENDER_RES = 1024

def clean_scene_keep_model():
    """Keep the pistol model, remove cameras/lights."""
    for obj in bpy.data.objects:
        if obj.type in {'CAMERA', 'LIGHT'}:
            bpy.data.objects.remove(obj, do_unlink=True)
    for world in bpy.data.worlds:
        if world.users == 0:
            bpy.data.worlds.remove(world)

def setup_high_quality_camera(name="HeroCam"):
    """Create high-quality orthographic camera for hero renders."""
    cam_data = bpy.data.cameras.new(name=name)
    cam_obj = bpy.data.objects.new(name=name, object_data=cam_data)
    bpy.context.collection.objects.link(cam_obj)
    
    cam_obj.location = (0, 0, 0)
    cam_data.type = 'ORTHO'
    cam_data.ortho_scale = 1.5
    
    # Target for tracking
    target = bpy.data.objects.new("Target", None)
    bpy.context.collection.objects.link(target)
    target.location = (0, 0, 0)
    
    track = cam_obj.constraints.new('TRACK_TO')
    track.target = target
    track.track_axis = 'TRACK_NEGATIVE_Z'
    track.up_axis = 'UP_Y'
    
    return cam_obj, target

def setup_studio_lighting_hq():
    """High-quality studio lighting with proper falloff."""
    # Key light - main illumination
    key_data = bpy.data.lights.new(name="KeyLight_HQ", type='AREA')
    key_data.energy = 1000
    key_data.size = 2.5
    key_data.color = (1.0, 0.98, 0.92)
    key_obj = bpy.data.objects.new(name="KeyLight_HQ", object_data=key_data)
    bpy.context.collection.objects.link(key_obj)
    key_obj.location = (5, -5, 6)
    key_obj.rotation_euler = (math.radians(-50), 0, math.radians(45))
    
    # Fill light - softer, cooler
    fill_data = bpy.data.lights.new(name="FillLight_HQ", type='AREA')
    fill_data.energy = 400
    fill_data.size = 4.0
    fill_data.color = (0.88, 0.92, 1.0)
    fill_obj = bpy.data.objects.new(name="FillLight_HQ", object_data=fill_data)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (-4, -4, 4)
    fill_obj.rotation_euler = (math.radians(-35), 0, math.radians(-35))
    
    # Rim light - edge definition
    rim_data = bpy.data.lights.new(name="RimLight_HQ", type='AREA')
    rim_data.energy = 600
    rim_data.size = 2.0
    rim_data.color = (1.0, 1.0, 1.0)
    rim_obj = bpy.data.objects.new(name="RimLight_HQ", object_data=rim_data)
    bpy.context.collection.objects.link(rim_obj)
    rim_obj.location = (0, 6, 5)
    rim_obj.rotation_euler = (math.radians(-70), 0, 0)
    
    # Bottom bounce - subtle fill
    bounce_data = bpy.data.lights.new(name="BounceLight_HQ", type='AREA')
    bounce_data.energy = 150
    bounce_data.size = 5.0
    bounce_data.color = (0.6, 0.55, 0.5)
    bounce_obj = bpy.data.objects.new(name="BounceLight_HQ", object_data=bounce_data)
    bpy.context.collection.objects.link(bounce_obj)
    bounce_obj.location = (0, 0, -3)
    bounce_obj.rotation_euler = (math.radians(90), 0, 0)

def setup_world_hq():
    """Clean dark studio world."""
    world = bpy.data.worlds.new("StudioWorld_HQ")
    world.use_nodes = True
    bg = world.node_tree.nodes.get("Background")
    if bg:
        bg.inputs[0].default_value = (0.01, 0.01, 0.015, 1.0)
        bg.inputs[1].default_value = 0.05
    bpy.context.scene.world = world

def render_view(camera, target, pistol_root, rotation_euler, output_path, res=RENDER_RES):
    """Render a single view."""
    pistol_root.rotation_euler = rotation_euler
    bpy.context.view_layer.update()
    
    bpy.context.scene.render.resolution_x = res
    bpy.context.scene.render.resolution_y = res
    bpy.context.scene.render.resolution_percentage = 100
    bpy.context.scene.render.film_transparent = True
    bpy.context.scene.render.image_settings.file_format = 'PNG'
    bpy.context.scene.render.image_settings.color_mode = 'RGBA'
    bpy.context.scene.render.image_settings.color_depth = '16'
    bpy.context.scene.render.filepath = output_path
    
    bpy.ops.render.render(write_still=True)
    print(f"Rendered: {output_path}")

def measure_sprite_bounds(image_path):
    """Measure actual non-transparent content bounds of a sprite."""
    from PIL import Image
    img = Image.open(image_path)
    if img.mode != 'RGBA':
        return None
    pixels = img.load()
    width, height = img.size
    
    min_x, min_y = width, height
    max_x, max_y = 0, 0
    found = False
    
    for y in range(height):
        for x in range(width):
            if pixels[x, y][3] > 0:  # alpha > 0
                found = True
                min_x = min(min_x, x)
                min_y = min(min_y, y)
                max_x = max(max_x, x)
                max_y = max(max_y, y)
    
    if not found:
        return None
    
    return {
        'width': max_x - min_x + 1,
        'height': max_y - min_y + 1,
        'min_x': min_x,
        'min_y': min_y,
        'max_x': max_x,
        'max_y': max_y,
        'canvas_width': width,
        'canvas_height': height,
        'fill_ratio': ((max_x - min_x + 1) * (max_y - min_y + 1)) / (width * height)
    }

def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    print("=" * 60)
    print("HIGH-QUALITY INSPECTION RENDERS")
    print(f"Output: {OUTPUT_DIR}")
    print("=" * 60)
    
    # Load existing model
    blend_path = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate\production_pistol_candidate.blend"
    bpy.ops.wm.open_mainfile(filepath=blend_path)
    
    # Find pistol root
    pistol_root = None
    for obj in bpy.data.objects:
        if obj.name == "Pistol_Root":
            pistol_root = obj
            break
    
    if not pistol_root:
        # Create from all mesh objects
        pistol_root = bpy.data.objects.new("Pistol_Root", None)
        bpy.context.collection.objects.link(pistol_root)
        for obj in bpy.data.objects:
            if obj.type == 'MESH' and obj.parent is None:
                obj.parent = pistol_root
    
    print(f"Pistol root: {pistol_root.name}")
    print(f"Child count: {len([c for c in pistol_root.children_recursive])}")
    
    # Clean up old cameras/lights, setup HQ
    clean_scene_keep_model()
    camera, target = setup_high_quality_camera()
    setup_studio_lighting_hq()
    setup_world_hq()
    
    bpy.context.scene.camera = camera
    bpy.context.scene.render.engine = 'CYCLES'
    bpy.context.scene.cycles.samples = 256
    bpy.context.scene.cycles.use_denoising = True
    bpy.context.scene.view_settings.view_transform = 'Standard'
    bpy.context.scene.view_settings.look = 'None'
    bpy.context.scene.view_settings.exposure = 0.0
    bpy.context.scene.view_settings.gamma = 1.0
    
    # Enable bevel modifiers for render
    for obj in bpy.data.objects:
        if obj.type == 'MESH':
            for mod in obj.modifiers:
                if mod.type == 'BEVEL':
                    mod.show_render = True
                    mod.show_viewport = True
    
    # 1. Hero 3/4 view (30 deg azimuth, slight elevation)
    print("\n[1/5] Hero 3/4 view...")
    render_view(camera, target, pistol_root, Euler((math.radians(10), 0, math.radians(30))), 
                os.path.join(OUTPUT_DIR, "pistol_hero_3quarter_1024.png"))
    
    # 2. Side view (90 deg)
    print("[2/5] Side view...")
    render_view(camera, target, pistol_root, Euler((math.radians(10), 0, math.radians(90))), 
                os.path.join(OUTPUT_DIR, "pistol_side_1024.png"))
    
    # 3. Top-down view (0 deg, higher elevation)
    print("[3/5] Top-down view...")
    render_view(camera, target, pistol_root, Euler((math.radians(35.264), 0, math.radians(45))), 
                os.path.join(OUTPUT_DIR, "pistol_topdown_1024.png"))
    
    # 4. Close-up detail (slide/barrel area)
    print("[4/5] Detail close-up...")
    # Move camera closer for detail
    camera.data.ortho_scale = 0.6
    render_view(camera, target, pistol_root, Euler((math.radians(15), 0, math.radians(40))), 
                os.path.join(OUTPUT_DIR, "pistol_detail_closeup_1024.png"))
    camera.data.ortho_scale = 1.5  # restore
    
    # 5. Wireframe overlay render
    print("[5/5] Wireframe overlay...")
    # Create wireframe material
    wire_mat = bpy.data.materials.new(name="WireframeOverlay")
    wire_mat.use_nodes = True
    nodes = wire_mat.node_tree.nodes
    links = wire_mat.node_tree.links
    for n in nodes:
        nodes.remove(n)
    output = nodes.new('ShaderNodeOutputMaterial')
    emission = nodes.new('ShaderNodeEmission')
    emission.inputs[0].default_value = (0.8, 0.9, 1.0, 1.0)
    emission.inputs[1].default_value = 2.0
    links.new(emission.outputs[0], output.inputs[0])
    
    # Apply as override
    bpy.context.view_layer.material_override = wire_mat
    bpy.context.scene.cycles.samples = 64
    
    render_view(camera, target, pistol_root, Euler((math.radians(10), 0, math.radians(30))), 
                os.path.join(OUTPUT_DIR, "pistol_wireframe_1024.png"))
    
    bpy.context.view_layer.material_override = None
    bpy.context.scene.cycles.samples = 256
    
    print("\n" + "=" * 60)
    print("INSPECTION RENDERS COMPLETE")
    print("=" * 60)
    
    # Now measure the existing 8-direction sprites
    print("\n=== SPRITE BOUNDS ANALYSIS ===")
    sprite_dir = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate"
    for dir_name in ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']:
        path = os.path.join(sprite_dir, f"pistol_{dir_name.lower()}.png")
        bounds = measure_sprite_bounds(path)
        if bounds:
            print(f"{dir_name}: content={bounds['width']}x{bounds['height']} "
                  f"at ({bounds['min_x']},{bounds['min_y']})-({bounds['max_x']},{bounds['max_y']}) "
                  f"fill={bounds['fill_ratio']*100:.1f}%")
        else:
            print(f"{dir_name}: NO CONTENT FOUND")

if __name__ == "__main__":
    main()