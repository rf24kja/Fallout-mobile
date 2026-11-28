extends Node

## Thin controller attached to scenes/campaign/campaign_root.tscn.
## preload() constants avoid depending on a rebuilt global class cache.
## Wires the campaign layer together, SOFT-loads the mobile controls scene,
## and (critically) renders a REAL playable location with a Player + camera.
## Without this, Start Game produced an empty gray screen on Android.

const MOBILE_CONTROLS_PATH := "res://scenes/ui/mobile_controls.tscn"
const PLAYER_SCRIPT_PATH := "res://scripts/entities/player.gd"
const CHARACTER_VISUAL_PATH := "res://scripts/entities/character_visual.gd"
const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")
const CampaignQuests = preload("res://scripts/campaign/campaign_quests.gd")
const CampaignDialogues = preload("res://scripts/campaign/campaign_dialogues.gd")
const LocationScene = preload("res://scripts/campaign/location_scene.gd")

@onready var world_map: Node = get_node_or_null("WorldMap")

var loader = CampaignLoader.new()
var quests = CampaignQuests.new()
var dialogues = CampaignDialogues.new()

var last_summary: Dictionary = {}
var current_location: Node = null
var player: Node = null


func _ready() -> void:
	last_summary = loader.load_all()
	_try_attach_mobile_controls()

	var qm := get_node_or_null("/root/QuestManager")
	var dm := get_node_or_null("/root/DialogueManager")
	var registered_quests: int = quests.register_original_quests(last_summary.get("quests", []), qm)
	var registered_dialogues: int = dialogues.register_original_dialogues(last_summary.get("dialogues", []), dm)
	print("CampaignRoot: source='%s' available=%s quests=%d dialogues=%d" % [
		str(last_summary.get("source", "")), str(last_summary.get("available", false)),
		registered_quests, registered_dialogues,
	])

	if world_map != null and world_map.has_method("build_from_data"):
		world_map.call("build_from_data", last_summary.get("locations", []), last_summary.get("maps", []))

	_enter_initial_location()
	_create_player()


func _enter_initial_location() -> void:
	var initial_id := ""
	if world_map != null and world_map.has_method("get_all_ids"):
		var ids: Array = world_map.call("get_all_ids")
		if not ids.is_empty():
			initial_id = "arroyo" if ids.has("arroyo") else str(ids[0])
	if not initial_id.is_empty() and world_map != null and world_map.has_method("travel_to"):
		world_map.call("travel_to", initial_id)

	var loc_data: Dictionary = {}
	if world_map != null and world_map.has_method("get_location"):
		var fetched: Variant = world_map.call("get_location", initial_id)
		if fetched is Dictionary:
			loc_data = fetched

	# Render a real 2D playable location (an empty dict still yields a valid map).
	current_location = LocationScene.new()
	current_location.name = "CurrentLocation"
	add_child(current_location)
	if current_location.has_method("set_world_map"):
		current_location.call("set_world_map", world_map)
	if current_location.has_method("configure"):
		current_location.call("configure", loc_data, {})
	if current_location.has_signal("exit_interacted") and not current_location.is_connected("exit_interacted", Callable(self, "_on_exit_interacted")):
		current_location.connect("exit_interacted", Callable(self, "_on_exit_interacted"))
	print("CampaignRoot: location='%s' rendered children=%d" % [initial_id, current_location.get_child_count()])


func _on_exit_interacted(to_id: String) -> void:
	if world_map == null or not world_map.has_method("travel_to"):
		return
	if not bool(world_map.call("travel_to", to_id)):
		return
	var new_id: String = ""
	if world_map.has_method("get_current_id"):
		new_id = str(world_map.call("get_current_id"))
	var loc_data: Dictionary = {}
	if world_map.has_method("get_location"):
		var fetched: Variant = world_map.call("get_location", new_id)
		if fetched is Dictionary:
			loc_data = fetched
	if current_location != null and is_instance_valid(current_location) and current_location.has_method("configure"):
		current_location.call("configure", loc_data, {})
	if player != null and is_instance_valid(player) and current_location != null and current_location.has_method("get_player_spawn"):
		player.global_position = current_location.call("get_player_spawn")
	print("CampaignRoot: travelled to '%s'" % new_id)


func _create_player() -> void:
	player = CharacterBody2D.new()
	player.name = "Player"
	var pscript: GDScript = load(PLAYER_SCRIPT_PATH)
	if pscript != null:
		player.set_script(pscript)

	var shape := CollisionShape2D.new()
	shape.name = "CollisionShape2D"
	var rect := RectangleShape2D.new()
	rect.size = Vector2(16.0, 24.0)
	shape.shape = rect
	shape.position = Vector2(0.0, -16.0)
	player.add_child(shape)

	var cam := Camera2D.new()
	cam.name = "Camera2D"
	cam.enabled = true
	# NOTE: do not set cam.current before the node enters the tree — Godot 4.7
	# rejects the assignment outside an active tree. It is made current after
	# add_child(player) below, inside _finalize_player().
	if current_location != null and current_location.has_method("get_map_size"):
		var size: Vector2 = current_location.call("get_map_size")
		cam.limit_left = 0
		cam.limit_top = 0
		cam.limit_right = int(size.x)
		cam.limit_bottom = int(size.y)
	player.add_child(cam)

	var visual := Node2D.new()
	visual.name = "CharacterVisual"
	var vscript: GDScript = load(CHARACTER_VISUAL_PATH)
	if vscript != null:
		visual.set_script(vscript)
	visual.position = Vector2(0.0, -32.0)

	# character_visual.gd uses @onready = $ShadowSprite etc. Create those named
	# children BEFORE the node enters the tree so @onready resolves cleanly.
	# character_visual.gd types shadow_sprite as Sprite2D and all others as
	# AnimatedSprite2D — create the matching node class for each name.
	var sprite_names := ["ShadowSprite", "BaseSprite", "ArmorBodySprite", "ArmorHeadSprite", "ArmorHandsSprite", "ArmorFeetSprite", "ArmorEyesSprite", "WeaponSprite"]
	for sname in sprite_names:
		var s: Node2D
		if sname == "ShadowSprite":
			s = Sprite2D.new()
		else:
			s = AnimatedSprite2D.new()
		s.name = sname
		visual.add_child(s)
	player.add_child(visual)

	# Add to the tree LAST so @onready refs ($CollisionShape2D, $Camera2D,
	# $CharacterVisual) resolve when player.gd:_ready() runs.
	add_child(player)

	# cam.current may only be set once the node is inside the active tree.
	call_deferred("_finalize_player_camera", player)

	if current_location != null and current_location.has_method("get_player_spawn"):
		player.global_position = current_location.call("get_player_spawn")
	print("CampaignRoot: Player created at %s" % str(player.global_position))


func _finalize_player_camera(node: Node) -> void:
	if node == null or not is_instance_valid(node):
		return
	var cam := node.get_node_or_null("Camera2D")
	if cam != null and cam is Camera2D and cam.has_method("make_current"):
		(cam as Camera2D).call("make_current")


func _try_attach_mobile_controls() -> void:
	if not ResourceLoader.exists(MOBILE_CONTROLS_PATH):
		return
	var packed: PackedScene = load(MOBILE_CONTROLS_PATH)
	if packed == null:
		return
	var instance := packed.instantiate()
	if instance != null:
		add_child(instance)
