extends Node2D
## Standalone visual QA screen. No gameplay data, save mutations, or equipment changes.

const DIRECTIONS: PackedStringArray = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]
const WEAPONS: PackedStringArray = ["unarmed", "pistol", "rifle"]

@onready var actor: AnimatedSprite2D = $Actor
@onready var feedback: Label = $Feedback

var current_direction: String = "S"
var current_weapon: String = "unarmed"
var current_pose: String = "ready"

func _ready() -> void:
	_create_buttons()
	_refresh()

func _create_buttons() -> void:
	var ui := CanvasLayer.new()
	ui.name = "MobileTouchControls"
	add_child(ui)
	var panel := VBoxContainer.new()
	panel.position = Vector2(45, 521)
	panel.size = Vector2(1190, 178)
	panel.add_theme_constant_override("separation", 5)
	ui.add_child(panel)
	var weapon_row := HBoxContainer.new()
	weapon_row.add_theme_constant_override("separation", 9)
	panel.add_child(weapon_row)
	for weapon in WEAPONS:
		var b := Button.new()
		b.text = "Weapon: " + weapon
		b.custom_minimum_size = Vector2(191, 44)
		b.pressed.connect(_select_weapon.bind(weapon))
		weapon_row.add_child(b)
	var pose_row := HBoxContainer.new()
	pose_row.add_theme_constant_override("separation", 9)
	panel.add_child(pose_row)
	for pose in ["ready", "aim", "fire"]:
		var b := Button.new()
		b.text = "Pose: " + pose
		b.custom_minimum_size = Vector2(191, 44)
		b.pressed.connect(_select_pose.bind(pose))
		pose_row.add_child(b)
	var facing_row := HBoxContainer.new()
	facing_row.add_theme_constant_override("separation", 8)
	panel.add_child(facing_row)
	for direction in DIRECTIONS:
		var b := Button.new()
		b.text = direction
		b.custom_minimum_size = Vector2(103, 44)
		b.pressed.connect(_select_direction.bind(direction))
		facing_row.add_child(b)

func _select_weapon(value: String) -> void:
	current_weapon = value
	_refresh()

func _select_pose(value: String) -> void:
	current_pose = value
	_refresh()

func _select_direction(value: String) -> void:
	current_direction = value
	_refresh()

func _refresh() -> void:
	var state: String = current_weapon + "_" + current_pose
	if current_weapon == "unarmed":
		state = "unarmed_idle"
	elif current_weapon == "rifle" and current_pose == "aim":
		state = "rifle_ready"
	var animation_name: String = state + "_" + current_direction
	if not actor.sprite_frames or not actor.sprite_frames.has_animation(animation_name):
		feedback.text = "MISSING sprite: " + animation_name
		actor.stop()
		actor.visible = false
		return
	actor.visible = true
	actor.play(animation_name)
	feedback.text = "RADZONE combat art QA — " + animation_name + " (single frame, NO walk/reload anim)"

func _unhandled_key_input(event: InputEvent) -> void:
	if not (event is InputEventKey) or not event.pressed or event.echo:
		return
	match event.keycode:
		KEY_LEFT:
			current_direction = DIRECTIONS[(DIRECTIONS.find(current_direction) + 1) % DIRECTIONS.size()]
		KEY_RIGHT:
			current_direction = DIRECTIONS[(DIRECTIONS.find(current_direction) + DIRECTIONS.size() - 1) % DIRECTIONS.size()]
		KEY_1:
			current_weapon = "unarmed"
		KEY_2:
			current_weapon = "pistol"
		KEY_3:
			current_weapon = "rifle"
		KEY_SPACE:
			current_pose = "fire"
		_:
			return
	_refresh()