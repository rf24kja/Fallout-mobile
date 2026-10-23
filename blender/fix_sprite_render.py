"""
Fix sprite rendering - proper framing to fill the canvas.
The current sprites only fill 0.1-0.2% of 256x256 canvas.
Need to adjust camera ortho_scale to frame weapon properly.
"""
import bpy
import math
import os

OUTPUT_DIR = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate"
RENDER_RES = 256

def clean_scene_keep_model():
    for obj in bpy.data.objects:
        if obj.type in {'CAMERA', 'LIGHT'}:
            bpy.data.objects.remove(obj, do_unlink=True)

def setup_isometric_camera():
    """Isometric camera for 8-direction sprites."""
    cam_data = bpy.data.cameras.new(name="IsoCam_Sprites")
    cam_obj = bpy.data.objects.new(name="IsoCam_Sprites", object_data=cam_data)
    bpy.context.collection.objects.link(cam_obj)
    
    cam_obj.location = (0, 0, 0)
    cam_data.type = 'ORTHO'
    cam_data.ortho_scale = 0.35  # ADJUSTED: much tighter framing
    
    target = bpy.data.objects.new("Target", None)
    bpy.context.collection.objects.link(target)
    target.location = (0, 0, 0)
    
    track = cam_obj.constraints.new('TRACK_TO')
    track.target = target
    track.track_axis = 'TRACK_NEGATIVE_Z'
    track.up_axis = 'UP_Y'
    
    return cam_obj, target

def setup_sprite_lighting():
    """Consistent lighting for sprites."""
    # Key
    key_data = bpy.data.lights.new(name="KeyLight", type='SUN')
    key_data.energy = 5.0
    key_data.color = (1.0, 0.98, 0.92)
    key_obj = bpy.data.objects.new(name="KeyLight", object_data=key_data)
    bpy.context.collection.objects.link(key_obj)
    key_obj.rotation_euler = (math.radians(-45), 0, math.radians(45))
    
    # Fill
    fill_data = bpy.data.lights.new(name="FillLight", type='SUN')
    fill_data.energy = 2.0
    fill_data.color = (0.88, 0.92, 1.0)
    fill_obj = bpy.data.objects.new(name="FillLight", object_data=fill_data)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.rotation_euler = (math.radians(-30), 0, math.radians(-45))
    
    # Rim
    rim_data = bpy.data.lights.new(name="RimLight", type='SUN')
    rim_data.energy = 1.5
    rim_data.color = (1.0, 1.0, 1.0)
    rim_obj = bpy.data.objects.new(name="RimLight", object_data=rim_data)
    bpy.context.collection.objects.link(rim_obj)
    rim_obj.rotation_euler = (math.radians(-60), 0, math.radians(180))

def setup_world():
    world = bpy.data.worlds.new("SpriteWorld")
    world.use_nodes = True
    bg = world.node_tree.nodes.get("Background")
    if bg:
        bg.inputs[0].default_value = (0.0, 0.0, 0.0, 1.0)
        bg.inputs[1].default_value = 0.0
    bpy.context.scene.world = world

def render_direction(camera, target, pistol_root, direction, azimuth, output_path):
    """Render single direction."""
    # Rotate pistol
    pistol_root.rotation_euler = (math.radians(10), 0, math.radians(azimuth))
    bpy.context.view_layer.update()
    
    bpy.context.scene.render.resolution_x = RENDER_RES
    bpy.context.scene.render.resolution_y = RENDER_RES
    bpy.context.scene.render.resolution_percentage = 100
    bpy.context.scene.render.film_transparent = True
    bpy.context.scene.render.image_settings.file_format = 'PNG'
    bpy.context.scene.render.image_settings.color_mode = 'RGBA'
    bpy.context.scene.render.image_settings.color_depth = '16'
    bpy.context.scene.render.filepath = output_path
    bpy.context.scene.camera = camera
    bpy.context.scene.render.engine = 'CYCLES'
    bpy.context.scene.cycles.samples = 128
    bpy.context.scene.cycles.use_denoising = True
    bpy.context.scene.view_settings.view_transform = 'Standard'
    
    # Enable bevel modifiers
    for obj in bpy.data.objects:
        if obj.type == 'MESH':
            for mod in obj.modifiers:
                if mod.type == 'BEVEL':
                    mod.show_render = True
                    mod.show_viewport = True
    
    bpy.ops.render.render(write_still=True)
    print(f"  {direction}: {output_path}")

def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    
    print("=" * 60)
    print("FIXED SPRITE RENDERING - PROPER FRAMING")
    print("=" * 60)
    
    blend_path = r"C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate\production_pistol_candidate.blend"
    bpy.ops.wm.open_mainfile(filepath=blend_path)
    
    pistol_root = None
    for obj in bpy.data.objects:
        if obj.name == "Pistol_Root":
            pistol_root = obj
            break
    
    if not pistol_root:
        pistol_root = bpy.data.objects.new("Pistol_Root", None)
        bpy.context.collection.objects.link(pistol_root)
        for obj in bpy.data.objects:
            if obj.type == 'MESH' and obj.parent is None:
                obj.parent = pistol_root
    
    clean_scene_keep_model()
    camera, target = setup_isometric_camera()
    setup_sprite_lighting()
    setup_world()
    
    # 8 directions: N=0, NE=45, E=90, SE=135, S=180, SW=225, W=270, NW=315
    directions = [
        ('N', 0), ('NE', 45), ('E', 90), ('SE', 135),
        ('S', 180), ('SW', 225), ('W', 270), ('NW', 315)
    ]
    
    for direction, azimuth in directions:
        output_path = os.path.join(OUTPUT_DIR, f"pistol_{direction.lower()}_fixed.png")
        render_direction(camera, target, pistol_root, direction, azimuth, output_path)
    
    print("\nFixed sprite renders complete!")
    print("Check fill ratios with analyze script.")

if __name__ == "__main__":
    main()