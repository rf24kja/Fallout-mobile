
print("=== SpriteFrames Test ===")
var sprite_frames = load("res://assets/characters/survivor_sprite_frames.tres")
print("Loaded:", sprite_frames)
if sprite_frames:
    print("Class:", sprite_frames.get_class())
    print("Animations:", sprite_frames.get_animation_names())
    for anim in sprite_frames.get_animation_names():
        print("  ", anim, "frames:", sprite_frames.get_frame_count(anim))
quit()
