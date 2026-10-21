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
@onready var enemy_list = $RootPanel/EnemyList

var _combat_system
var _character_system
var _current_target_id = ""
var _aim_mode = "normal"
var _showing_targets = false

func _ready() -> void:
	_combat_system = get_node_or_null("/root/CombatSystem")
	_character_system = get_node_or_null("/root/CharacterSystem")
	
	root_panel.visible = false
	
	attack_button.pressed.connect(_on_attack_pressed.bind("normal"))
	aimed_button.pressed.connect(_on_attack_pressed.bind("aimed"))
	burst_button.pressed.connect(_on_attack_pressed.bind("burst"))
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

func _get_participant(id: String) -> Variant:
	if not _combat_system:
		return null
	for p in _combat_system._participants:
		if p.id == id:
			return p
	return null