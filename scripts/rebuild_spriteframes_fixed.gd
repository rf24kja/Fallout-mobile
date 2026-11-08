extends Node

func _ready():
    print("=== Rebuilding SpriteFrames for Godot 4.x ===")
    
    var main_texture = load("res://assets/characters/survivor_atlas.png")
    print("Main texture loaded:", main_texture)
    if not main_texture:
        print("ERROR: Failed to load main texture!")
        get_tree().quit()
        return
    
    var sf = SpriteFrames.new()
    
    var directions = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]
    
    # Idle: 4 frames, row 0
    _add_dir_anim(sf, main_texture, directions, "idle", 4, 0, 4.0)
    
    # Walk: 8 frames, row 1
    _add_dir_anim(sf, main_texture, directions, "walk", 8, 1, 10.0)
    
    # Attack ranged: 6 frames, row 2
    _add_dir_anim(sf, main_texture, directions, "attack_ranged", 6, 2, 8.0)
    
    # Attack melee: 6 frames, row 3
    _add_dir_anim(sf, main_texture, directions, "attack_melee", 6, 3, 8.0)
    
    # Hit: 3 frames, row 4
    _add_dir_anim(sf, main_texture, directions, "hit", 3, 4, 4.0)
    
    # Death: 6 frames, row 5
    _add_dir_anim(sf, main_texture, directions, "death", 6, 5, 6.0)
    
    # Save
    var save_path = "res://assets/characters/survivor_sprite_frames_fixed.tres"
    ResourceSaver.save(sf, save_path)
    print("Saved to:", save_path)
    
    # Verify
    var reloaded = load(save_path)
    print("Reloaded:", reloaded)
    print("Animations:", reloaded.get_animation_names())
    for anim in reloaded.get_animation_names():
        print("  ", anim, "frame count:", reloaded.get_frame_count(anim))
        for i in range(reloaded.get_frame_count(anim)):
            var tex = reloaded.get_frame_texture(anim, i)
            print("    frame", i, ":", tex)
    
    get_tree().quit()

func _add_dir_anim(sf: SpriteFrames, texture: Texture2D, directions: Array, anim_name: String, frame_count: int, row: int, speed: float):
    for i in range(directions.size()):
        var dir = directions[i]
        var anim_full_name = anim_name + "_" + dir
        sf.add_animation(anim_full_name)
        for frame in range(frame_count):
            var atlas = AtlasTexture.new()
            atlas.atlas = texture
            var x = (i * frame_count + frame) * 128
            var y = row * 256
            atlas.region = Rect2(x, y, 128, 256)
            sf.add_frame(anim_full_name, atlas)
        sf.set_animation_speed(anim_full_name, speed)