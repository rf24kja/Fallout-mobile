extends Node2D
class_name CharacterVisual

## Paperdoll system for character equipment visualization.
# Handles layering of base character, armor tiers, and weapon sprites.

@export var character_type: String = "survivor"  # survivor, npc_friendly, hostile
@export var base_scale: float = 1.0

# Sprite layers (z-index order from back to front)
const LAYER_SHADOW = -10
const LAYER_BASE_BODY = 0
const LAYER_ARMOR_BODY = 10
const LAYER_ARMOR_HEAD = 15
const LAYER_ARMOR_HANDS = 20
const LAYER_ARMOR_FEET = 25
const LAYER_ARMOR_EYES = 30
const LAYER_WEAPON = 40
const LAYER_EFFECTS = 50

# Armor tier to asset mapping
var ARMOR_TIER_PATHS = {
	1: "res://assets/characters/armor_tier_1_clothing/armor_tier_1_clothing_sprite_frames.tres",  # Clothing/Leather
	2: "res://assets/characters/armor_tier_2_light_metal/armor_tier_2_light_metal_sprite_frames.tres",  # Light Metal
	3: "res://assets/characters/armor_tier_3_heavy_metal/armor_tier_3_heavy_metal_sprite_frames.tres",  # Heavy Metal
	4: "res://assets/characters/armor_tier_4_advanced/armor_tier_4_advanced_sprite_frames.tres",  # Advanced
}

# Weapon sprite paths (to be populated)
var WEAPON_SPRITE_PATHS = {
	"production_pistol_rev2": "res://assets/weapons/production_pistol_candidate_rev2/production_pistol_atlas_rev2.png",
	"production_pistol_rev2_sprite_frames": "res://assets/weapons/production_pistol_candidate_rev2/production_pistol_rev2_sprite_frames.tres",
	"production_pistol": "res://assets/weapons/production_pistol_candidate/production_pistol_atlas.png",
	"production_pistol_sprite_frames": "res://assets/weapons/production_pistol_candidate/production_pistol_sprite_frames.tres",
}

# Equipment state
var current_armor_tier: int = 0
var current_helmet_tier: int = 0
var current_weapon_id: String = ""

# Node references
@onready var shadow_sprite: Sprite2D = $ShadowSprite
@onready var base_sprite: AnimatedSprite2D = $BaseSprite
@onready var armor_body_sprite: AnimatedSprite2D = $ArmorBodySprite
@onready var armor_head_sprite: AnimatedSprite2D = $ArmorHeadSprite
@onready var armor_hands_sprite: AnimatedSprite2D = $ArmorHandsSprite
@onready var armor_feet_sprite: AnimatedSprite2D = $ArmorFeetSprite
@onready var armor_eyes_sprite: AnimatedSprite2D = $ArmorEyesSprite
@onready var weapon_sprite: AnimatedSprite2D = $WeaponSprite

var _anim_dir: String = "S"
var _current_anim: String = "idle"

func _ready() -> void:
	_setup_nodes()
	_load_base_character()

func _setup_nodes() -> void:
	# Create nodes if they don't exist (for headless/testing)
	if not shadow_sprite:
		shadow_sprite = Sprite2D.new()
		shadow_sprite.name = "ShadowSprite"
		shadow_sprite.z_index = LAYER_SHADOW
		shadow_sprite.modulate = Color(0, 0, 0, 0.3)
		shadow_sprite.scale = Vector2(1.2, 0.3)
		add_child(shadow_sprite)
	
	if not base_sprite:
		base_sprite = AnimatedSprite2D.new()
		base_sprite.name = "BaseSprite"
		base_sprite.z_index = LAYER_BASE_BODY
		add_child(base_sprite)
	
	if not armor_body_sprite:
		armor_body_sprite = AnimatedSprite2D.new()
		armor_body_sprite.name = "ArmorBodySprite"
		armor_body_sprite.z_index = LAYER_ARMOR_BODY
		add_child(armor_body_sprite)
	
	if not armor_head_sprite:
		armor_head_sprite = AnimatedSprite2D.new()
		armor_head_sprite.name = "ArmorHeadSprite"
		armor_head_sprite.z_index = LAYER_ARMOR_HEAD
		add_child(armor_head_sprite)
	
	if not armor_hands_sprite:
		armor_hands_sprite = AnimatedSprite2D.new()
		armor_hands_sprite.name = "ArmorHandsSprite"
		armor_hands_sprite.z_index = LAYER_ARMOR_HANDS
		add_child(armor_hands_sprite)
	
	if not armor_feet_sprite:
		armor_feet_sprite = AnimatedSprite2D.new()
		armor_feet_sprite.name = "ArmorFeetSprite"
		armor_feet_sprite.z_index = LAYER_ARMOR_FEET
		add_child(armor_feet_sprite)
	
	if not armor_eyes_sprite:
		armor_eyes_sprite = AnimatedSprite2D.new()
		armor_eyes_sprite.name = "ArmorEyesSprite"
		armor_eyes_sprite.z_index = LAYER_ARMOR_EYES
		add_child(armor_eyes_sprite)
	
	if not weapon_sprite:
		weapon_sprite = AnimatedSprite2D.new()
		weapon_sprite.name = "WeaponSprite"
		weapon_sprite.z_index = LAYER_WEAPON
		add_child(weapon_sprite)

