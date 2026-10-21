class_name CalledShotPanel
extends PanelContainer

## Called Shot UI Panel
## Displays body part targeting with hit chance, AP cost, and effect info
## Integrates with CombatSystem body part modifiers

signal target_selected(body_part: int, hit_chance: int, ap_cost: int)
signal panel_closed()

@onready var _background = %Background
@onready var _close_button = %CloseButton
@onready var _title = %Title
@onready var _silhouette = %BodySilhouette
@onready var _hit_chance_label = %HitChanceLabel
@onready var _ap_cost_label = %APCostLabel
@onready var _effect_label = %EffectLabel

@onready var _head_button = %HeadButton
@onready var _torso_button = %TorsoButton
@onready var _left_arm_button = %LeftArmButton
@onready var _right_arm_button = %RightArmButton
@onready var _left_leg_button = %LeftLegButton
@onready var _right_leg_button = %RightLegButton
@onready var _groin_button = %GroinButton
@onready var _eyes_button = %EyesButton

# Body part mapping to constants from constants.gd
const BODY_PARTS = {
	"head": 0,
	"torso": 1,
	"left_arm": 2,
	"right_arm": 3,
	"left_leg": 4,
	"right_leg": 5,
	"groin": 6,
	"eyes": 7
}

# Part data: {button, name, base_hit_chance_mod, ap_cost, effect_description}
var _part_data: Dictionary = {}
var _current_attacker: Dictionary
var _current_target: Dictionary
var _current_weapon: Dictionary
var _base_hit_chance: int = 0

func _ready() -> void:
	_setup_part_data()
	_connect_buttons()
	_close_button.pressed.connect(_on_close_pressed)
	
	# Hide initially
	visible = false

func _setup_part_data() -> void:
	_part_data = {
		"head": {
			"button": _head_button,
			"name": "Head",
			"hit_mod": -30,
			"ap_cost": 8,
			"effect": "High damage, chance to blind/cripple",
			"enum": 0
		},
		"eyes": {
			"button": _eyes_button,
			"name": "Eyes",
			"hit_mod": -40,
			"ap_cost": 10,
			"effect": "Blind target, high crit chance",
			"enum": 7
		},
		"torso": {
			"button": _torso_button,
			"name": "Torso",
			"hit_mod": 0,
			"ap_cost": 5,
			"effect": "Standard damage, largest hit area",
			"enum": 1
		},
		"left_arm": {
			"button": _left_arm_button,
			"name": "Left Arm",
			"hit_mod": -20,
			"ap_cost": 6,
			"effect": "Cripple arm, drop weapon",
			"enum": 2
		},
		"right_arm": {
			"button": _right_arm_button,
			"name": "Right Arm",
			"hit_mod": -20,
			"ap_cost": 6,
			"effect": "Cripple arm, drop weapon",
			"enum": 3
		},
		"left_leg": {
			"button": _left_leg_button,
			"name": "Left Leg",
			"hit_mod": -15,
			"ap_cost": 6,
			"effect": "Cripple leg, reduce movement",
			"enum": 4
		},
		"right_leg": {
			"button": _right_leg_button,
			"name": "Right Leg",
			"hit_mod": -15,
			"ap_cost": 6,
			"effect": "Cripple leg, reduce movement",
			"enum": 5
		},
		"groin": {
			"button": _groin_button,
			"name": "Groin",
			"hit_mod": -25,
			"ap_cost": 7,
			"effect": "Stun target, high pain",
			"enum": 6
		}
	}

func _connect_buttons() -> void:
	for part_name, data in _part_data:
		var btn: Button = data.button
		btn.pressed.connect(_on_part_pressed.bind(part_name))
		btn.mouse_entered.connect(_on_part_hover.bind(part_name))
		btn.mouse_exited.connect(_on_part_unhover)

func show_panel(attacker: Dictionary, target: Dictionary, weapon: Dictionary, base_hit_chance: int) -> void:
	_current_attacker = attacker
	_current_target = target
	_current_weapon = weapon
	_base_hit_chance = base_hit_chance
	
	visible = true
	_update_all_hit_chances()
	_title.text = "SELECT TARGET REGION - %s" % target.get("name", "Target")

func _update_all_hit_chances() -> void:
	for part_name, data in _part_data:
		var hit_chance = _calculate_part_hit_chance(part_name)
		data.button.tooltip_text = "%s\nHit: %d%%\nAP: %d\n%s" % [
			data.name, hit_chance, data.ap_cost, data.effect
		]

func _calculate_part_hit_chance(part_name: String) -> int:
	var data = _part_data[part_name]
	var chance = _base_hit_chance + data.hit_mod
	
	# Apply cover penalty if applicable
	if _current_attacker and _current_target:
		# Get cover system from autoload or scene
		var cover_system = get_node_or_null("/root/CoverSystem")
		if cover_system:
			var cover_level = cover_system.check_combat_cover(_current_attacker, _current_target)
			chance += cover_system.get_accuracy_penalty(cover_level)
	
	return clamp(chance, 5, 95)

func _on_part_hover(part_name: String) -> void:
	var data = _part_data[part_name]
	var hit_chance = _calculate_part_hit_chance(part_name)
	_hit_chance_label.text = "Hit Chance: %d%%" % hit_chance
	_ap_cost_label.text = "AP Cost: %d" % data.ap_cost
	_effect_label.text = "Effect: %s" % data.effect
	
	# Highlight button
	data.button.modulate = Color(1, 1, 0.5, 1)

func _on_part_unhover() -> void:
	_hit_chance_label.text = "Hit Chance: --%"
	_ap_cost_label.text = "AP Cost: --"
	_effect_label.text = "Effect: --"
	
	# Reset all buttons
	for part_name, data in _part_data:
		data.button.modulate = Color(1, 1, 1, 1)

func _on_part_pressed(part_name: String) -> void:
	var data = _part_data[part_name]
	var hit_chance = _calculate_part_hit_chance(part_name)
	
	# Emit signal with selected part
	target_selected.emit(data.enum, hit_chance, data.ap_cost)
	
	# Close panel
	hide()
	panel_closed.emit()

func _on_close_pressed() -> void:
	hide()
	panel_closed.emit()

func _on_AttackButton_pressed() -> void:
	# This will be connected from combat_ui.gd
	pass