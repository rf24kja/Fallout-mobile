extends Node

func _ready():
    print("=== SpriteFrames Diagnostic Test ===")
    
    # Test 1: Load the survivor SpriteFrames resource
    var path = "res://assets/characters/survivor_sprite_frames.tres"
    print("Loading: ", path)
    
    var sprite_frames = load(path)
    print("Loaded resource: ", sprite_frames)
    print("Resource class: ", sprite_frames.get_class() if sprite_frames else "null")
    
    if sprite_frames:
        # Test 2: Get animation names
        var anim_names = sprite_frames.get_animation_names()
        print("Animation names: ", anim_names)
        print("Animation count: ", anim_names.size())
        
        # Test 3: Check each animation
        for anim in anim_names:
            var frame_count = sprite_frames.get_frame_count(anim)
            print("Animation '", anim, "': ", frame_count, " frames")
            if frame_count > 0:
                var tex = sprite_frames.get_frame_texture(anim, 0)
                print("  Frame 0 texture: ", tex, " - valid: ", tex != null)
        
        # Test 4: Check children (AtlasTexture sub-resources)
        print("\n--- Sub-resources check ---")
        for i in range(sprite_frames.get_child_count()):
            var child = sprite_frames.get_child(i)
            print("Child ", i, ": ", child)

        # Test 5: Create AnimatedSprite2D and assign
        print("\n--- AnimatedSprite2D test ---")
        var anim_sprite = AnimatedSprite2D.new()
        anim_sprite.sprite_frames = sprite_frames
        print("AnimatedSprite2D sprite_frames: ", anim_sprite.sprite_frames)
        print("AnimatedSprite2D animation list: ", anim_sprite.sprite_frames.get_animation_names() if anim_sprite.sprite_frames else "null")
        
        if anim_sprite.sprite_frames and anim_sprite.sprite_frames.get_animation_names().size() > 0:
            var first_anim = anim_sprite.sprite_frames.get_animation_names()[0]
            print("Playing: ", first_anim)
            anim_sprite.play(first_anim)
            print("Current animation: ", anim_sprite.animation)
            print("Current frame: ", anim_sprite.frame)
            print("Frame texture: ", anim_sprite.get_frame_texture())
    
    get_tree().quit()