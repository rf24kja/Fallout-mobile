class_name CombatUI
extends CanvasLayer

## Combat UI - action menu, AP display, combat log, health bars.

signal action_selected(action: String, data: Dictionary)
signal end_turn_pressed

@onready var root_panel = $RootPanel
@onready var action_panel = $RootPanel/ActionPanel
@onready var attack_button = $RootPanel/ActionPanel/AttackButton
@onready var aimed_button = $RootPanel/ActionPanel/AimedButton
@onready var burst_button = $RootPanel/ActionPanel/BurstButton
@onready var called_shot_button = $RootPanel/ActionPanel/CalledShotButton
@onready var reload_button = $RootPanel/ActionPanel/ReloadButton
@onready var item_button = $RootPanel/ActionPanel/ItemButton
@onready var move_button = $RootPanel/ActionPanel/MoveButton
@onready var end_turn_button = $RootPanel/ActionPanel/EndTurnButton
@onready var ap_label = $RootPanel/APLabel
@onready var hp_label = $RootPanel/HPLabel
@onready var combat_log = $RootPanel/CombatLog
@onready var target_panel = $RootPanel/TargetPanel
@onready var target_name = $RootPanel/TargetPanel/TargetName
@onready var target_hp = $RootPanel/TargetPanel/TargetHP
@onready var target_hp_bar = $RootPanel/TargetPanel/HPBar
@onready var cover_label = $RootPanel/TargetPanel/CoverIndicator/CoverLabel
@onready var cover_level_label = $RootPanel/TargetPanel/CoverIndicator/CoverLevelLabel
@onready var cover_bar = $RootPanel/TargetPanel/CoverIndicator/CoverBar
@onready var enemy_list = $RootPanel/EnemyList
@onready var called_shot_panel = $CalledShotPanel

var _combat_system
var _character_system
var _cover_system
var _current_target_id = ""
var _aim_mode = "normal"
var _showing_targets = false
var _current_attacker: Dictionary
var _current_weapon: Dictionary

func _ready() -> void:
	_combat_system = get_node_or_null("/root/CombatSystem")
	_character_system = get_node_or_null("/root/CharacterSystem")
	_cover_system = get_node_or_null("/root/CoverSystem")
	
	root_panel.visible = false
	
	attack_button.pressed.connect(_on_attack_pressed.bind("normal"))
	aimed_button.pressed.connect(_on_attack_pressed.bind("aimed"))
	burst_button.pressed.connect(_on_attack_pressed.bind("burst"))
	called_shot_button.pressed.connect(_on_called_shot_pressed)
	reload_button.pressed.connect(_on_reload_pressed)
	item_button.pressed.connect(_on_item_pressed)
	move_button.pressed.connect(_on_move_pressed)
	end_turn_button.pressed.connect(_on_end_turn_pressed)
	
	# Connect to combat system signals
	if _combat_system:
		_combat_system.combat_started.connect(_on_combat_started)
		_combat_system.turn_changed.connect(_on_turn_changed)
		_combat_system.action_performed.connect(_on_action_performed)
		_combat_system.combat_ended.connect(_on_combat_ended)
	
	# Connect called shot panel
	if called_shot_panel:
		called_shot_panel.target_selected.connect(_on_called_shot_selected)
		called_shot_panel.panel_closed.connect(_on_called_shot_closed)

func show_combat() -> void:
	root_panel.visible = true
	_update_display()

func hide_combat() -> void:
	root_panel.visible = false
	_hide_target_panel()

func _on_combat_started(combat_data: Dictionary) -> void:
	show_combat()
	print("Combat started: ", combat_data)

func _on_turn_changed(actor_id: String, ap: int) -> void:
	_update_display()
	_hide_target_panel()
	_current_target_id = ""
	_aim_mode = "normal"
	
	# Set current attacker for cover display
	var actor = _get_participant(actor_id)
	if actor:
		_current_attacker = actor

