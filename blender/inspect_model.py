import bpy

bpy.ops.wm.open_mainfile(filepath=r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\weapons\production_pistol_candidate\production_pistol_candidate.blend')

print('=== OBJECT ANALYSIS ===')
for obj in bpy.data.objects:
    if obj.type == 'MESH':
        print(f'{obj.name}: verts={len(obj.data.vertices)}, faces={len(obj.data.polygons)}, materials={len(obj.data.materials)}')
        for i, mat in enumerate(obj.data.materials):
            if mat:
                print(f'  Material {i}: {mat.name}')

print('\n=== FRAME OBJECT ===')
frame = bpy.data.objects.get('Frame')
if frame:
    print(f'Frame: {frame.name}, verts={len(frame.data.vertices)}, faces={len(frame.data.polygons)}')
    for mod in frame.modifiers:
        print(f'  Modifier: {mod.type} - {mod.name}')

print('\n=== TOTAL TRIANGLE COUNT ===')
total_tris = 0
for obj in bpy.data.objects:
    if obj.type == 'MESH':
        total_tris += len(obj.data.polygons)
print(f'Total triangles (before modifiers): {total_tris}')

print('\n=== MATERIAL DETAILS ===')
for mat in bpy.data.materials:
    if mat.use_nodes:
        print(f'\nMaterial: {mat.name}')
        for node in mat.node_tree.nodes:
            if node.type == 'BSDF_PRINCIPLED':
                print(f'  Base Color: {node.inputs["Base Color"].default_value}')
                print(f'  Metallic: {node.inputs["Metallic"].default_value}')
                print(f'  Roughness: {node.inputs["Roughness"].default_value}')

print('\n=== CAMERA AND LIGHTING ===')
for obj in bpy.data.objects:
    if obj.type == 'CAMERA':
        print(f'Camera: {obj.name}')
        print(f'  Location: {obj.location}')
        print(f'  Rotation: {obj.rotation_euler}')
        print(f'  Type: {obj.data.type}')
        if obj.data.type == 'ORTHO':
            print(f'  Ortho Scale: {obj.data.ortho_scale}')

for obj in bpy.data.objects:
    if obj.type == 'LIGHT':
        print(f'Light: {obj.name}')
        print(f'  Type: {obj.data.type}')
        print(f'  Energy: {obj.data.energy}')
        print(f'  Color: {obj.data.color}')
        print(f'  Location: {obj.location}')
        print(f'  Rotation: {obj.rotation_euler}')

print('\n=== WORLD ===')
if bpy.context.scene.world:
    print(f'World: {bpy.context.scene.world.name}')
    if bpy.context.scene.world.use_nodes:
        for node in bpy.context.scene.world.node_tree.nodes:
            if node.type == 'BACKGROUND':
                print(f'  Background Color: {node.inputs[0].default_value}')
                print(f'  Strength: {node.inputs[1].default_value}')