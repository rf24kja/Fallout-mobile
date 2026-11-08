#!/usr/bin/env python3
"""Test SpriteFrames loading on Windows headless using GDScript directly"""

import subprocess
import tempfile
import os

# Create a minimal test script
test_script = '''
# Quick test script for headless execution
extends Node

func _ready():
    print("=== Testing SpriteFrames loading ===")
    var path = "res://assets/characters/survivor_sprite_frames.tres"
    var sprite_frames = load(path)
    print("Load result:", sprite_frames)
    if sprite_frames:
        print("Class:", sprite_frames.get_class())
        var anims = sprite_frames.get_animation_names()
        print("Animation count:", anims.size())
        print("Animations:", anims)
        for anim in anims:
            var dirs = sprite_frames.get_animation_directions(anim)
            print("  ", anim, "directions:", dirs)
            for dir in dirs:
                var count = sprite_frames.get_frame_count(anim, dir)
                print("    ", dir, "frames:", count)
                if count > 0:
                    var tex = sprite_frames.get_frame_texture(anim, 0, dir)
                    print("      first frame texture:", tex)
    print("=== Test complete ===")
    get_tree().quit()
'''

# Write the script to a temp file
with tempfile.NamedTemporaryFile(mode='w', suffix='.gd', delete=False, dir=r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\scripts') as f:
    f.write(test_script)
    script_path = f.name

try:
    result = subprocess.run([
        r'C:\tools\Godot\4.7.2\godot\Godot_v4.7.2-stable_win64_console.exe',
        '--path', r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile',
        '--headless', '-s', script_path
    ], capture_output=True, text=True, timeout=60)
    
    print("STDOUT:")
    print(result.stdout)
    print("STDERR:")
    print(result.stderr)
    print("Return code:", result.returncode)
finally:
    os.unlink(script_path)