func _on_action_performed(actor_id: String, action: String, target_id: String, result: Dictionary) -> void:
	var log_text = ""
	if action == "attack":
		var attacker = _get_actor_name(actor_id)
		var target = _get_actor_name(target_id)
		match result.result:
			CombatSystem.CombatResult.MISS:
				log_text = "%s attacks %s but MISSES! (roll: %d, chance: %d%%)" % [attacker, target, result.roll, result.hit_chance]
			CombatSystem.CombatResult.HIT:
				log_text = "%s hits %s for %d damage!" % [attacker, target, result.damage]
			CombatSystem.CombatResult.CRITICAL:
				log_text = "%s scores a CRITICAL HIT on %s for %d damage!" % [attacker, target, result.damage]
	
	if log_text != "":
		_add_to_log(log_text)
	
	_update_display()

func _on_combat_ended(victor: String, rewards: Dictionary) -> void:
	_add_to_log("Combat ended! Victor: %s" % victor)
	if rewards.has("xp"):
		_add_to_log("XP gained: %d" % rewards.xp)
	
	await get_tree().create_timer(3.0).timeout
	hide_combat()
	action_selected.emit("combat_ended", {"victor": victor, "rewards": rewards})

func _update_display() -> void:
	if not _combat_system:
		return
	
	var state = _combat_system.get_combat_state()
	var current_actor = _combat_system.get_current_actor()
	
	if current_actor:
		ap_label.text = "AP: %d / %d" % [current_actor.ap, current_actor.max_ap]
		hp_label.text = "HP: %d / %d" % [current_actor.hp, current_actor.max_hp]
		
		# Enable/disable buttons based on AP
		attack_button.disabled = current_actor.ap < 5
		aimed_button.disabled = current_actor.ap < 8
		burst_button.disabled = current_actor.ap < 10
		reload_button.disabled = current_actor.ap < 3
		item_button.disabled = current_actor.ap < 4
		move_button.disabled = current_actor.ap < 2
		
		# Update enemy list
		_update_enemy_list(current_actor)
	else:
		ap_label.text = "AP: --"
		hp_label.text = "HP: --"

func _update_enemy_list(current_actor: Dictionary) -> void:
	enemy_list.clear()
	
	for p in _combat_system._participants:
		if not p.is_alive or p.team == current_actor.team:
			continue
		
		var item = enemy_list.add_item("%s (HP: %d/%d)" % [p.name, p.hp, p.max_hp])
		enemy_list.set_item_metadata(item, p.id)
	
	if enemy_list.get_item_count() > 0:
		enemy_list.select(0)
		_on_enemy_selected(0)

func _on_enemy_selected(index: int) -> void:
	if index < 0 or index >= enemy_list.get_item_count():
		_hide_target_panel()
		return
	
	var target_id = enemy_list.get_item_metadata(index)
	var target = _get_participant(target_id)
	
	if target:
		_show_target_panel(target)

func _show_target_panel(target: Dictionary) -> void:
	_current_target_id = target.id
	target_panel.visible = true
	target_name.text = target.name
	target_hp.text = "HP: %d / %d" % [target.hp, target.max_hp]
	target_hp_bar.max_value = target.max_hp
	target_hp_bar.value = target.hp
	
	# Update cover indicator
	if _cover_system and _current_attacker:
		var cover_level = _cover_system.check_combat_cover(_current_attacker, target)
		var cover_desc = _cover_system.get_cover_description(cover_level)
		cover_level_label.text = cover_desc
		cover_bar.max_value = 4.0
		cover_bar.value = cover_level
		cover_level_label.add_theme_color_override("font_color", _cover_system.get_cover_ui_color(cover_level))
	else:
		cover_level_label.text = "None"
		cover_bar.value = 0
		cover_level_label.add_theme_color_override("font_color", Color(0.2, 0.8, 0.2, 1))

func _hide_target_panel() -> void:
	target_panel.visible = false
	_current_target_id = ""

func _add_to_log(text: String) -> void:
	combat_log.append_text(text + "\n")
	combat_log.scroll_vertical = (combat_log.get_v_scroll_bar().max_value if combat_log.get_v_scroll_bar() else 0)

