extends Node2D
## Standalone ART REVIEW ONLY: original gameplay, combat, inventory and save logic are untouched.
## The firing effects are separate AnimatedSprite2D layers; no body or gun pixels in flash atlas.

const DIRECTIONS = ["S", "SE", "E", "NE", "N", "NW", "W", "SW"]
const GUNS = ["pistol", "rifle"]
const PISTOL_READY: Texture2D = preload("res://art/production/character_survivor_pose_v1/atlas_ready.png")
const RIFLE_READY: Texture2D = preload("res://art/production/character_survivor_rifle_pose_v1/atlas_rifle_ready.png")
const PISTOL_FLASH: SpriteFrames = preload("res://art/production/muzzle_fx_v1/muzzle_pistol_sprite_frames.tres")
const RIFLE_FLASH: SpriteFrames = preload("res://art/production/muzzle_fx_v1/muzzle_rifle_sprite_frames.tres")

const MUZZLE_POINTS = {
    "pistol": [Vector2(132,54), Vector2(176,59), Vector2(207,47), Vector2(197,28), Vector2(159,19), Vector2(74,22), Vector2(34,45), Vector2(49,76)],
    "rifle":  [Vector2(155,55), Vector2(192,55), Vector2(229,52), Vector2(224,53), Vector2(72,44), Vector2(45,43), Vector2(36,54), Vector2(47,72)]
}
var _gun_index: int = 0
var _direction_index: int = 0

@onready var character_sprite: Sprite2D = $Character/ReadySprite
@onready var effect_sprite: AnimatedSprite2D = $Character/MuzzleFlash
@onready var weapon_button: Button = $HUD/Controls/WeaponButton
@onready var facing_button: Button = $HUD/Controls/FacingButton
@onready var fire_button: Button = $HUD/Controls/FireButton
@onready var info: Label = $HUD/Controls/Info

func _ready() -> void:
    weapon_button.pressed.connect(_next_weapon)
    facing_button.pressed.connect(_next_direction)
    fire_button.pressed.connect(_fire)
    effect_sprite.animation_finished.connect(_on_animation_finished)
    _refresh()

func _next_weapon() -> void:
    _gun_index = (_gun_index + 1) % GUNS.size()
    _refresh()

func _next_direction() -> void:
    _direction_index = (_direction_index + 1) % DIRECTIONS.size()
    _refresh()

func _fire() -> void:
    var direction: String = DIRECTIONS[_direction_index]
    effect_sprite.visible = true
    effect_sprite.play("flash_" + direction)
    effect_sprite.frame = 0

func _on_animation_finished() -> void:
    effect_sprite.visible = false

func _refresh() -> void:
    effect_sprite.stop()
    effect_sprite.visible = false
    var gun: String = GUNS[_gun_index]
    var direction: String = DIRECTIONS[_direction_index]
    var source: Texture2D = PISTOL_READY if gun == "pistol" else RIFLE_READY
    var atlas: AtlasTexture = AtlasTexture.new()
    atlas.atlas = source
    atlas.region = Rect2((_direction_index % 4) * 256, int(_direction_index / 4) * 256, 256, 256)
    character_sprite.texture = atlas
    # Source 256px canvas has (128,248) at the foot. Sprite2D is centered.
    character_sprite.offset = Vector2(0,-120)
    effect_sprite.sprite_frames = PISTOL_FLASH if gun == "pistol" else RIFLE_FLASH
    effect_sprite.position = MUZZLE_POINTS[gun][_direction_index] - Vector2(128,248)
    weapon_button.text = "Weapon: " + gun.capitalize()
    facing_button.text = "Direction: " + direction
    info.text = "RADZONE | independent VFX layer | " + gun + " | " + direction + " | 3-frame flash"

func _unhandled_key_input(event: InputEvent) -> void:
    if not (event is InputEventKey):
        return
    var key_event: InputEventKey = event as InputEventKey
    if not key_event.pressed or key_event.echo:
        return
    match key_event.keycode:
        KEY_LEFT:
            _direction_index = (_direction_index - 1 + DIRECTIONS.size()) % DIRECTIONS.size()
            _refresh()
        KEY_RIGHT:
            _next_direction()
        KEY_TAB:
            _next_weapon()
        KEY_SPACE:
            _fire()