func _load_base_character() -> void:
	var sprite_frames_path = "res://assets/characters/" + character_type + "_sprite_frames.tres"
	var sprite_frames = load(sprite_frames_path)
	
	if sprite_frames:
		base_sprite.sprite_frames = sprite_frames
		# Play directional idle animation
		var anim_name = "idle_" + _anim_dir
		if base_sprite.sprite_frames.has_animation(anim_name):
			base_sprite.play(anim_name)
			base_sprite.animation = anim_name
		elif base_sprite.sprite_frames.has_animation("idle"):
			base_sprite.play("idle")
			base_sprite.animation = "idle"
		# Sync shadow - get current frame texture from animated sprite
		if shadow_sprite and base_sprite.sprite_frames and base_sprite.animation != "":
			var frame_texture = base_sprite.sprite_frames.get_frame_texture(base_sprite.animation, base_sprite.frame)
			if frame_texture:
				shadow_sprite.texture = frame_texture
	else:
		print("CharacterVisual: Failed to load base character: ", character_type)
		print("Tried path: ", sprite_frames_path)

func set_character_type(p_type: String) -> void:
	character_type = p_type
	_load_base_character()
	# Reload armor if equipped
	if current_armor_tier > 0:
		set_armor_tier(current_armor_tier)
	if current_helmet_tier > 0:
		set_helmet_tier(current_helmet_tier)

func set_armor_tier(p_tier: int) -> void:
	current_armor_tier = clamp(p_tier, 0, 4)
	
	if current_armor_tier == 0:
		armor_body_sprite.sprite_frames = null
		armor_body_sprite.stop()
		return
	
	var path = ARMOR_TIER_PATHS.get(current_armor_tier)
	if path:
		var sprite_frames = load(path)
		if sprite_frames:
			armor_body_sprite.sprite_frames = sprite_frames
			_sync_animation(armor_body_sprite)
		else:
			print("CharacterVisual: Failed to load armor tier ", current_armor_tier, " from ", path)
	else:
		print("CharacterVisual: Unknown armor tier: ", current_armor_tier)

func set_helmet_tier(p_tier: int) -> void:
	current_helmet_tier = clamp(p_tier, 0, 4)
	
	if current_helmet_tier == 0:
		armor_head_sprite.sprite_frames = null
		armor_head_sprite.stop()
		return
	
	# Use same tier assets for helmet (head portion)
	var path = ARMOR_TIER_PATHS.get(current_helmet_tier)
	if path:
		var sprite_frames = load(path)
		if sprite_frames:
			armor_head_sprite.sprite_frames = sprite_frames
			_sync_animation(armor_head_sprite)
		else:
			print("CharacterVisual: Failed to load helmet tier ", current_helmet_tier)

func set_weapon(p_weapon_id: String) -> void:
	current_weapon_id = p_weapon_id
	
	if current_weapon_id.is_empty():
		weapon_sprite.sprite_frames = null
		weapon_sprite.stop()
		return
	
	# Try to load weapon SpriteFrames first (for animated weapons)
	var sf_path = WEAPON_SPRITE_PATHS.get(current_weapon_id + "_sprite_frames")
	if sf_path:
		var sprite_frames = load(sf_path)
		if sprite_frames:
			weapon_sprite.sprite_frames = sprite_frames
			weapon_sprite.play(current_weapon_id + "_" + _anim_dir)
			weapon_sprite.centered = true
			return
	
	# Try to load weapon atlas texture (create a temporary SpriteFrames)
	var weapon_path = WEAPON_SPRITE_PATHS.get(current_weapon_id)
	if weapon_path:
		var texture = load(weapon_path)
		if texture:
			# Create simple SpriteFrames for static texture
			var sf = SpriteFrames.new()
			sf.add_animation(current_weapon_id)
			sf.set_animation_loop(current_weapon_id, false)
			sf.add_frame(current_weapon_id, texture)
			weapon_sprite.sprite_frames = sf
			weapon_sprite.play(current_weapon_id)
			weapon_sprite.centered = true
			return
	
	# Fallback: try standard naming convention
	var fallback_path = "res://assets/weapons/" + current_weapon_id + "_icon.png"
	var texture = load(fallback_path)
	if texture:
		var sf = SpriteFrames.new()
		sf.add_animation(current_weapon_id)
		sf.set_animation_loop(current_weapon_id, false)
		sf.add_frame(current_weapon_id, texture)
		weapon_sprite.sprite_frames = sf
		weapon_sprite.play(current_weapon_id)
		weapon_sprite.centered = true
	else:
		print("CharacterVisual: No weapon sprite for: ", current_weapon_id)