func _on_attack_pressed(aim_mode: String) -> void:
	if not _current_target_id:
		return
	
	_aim_mode = aim_mode
	action_selected.emit("attack", {"target_id": _current_target_id, "aim_mode": aim_mode})

func _on_reload_pressed() -> void:
	action_selected.emit("reload", {})

func _on_item_pressed() -> void:
	# Open inventory for combat item use
	action_selected.emit("open_inventory", {})

func _on_move_pressed() -> void:
	action_selected.emit("move_mode", {})

func _on_end_turn_pressed() -> void:
	action_selected.emit("end_turn", {})

func _get_actor_name(actor_id: String) -> String:
	var p = _get_participant(actor_id)
	return p.name if p else actor_id

func _on_called_shot_pressed() -> void:
	if not _current_target_id:
		return
	
	var current_actor = _combat_system.get_current_actor()
	if not current_actor:
		return
	
	# Get equipped weapon
	var weapon = _get_equipped_weapon(current_actor)
	if not weapon:
		_add_to_log("No weapon equipped!")
		return
	
	# Calculate base hit chance
	var target = _get_participant(_current_target_id)
	if not target:
		return
	
	var base_hit_chance = _calculate_base_hit_chance(current_actor, target, weapon, "aimed")
	
	# Show called shot panel
	_current_attacker = current_actor
	_current_weapon = weapon
	called_shot_panel.show_panel(current_actor, target, weapon, base_hit_chance)

func _on_called_shot_selected(body_part: int, hit_chance: int, ap_cost: int) -> void:
	if not _current_target_id or not _current_attacker or not _current_weapon:
		return
	
	var target = _get_participant(_current_target_id)
	if not target:
		return
	
	# Check AP
	if _current_attacker.ap < ap_cost:
		_add_to_log("Not enough AP for called shot!")
		return
	
	# Perform called shot
	action_selected.emit("called_shot", {
		"target_id": _current_target_id,
		"body_part": body_part,
		"hit_chance": hit_chance,
		"ap_cost": ap_cost,
		"weapon_id": _current_weapon.item_id
	})

func _on_called_shot_closed() -> void:
	_current_attacker = {}
	_current_weapon = {}

func _calculate_base_hit_chance(attacker: Dictionary, target: Dictionary, weapon: Dictionary, aim_mode: String) -> int:
	# Mirror CombatSystem._calculate_hit_chance logic
	var base_chance = 50
	var skill_name = weapon.get("skill", "small_guns")
	var skill = attacker.skills.get(skill_name, 0)
	
	base_chance += skill
	
	var dist = attacker.position.distance_to(target.position)
	var range = weapon.get("range", 200)
	if dist > range:
		base_chance -= int((dist - range) * 2)
	
	# Cover penalty
	if _cover_system:
		var cover_level = _cover_system.check_combat_cover(attacker, target)
		base_chance += _cover_system.get_accuracy_penalty(cover_level)
	
	match aim_mode:
		"aimed": base_chance += 20
		"burst": base_chance -= 15
	
	var target_agi = target.stats.get("agility", 5)
	base_chance -= target_agi * 2
	
	base_chance += attacker.stats.get("perception", 5) * 2
	
	if 2 in target.crippled_parts or 3 in target.crippled_parts:
		base_chance -= 20
	
	for effect in target.status_effects:
		if effect.type == "blind" or effect.type == "crippled_eyes":
			base_chance += effect.accuracy_penalty
	
	return clamp(base_chance, 5, 95)

func _get_equipped_weapon(actor: Dictionary) -> Dictionary:
	var inventory = actor.get("inventory", {})
	var equipment = inventory.get("equipment", {})
	var weapon_id = equipment.get("right_hand") or equipment.get("left_hand") or equipment.get("two_handed")
	
	if weapon_id:
		return _character_system.get_item_definition(weapon_id)
	return null

func _get_participant(id: String) -> Variant:
	if not _combat_system:
		return null
	for p in _combat_system._participants:
		if p.id == id:
			return p
	return null