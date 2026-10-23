extends CanvasLayer

signal action_selected(action: String, data: Dictionary)
signal end_turn_pressed

var root_panel
var action_panel
var attack_button
var aimed_button
var burst_button
var called_shot_button
var reload_button
var item_button
var move_button
var end_turn_button
var ap_label
var hp_label
var combat_log
var target_panel
var target_name
var target_hp
var target_hp_bar
var cover_label
var cover_level_label
var cover_bar
var enemy_list
var called_shot_panel

var _combat_system
var _character_system
var _cover_system
var _current_target_id = ""
var _aim_mode = "normal"
var _current_attacker
var _current_weapon

func _ready() -> void:
	_combat_system = get_node_or_null("/root/CombatSystem")
	_character_system = get_node_or_null("/root/CharacterSystem")
	_cover_system = get_node_or_null("/root/CoverSystem")
	
	root_panel = get_node_or_null("RootPanel")
	action_panel = get_node_or_null("RootPanel/ActionPanel")
	attack_button = get_node_or_null("RootPanel/ActionPanel/AttackButton")
	aimed_button = get_node_or_null("RootPanel/ActionPanel/AimedButton")
	burst_button = get_node_or_null("RootPanel/ActionPanel/BurstButton")
	called_shot_button = get_node_or_null("RootPanel/ActionPanel/CalledShotButton")
	reload_button = get_node_or_null("RootPanel/ActionPanel/ReloadButton")
	item_button = get_node_or_null("RootPanel/ActionPanel/ItemButton")
	move_button = get_node_or_null("RootPanel/ActionPanel/MoveButton")
	end_turn_button = get_node_or_null("RootPanel/ActionPanel/EndTurnButton")
	ap_label = get_node_or_null("RootPanel/APLabel")
	hp_label = get_node_or_null("RootPanel/HPLabel")
	combat_log = get_node_or_null("RootPanel/CombatLog")
	target_panel = get_node_or_null("RootPanel/TargetPanel")
	target_name = get_node_or_null("RootPanel/TargetPanel/TargetName")
	target_hp = get_node_or_null("RootPanel/TargetPanel/TargetHP")
	target_hp_bar = get_node_or_null("RootPanel/TargetPanel/HPBar")
	cover_label = get_node_or_null("RootPanel/TargetPanel/CoverIndicator/CoverLabel")
	cover_level_label = get_node_or_null("RootPanel/TargetPanel/CoverIndicator/CoverLevelLabel")
	cover_bar = get_node_or_null("RootPanel/TargetPanel/CoverIndicator/CoverBar")
	enemy_list = get_node_or_null("RootPanel/EnemyList")
	called_shot_panel = get_node_or_null("CalledShotPanel")
	
	if root_panel:
		root_panel.visible = false
	
	if attack_button:
		attack_button.pressed.connect(_on_attack_pressed.bind("normal"))
	if aimed_button:
		aimed_button.pressed.connect(_on_attack_pressed.bind("aimed"))
	if burst_button:
		burst_button.pressed.connect(_on_attack_pressed.bind("burst"))
	if called_shot_button:
		called_shot_button.pressed.connect(_on_called_shot_pressed)
	if reload_button:
		reload_button.pressed.connect(_on_reload_pressed)
	if item_button:
		item_button.pressed.connect(_on_item_pressed)
	if move_button:
		move_button.pressed.connect(_on_move_pressed)
	if end_turn_button:
		end_turn_button.pressed.connect(_on_end_turn_pressed)
	
	if _combat_system:
		_combat_system.combat_started.connect(_on_combat_started)
		_combat_system.turn_changed.connect(_on_turn_changed)
		_combat_system.action_performed.connect(_on_action_performed)
		_combat_system.combat_ended.connect(_on_combat_ended)
	
	if called_shot_panel:
		called_shot_panel.target_selected.connect(_on_called_shot_selected)
		called_shot_panel.panel_closed.connect(_on_called_shot_closed)

func show_combat() -> void:
	if root_panel:
		root_panel.visible = true
	_update_display()

func hide_combat() -> void:
	if root_panel:
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
	
	var actor = _get_participant(actor_id)
	if actor:
		_current_attacker = actor

func _on_action_performed(actor_id: String, action: String, target_id: String, result: Dictionary) -> void:
	var log_text = ""
	if action == "attack":
		var attacker = _get_actor_name(actor_id)
		var target = _get_actor_name(target_id)
		if result.result == 0:
			log_text = "%s attacks %s but MISSES! (roll: %d, chance: %d%%)" % [attacker, target, result.roll, result.hit_chance]
		elif result.result == 1:
			log_text = "%s hits %s for %d damage!" % [attacker, target, result.damage]
		elif result.result == 2:
			log_text = "%s scores a CRITICAL HIT on %s for %d damage!" % [attacker, target, result.damage]
	
	if log_text != "":
		_add_to_log(log_text)
	
	_update_display()

func _on_combat_ended(victor: String, rewards: Dictionary) -> void:
	_add_to_log("Combat ended! Victor: %s" % victor)
	if rewards.has("xp"):
		_add_to_log("XP gained: %d" % rewards.xp)
	
	hide_combat()
	action_selected.emit("combat_ended", {"victor": victor, "rewards": rewards})

