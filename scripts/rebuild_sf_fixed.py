#!/usr/bin/env python3
"""Rebuild SpriteFrames in Godot 4.x compatible format"""

import subprocess
import tempfile
import os

# Create a proper GDScript that rebuilds SpriteFrames using Godot 4.x API
rebuild_script = '''
extends Node

func _ready():
    print("=== Rebuilding SpriteFrames for Godot 4.x ===")
    
    # Load the main texture directly
    var main_texture = load("res://assets/characters/survivor_atlas.png")
    print("Main texture loaded:", main_texture)
    if not main_texture:
        print("ERROR: Failed to load main texture!")
        get_tree().quit()
        return
    
    # Create new SpriteFrames - Godot 4.x way
    var sf = SpriteFrames.new()
    
    var directions = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]
    
    # Helper to add directional animation
    func add_dir_anim(anim_name: String, frame_count: int, row: int, speed: float):
        sf.add_animation(anim_name)
        for dir in directions:
            sf.add_animation_direction(anim_name, dir)
            var dir_idx = directions.index_of(dir)
            for frame in range(frame_count):
                var atlas = AtlasTexture.new()
                atlas.atlas = main_texture
                var x = (dir_idx * frame_count + frame) * 128
                var y = row * 256
                atlas.region = Rect2(x, y, 128, 256)
                sf.add_frame(anim_name, atlas, dir)
            sf.set_animation_speed(anim_name, speed)
    
    # Idle: 4 frames, row 0
    add_dir_anim("idle", 4, 0, 4.0)
    
    # Walk: 8 frames, row 1
    add_dir_anim("walk", 8, 1, 10.0)
    
    # Attack ranged: 6 frames, row 2
    add_dir_anim("attack_ranged", 6, 2, 8.0)
    
    # Attack melee: 6 frames, row 3
    add_dir_anim("attack_melee", 6, 3, 8.0)
    
    # Hit: 3 frames, row 4
    add_dir_anim("hit", 3, 4, 4.0)
    
    # Death: 6 frames, row 5
    add_dir_anim("death", 6, 5, 6.0)
    
    # Save
    var save_path = "res://assets/characters/survivor_sprite_frames_fixed.tres"
    ResourceSaver.save(sf, save_path)
    print("Saved to:", save_path)
    
    # Verify
    var reloaded = load(save_path)
    print("Reloaded:", reloaded)
    print("Animations:", reloaded.get_animation_names())
    for anim in reloaded.get_animation_names():
        var dirs = reloaded.get_animation_directions(anim)
        print("  ", anim, "directions:", dirs)
        for dir in dirs:
            var count = reloaded.get_frame_count(anim, dir)
            print("    ", dir, "frames:", count)
    
    get_tree().quit()
'''

# Write to temp file and run
with tempfile.NamedTemporaryFile(mode='w', suffix='.gd', delete=False, dir=r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\scripts') as f:
    f.write(rebuild_script)
    script_path = f.name

try:
    result = subprocess.run([
        r'C:\tools\Godot\4.7.2\godot\Godot_v4.7.2-stable_win64_console.exe',
        '--path', r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile',
        '--headless', '-s', script_path
    ], capture_output=True, text=True, timeout=120)
    
    print("STDOUT:")
    print(result.stdout)
    print("STDERR:")
    print(result.stderr)
    print("Return code:", result.returncode)
finally:
    os.unlink(script_path)