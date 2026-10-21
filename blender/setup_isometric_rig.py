#!/usr/bin/env python3
"""Blender Isometric Camera Rig Generator.

Creates a standard isometric camera setup for Fallout 2 Reborn Mobile.
Camera: 35.264° elevation, 45° azimuth (standard 2:1 isometric)
Orthographic scale: 10.0
Render resolution: 128x128 per tile (atlas will be 2048x2048 = 16x16 tiles)
"""

import bpy
import math

def clear_scene():
    """Remove all objects from scene."""
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete()

def create_isometric_rig():
    """Create the standard isometric camera rig."""
    
    # Create camera
    cam_data = bpy.data.cameras.new(name="IsometricCamera")
    cam_data.type = 'ORTHO'
    cam_data.ortho_scale = 10.0
    
    cam_obj = bpy.data.objects.new(name="IsometricCamera", object_data=cam_data)
    bpy.context.collection.objects.link(cam_obj)
    
    # Position camera for 35.264° elevation, 45° azimuth
    # Distance from origin (orthographic doesn't matter, but for consistency)
    dist = 50.0
    elev = math.radians(35.264)  # ~35.264° = arctan(1/sqrt(2))
    azim = math.radians(45.0)
    
    x = dist * math.cos(elev) * math.sin(azim)
    y = -dist * math.cos(elev) * math.cos(azim)
    z = dist * math.sin(elev)
    
    cam_obj.location = (x, y, z)
    
    # Point at origin
    direction = (0, 0, 0) - cam_obj.location
    rot_quat = direction.to_track_quat('-Z', 'Y')
    cam_obj.rotation_euler = rot_quat.to_euler()
    
    # Set as active camera
    bpy.context.scene.camera = cam_obj
    
    # Render settings
    scene = bpy.context.scene
    scene.render.resolution_x = 128
    scene.render.resolution_y = 128
    scene.render.resolution_percentage = 100
    scene.render.film_transparent = True
    scene.render.image_settings.color_mode = 'RGBA'
    scene.render.image_settings.file_format = 'PNG'
    scene.render.engine = 'CYCLES'  # or 'BLENDER_EEVEE_NEXT'
    
    # Cycles settings for clean renders
    if scene.render.engine == 'CYCLES':
        scene.cycles.samples = 64
        scene.cycles.use_denoising = True
        scene.cycles.preview_samples = 32
    
    # Create render layers / passes
    # Standard passes: Combined, DiffCol, GlossCol, Normal, Depth, Shadow
    scene.view_layers["ViewLayer"].use_pass_combined = True
    scene.view_layers["ViewLayer"].use_pass_diffuse_color = True
    scene.view_layers["ViewLayer"].use_pass_glossy_color = True
    scene.view_layers["ViewLayer"].use_pass_normal = True
    scene.view_layers["ViewLayer"].use_pass_z = True
    scene.view_layers["ViewLayer"].use_pass_shadow = True
    scene.view_layers["ViewLayer"].use_pass_emit = True
    
    # Create light rig (standard 3-point)
    # Key light (sun)
    key_light = bpy.data.lights.new(name="KeyLight", type='SUN')
    key_light.energy = 3.0
    key_light.angle = 0.5
    key_obj = bpy.data.objects.new(name="KeyLight", object_data=key_light)
    bpy.context.collection.objects.link(key_obj)
    key_obj.rotation_euler = (math.radians(45), 0, math.radians(-45))
    
    # Fill light
    fill_light = bpy.data.lights.new(name="FillLight", type='AREA')
    fill_light.energy = 50.0
    fill_light.size = 10.0
    fill_obj = bpy.data.objects.new(name="FillLight", object_data=fill_light)
    bpy.context.collection.objects.link(fill_obj)
    fill_obj.location = (-10, 10, 10)
    fill_obj.rotation_euler = (math.radians(-45), 0, math.radians(45))
    
    # Rim light
    rim_light = bpy.data.lights.new(name="RimLight", type='SUN')
    rim_light.energy = 1.0
    rim_obj = bpy.data.objects.new(name="RimLight", object_data=rim_light)
    bpy.context.collection.objects.link(rim_obj)
    rim_obj.rotation_euler = (math.radians(-30), 0, math.radians(135))
    
    # Ground plane reference (shadow catcher)
    bpy.ops.mesh.primitive_plane_add(size=20, location=(0, 0, 0))
    ground = bpy.context.active_object
    ground.name = "GroundPlane"
    ground.is_shadow_catcher = True
    
    mat = bpy.data.materials.new(name="GroundMat")
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    nodes.clear()
    output = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = (0.2, 0.2, 0.2, 1.0)
    bsdf.inputs['Roughness'].default_value = 1.0
    mat.node_tree.links.new(bsdf.outputs['BSDF'], output.inputs['Surface'])
    ground.data.materials.append(mat)
    
    print(f"Created isometric camera at {cam_obj.location}")
    print(f"Rotation: {cam_obj.rotation_euler}")
    print(f"Ortho scale: {cam_data.ortho_scale}")
    print("Render layers: Combined, DiffCol, GlossCol, Normal, Depth, Shadow, Emit")
    
    return cam_obj

def create_tile_template():
    """Create a simple tile template for testing."""
    # Floor tile
    bpy.ops.mesh.primitive_plane_add(size=1.0, location=(0, 0, 0))
    tile = bpy.context.active_object
    tile.name = "TileTemplate_Floor"
    
    mat = bpy.data.materials.new(name="TileMat")
    mat.use_nodes = True
    nodes = mat.node_tree.nodes
    nodes.clear()
    output = nodes.new('ShaderNodeOutputMaterial')
    bsdf = nodes.new('ShaderNodeBsdfPrincipled')
    bsdf.inputs['Base Color'].default_value = (0.4, 0.35, 0.3, 1.0)
    bsdf.inputs['Roughness'].default_value = 0.9
    mat.node_tree.links.new(bsdf.outputs['BSDF'], output.inputs['Surface'])
    tile.data.materials.append(mat)
    
    return tile

if __name__ == "__main__":
    clear_scene()
    create_isometric_rig()
    create_tile_template()
    # Save
    bpy.ops.wm.save_as_mainfile(filepath="isometric_rig.blend")
    print("Saved to isometric_rig.blend")