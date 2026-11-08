extends Node

func _ready():
    print("=== Rebuilding SpriteFrames ===")
    
    # Load the original to get the texture
    var original = load("res://assets/characters/survivor_sprite_frames.tres")
    print("Original loaded:", original)
    if not original:
        print("Failed to load original!")
        get_tree().quit()
        return
    
    # Get the main texture from sub-resources
    var main_texture = null
    for i in range(original.get_child_count()):
        var child = original.get_child(i)
        if child and child.get_class() == "Texture2D":
            main_texture = child
            break
    
    if not main_texture:
        # Try to load directly
        main_texture = load("res://assets/characters/survivor_atlas.png")
    
    print("Main texture:", main_texture)
    if not main_texture:
        print("Failed to load main texture!")
        get_tree().quit()
        return
    
    # Create new SpriteFrames
    var new_sprite_frames = SpriteFrames.new()
    
    # Define animations with directional frames
    var directions = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]
    
    # Idle: 4 frames per direction
    var idle_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 5):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            # Calculate region based on original layout
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 4 + frame_idx) * 128
            var y = 0
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        idle_frames[dir] = {"frames": frames, "speed": 4}
    
    new_sprite_frames.add_animation("idle")
    for dir in directions:
        new_sprite_frames.add_animation_direction("idle", dir)
        for frame in idle_frames[dir]["frames"]:
            new_sprite_frames.add_frame("idle", frame, dir)
        new_sprite_frames.set_animation_speed("idle", idle_frames[dir]["speed"])
    
    # Walk: 8 frames per direction
    var walk_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 9):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 8 + frame_idx) * 128
            var y = 256
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        walk_frames[dir] = {"frames": frames, "speed": 10}
    
    new_sprite_frames.add_animation("walk")
    for dir in directions:
        new_sprite_frames.add_animation_direction("walk", dir)
        for frame in walk_frames[dir]["frames"]:
            new_sprite_frames.add_frame("walk", frame, dir)
        new_sprite_frames.set_animation_speed("walk", walk_frames[dir]["speed"])
    
    # Attack ranged: 6 frames per direction
    var attack_ranged_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 7):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 6 + frame_idx) * 128
            var y = 512
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        attack_ranged_frames[dir] = {"frames": frames, "speed": 8}
    
    new_sprite_frames.add_animation("attack_ranged")
    for dir in directions:
        new_sprite_frames.add_animation_direction("attack_ranged", dir)
        for frame in attack_ranged_frames[dir]["frames"]:
            new_sprite_frames.add_frame("attack_ranged", frame, dir)
        new_sprite_frames.set_animation_speed("attack_ranged", attack_ranged_frames[dir]["speed"])
    
    # Attack melee: 6 frames per direction
    var attack_melee_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 7):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 6 + frame_idx) * 128
            var y = 768
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        attack_melee_frames[dir] = {"frames": frames, "speed": 8}
    
    new_sprite_frames.add_animation("attack_melee")
    for dir in directions:
        new_sprite_frames.add_animation_direction("attack_melee", dir)
        for frame in attack_melee_frames[dir]["frames"]:
            new_sprite_frames.add_frame("attack_melee", frame, dir)
        new_sprite_frames.set_animation_speed("attack_melee", attack_melee_frames[dir]["speed"])
    
    # Hit: 3 frames per direction
    var hit_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 4):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 3 + frame_idx) * 128
            var y = 1024
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        hit_frames[dir] = {"frames": frames, "speed": 4}
    
    new_sprite_frames.add_animation("hit")
    for dir in directions:
        new_sprite_frames.add_animation_direction("hit", dir)
        for frame in hit_frames[dir]["frames"]:
            new_sprite_frames.add_frame("hit", frame, dir)
        new_sprite_frames.set_animation_speed("hit", hit_frames[dir]["speed"])
    
    # Death: 6 frames per direction
    var death_frames = {}
    for dir in directions:
        var frames = []
        for f in range(1, 7):
            var atlas = AtlasTexture.new()
            atlas.atlas = main_texture
            var dir_idx = directions.index_of(dir)
            var frame_idx = f - 1
            var x = (dir_idx * 6 + frame_idx) * 128
            var y = 1280
            atlas.region = Rect2(x, y, 128, 256)
            frames.append(atlas)
        death_frames[dir] = {"frames": frames, "speed": 6}
    
    new_sprite_frames.add_animation("death")
    for dir in directions:
        new_sprite_frames.add_animation_direction("death", dir)
        for frame in death_frames[dir]["frames"]:
            new_sprite_frames.add_frame("death", frame, dir)
        new_sprite_frames.set_animation_speed("death", death_frames[dir]["speed"])
    
    # Save the rebuilt resource
    var save_path = "res://assets/characters/survivor_sprite_frames_rebuilt.tres"
    ResourceSaver.save(new_sprite_frames, save_path)
    print("Saved rebuilt SpriteFrames to:", save_path)
    
    # Verify
    var reloaded = load(save_path)
    print("Reloaded:", reloaded)
    print("Animations:", reloaded.get_animation_names())
    for anim in reloaded.get_animation_names():
        print("  ", anim, "directions:", reloaded.get_animation_directions(anim))
        for dir in reloaded.get_animation_directions(anim):
            print("    ", dir, "frames:", reloaded.get_frame_count(anim, dir))
    
    get_tree().quit()