func _sync_animation(target_sprite: AnimatedSprite2D) -> void:
	if target_sprite and target_sprite.sprite_frames:
		if target_sprite.sprite_frames.has_animation(_current_anim):
			target_sprite.play(_current_anim)
			target_sprite.animation = _current_anim
			# For 8-directional, we need to set the frame based on direction
			if target_sprite.sprite_frames.get_animation_frame_count(_current_anim) > 0:
				target_sprite.frame = base_sprite.frame

func _sync_weapon_animation() -> void:
	"""Sync weapon sprite animation with character direction"""
	if not weapon_sprite:
		return
	
	var anim_name = current_weapon_id + "_" + _anim_dir
	if weapon_sprite.sprite_frames and weapon_sprite.sprite_frames.has_animation(anim_name):
		weapon_sprite.play(anim_name)
		weapon_sprite.animation = anim_name
		weapon_sprite.frame = base_sprite.frame
	elif weapon_sprite.sprite_frames and weapon_sprite.sprite_frames.has_animation(_current_anim + "_" + _anim_dir):
		weapon_sprite.play(_current_anim + "_" + _anim_dir)
		weapon_sprite.animation = _current_anim + "_" + _anim_dir
		weapon_sprite.frame = base_sprite.frame

func set_animation(p_anim: String, p_direction: String = "") -> void:
	_current_anim = p_anim
	if p_direction:
		_anim_dir = p_direction
	
	var anim_name = p_anim
	if p_direction and base_sprite.sprite_frames and base_sprite.sprite_frames.has_animation(p_anim + "_" + p_direction):
		anim_name = p_anim + "_" + p_direction
	
	# Play on all sprites
	for sprite in [base_sprite, armor_body_sprite, armor_head_sprite, armor_hands_sprite, armor_feet_sprite, armor_eyes_sprite]:
		if sprite and sprite.sprite_frames and sprite.sprite_frames.has_animation(anim_name):
			sprite.play(anim_name)
			sprite.animation = anim_name
		elif sprite and sprite.sprite_frames and sprite.sprite_frames.has_animation(p_anim):
			sprite.play(p_anim)
			sprite.animation = p_anim
	
	# Sync weapon animation
	_sync_weapon_animation()

func set_direction(p_direction: String) -> void:
	_anim_dir = p_direction
	# Update all animated sprites to show correct direction frame
	# This assumes animations are named like "walk_S", "idle_SW", etc.
	_update_all_directions()
	# Sync weapon animation
	_sync_weapon_animation()

func _update_all_directions() -> void:
	if not base_sprite.sprite_frames:
		return
	
	for sprite in [base_sprite, armor_body_sprite, armor_head_sprite, armor_hands_sprite, armor_feet_sprite, armor_eyes_sprite]:
		if sprite and sprite.sprite_frames:
			var anim_name = _current_anim + "_" + _anim_dir
			if sprite.sprite_frames.has_animation(anim_name):
				sprite.play(anim_name)
				sprite.animation = anim_name
				sprite.frame = base_sprite.frame

func update_from_equipment(p_equipment: Dictionary) -> void:
	"""Update visual from equipment dictionary (from Inventory.get_equipped_bonuses())"""
	# Body armor
	var body_armor = p_equipment.get("body")
	if body_armor:
		var tier = _get_armor_tier(body_armor.get("item_id", ""))
		set_armor_tier(tier)
	else:
		set_armor_tier(0)
	
	# Head armor
	var head_armor = p_equipment.get("head")
	if head_armor:
		var tier = _get_armor_tier(head_armor.get("item_id", ""))
		set_helmet_tier(tier)
	else:
		set_helmet_tier(0)
	
	# Weapon
	var weapon = p_equipment.get("weapon_primary")
	if weapon:
		set_weapon(weapon.get("item_id", ""))
	else:
		set_weapon("")

func _get_armor_tier(p_item_id: String) -> int:
	"""Map item_id to armor tier"""
	# Clothing/Leather tier (1)
	if p_item_id in ["vault_suit", "leather_armor", "leather_jacket", "leather_armor_mk2", "metal_armor_mk2"]:
		return 1
	# Light Metal tier (2)
	elif p_item_id in ["metal_armor", "combat_armor", "combat_armor_mk2", "brotherhood_armor"]:
		return 2
	# Heavy Metal tier (3)
	elif p_item_id in ["power_armor", "tesla_armor", "hardened_power_armor"]:
		return 3
	# Advanced tier (4)
	elif p_item_id in ["enclave_power_armor", "advanced_power_armor", "x01_power_armor"]:
		return 4
	return 0

func get_anim_dir() -> String:
	return _anim_dir

func get_current_anim() -> String:
	return _current_anim