func _update_display() -> void:
	if not _combat_system:
		return
	
	var current_actor = _combat_system.get_current_actor()
	
	if current_actor:
		if ap_label:
			ap_label.text = "AP: %d / %d" % [current_actor.ap, current_actor.max_ap]
		if hp_label:
			hp_label.text = "HP: %d / %d" % [current_actor.hp, current_actor.max_hp]
		
		if attack_button:
			attack_button.disabled = current_actor.ap < 5
		if aimed_button:
			aimed_button.disabled = current_actor.ap < 8
		if burst_button:
			burst_button.disabled = current_actor.ap < 10
		if reload_button:
			reload_button.disabled = current_actor.ap < 3
		if item_button:
			item_button.disabled = current_actor.ap < 4
		if move_button:
			move_button.disabled = current_actor.ap < 2
		
		_update_enemy_list(current_actor)
	else:
		if ap_label:
			ap_label.text = "AP: --"
		if hp_label:
			hp_label.text = "HP: --"

func _update_enemy_list(current_actor: Dictionary) -> void:
	if not enemy_list:
		return
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
	if not enemy_list:
		return
	if index < 0 or index >= enemy_list.get_item_count():
		_hide_target_panel()
		return
	
	var target_id = enemy_list.get_item_metadata(index)
	var target = _get_participant(target_id)
	
	if target:
		_show_target_panel(target)

func _show_target_panel(target: Dictionary) -> void:
	_current_target_id = target.id
	if target_panel:
		target_panel.visible = true
	if target_name:
		target_name.text = target.name
	if target_hp:
		target_hp.text = "HP: %d / %d" % [target.hp, target.max_hp]
	if target_hp_bar:
		target_hp_bar.max_value = target.max_hp
		target_hp_bar.value = target.hp
	
	if _cover_system and _current_attacker:
		var cover_level = _cover_system.check_combat_cover(_current_attacker, target)
		var cover_desc = _cover_system.get_cover_description(cover_level)
		if cover_level_label:
			cover_level_label.text = cover_desc
		if cover_bar:
			cover_bar.max_value = 4.0
			cover_bar.value = cover_level
		if cover_level_label:
			cover_level_label.add_theme_color_override("font_color", _cover_system.get_cover_ui_color(cover_level))
	else:
		if cover_level_label:
			cover_level_label.text = "None"
		if cover_bar:
			cover_bar.value = 0
		if cover_level_label:
			cover_level_label.add_theme_color_override("font_color", Color(0.2, 0.8, 0.2, 1))

func _hide_target_panel() -> void:
	if target_panel:
		target_panel.visible = false
	_current_target_id = ""

func _add_to_log(text: String) -> void:
	if combat_log:
		combat_log.append_text(text + "\n")
		var v_scroll = combat_log.get_v_scroll_bar()
		if v_scroll:
			v_scroll.value = v_scroll.max_value

func _get_actor_name(actor_id: String) -> String:
	var p = _get_participant(actor_id)
	return p.name if p else actor_id

func _on_attack_pressed(aim_mode: String) -> void:
	if not _current_target_id:
		return
	
	_aim_mode = aim_mode
	action_selected.emit("attack", {"target_id": _current_target_id, "aim_mode": aim_mode})

func _on_reload_pressed() -> void:
	action_selected.emit("reload", {})

func _on_item_pressed() -> void:
	action_selected.emit("open_inventory", {})

func _on_move_pressed() -> void:
	action_selected.emit("move_mode", {})

func _on_end_turn_pressed() -> void:
	action_selected.emit("end_turn", {})

func _on_called_shot_pressed() -> void:
	if not _current_target_id:
		return
	
	var current_actor = _combat_system.get_current_actor()
	if not current_actor:
		return
	
	var weapon = _get_equipped_weapon(current_actor)
	if not weapon:
		_add_to_log("No weapon equipped!")
		return
	
	var target = _get_participant(_current_target_id)
	if not target:
		return
	
	_current_attacker = current_actor
	_current_weapon = weapon
	if called_shot_panel:
		called_shot_panel.show_panel(current_actor, target, weapon, 50)

func _on_called_shot_selected(body_part: int, hit_chance: int, ap_cost: int) -> void:
	if not _current_target_id or not _current_attacker or not _current_weapon:
		return
	
	var target = _get_participant(_current_target_id)
	if not target:
		return
	
	if _current_attacker.ap < ap_cost:
		_add_to_log("Not enough AP for called shot!")
		return
	
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

func _get_participant(id: String) -> Variant:
	if not _combat_system:
		return null
	for p in _combat_system._participants:
		if p.id == id:
			return p
	return null

func _get_equipped_weapon(actor):
	var inventory = get_node_or_null("/root/Inventory")
	if not inventory:
		return null
	
	var equipment = inventory.get_all_equipped()
	var weapon_id = equipment.get("right_hand") or equipment.get("left_hand") or equipment.get("two_handed")
	
	if weapon_id:
		var item_db = get_node_or_null("/root/ItemDatabase")
		if item_db:
			var item_def = item_db.get_item(weapon_id)
			if item_def:
				return {"item_id": weapon_id, "name": item_def.name, "definition": item_def}
	return null