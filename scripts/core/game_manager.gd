class_name GameManager
extends Node

## Central game state manager. Handles game flow, state persistence, and system coordination.

var save_system
var event_bus
var combat_system
var character_system

var current_state: int = 0  # MAIN_MENU = 0
var current_map: String = "test_map"
var player_data: Dictionary = {}
var world_state: Dictionary = {}
var quest_flags: Dictionary = {}
var game_time: float = 0.0  # In-game hours

func _ready() -> void:
	save_system = get_node_or_null("/root/SaveSystem")
	event_bus = get_node_or_null("/root/EventBus")
	combat_system = get_node_or_null("/root/CombatSystem")
	character_system = get_node_or_null("/root/CharacterSystem")
	_load_default_state()
	
	# Connect to EventBus if available, otherwise it will be connected later
	_refresh_eventbus_connections()
	
	# Connect to CombatSystem signals
	if combat_system:
		combat_system.combat_started.connect(_on_combat_started)
		combat_system.combat_ended.connect(_on_combat_ended)
	
	# Connect to CharacterSystem signals
	if character_system:
		character_system.level_up.connect(_on_level_up)
		character_system.xp_gained.connect(_on_xp_gained)

func _refresh_eventbus_connections() -> void:
	event_bus = get_node_or_null("/root/EventBus")
	if event_bus:
		event_bus.connect("save_requested", _on_save_requested.bind())
		event_bus.connect("load_requested", _on_load_requested.bind())
		event_bus.connect("scene_change_requested", _on_scene_change_requested.bind())

func _get_eventbus() -> Node:
	if not event_bus:
		event_bus = get_node_or_null("/root/EventBus")
	return event_bus

func _get_combat_system() -> Node:
	if not combat_system:
		combat_system = get_node_or_null("/root/CombatSystem")
	return combat_system

func _get_character_system() -> Node:
	if not character_system:
		character_system = get_node_or_null("/root/CharacterSystem")
	return character_system

func _load_default_state() -> void:
	player_data = {
		"name": "Vault Dweller",
		"level": 1,
		"xp": 0,
		"xp_to_next": 1000,
		"hp": 100,
		"max_hp": 100,
		"ap": 10,
		"max_ap": 10,
		"caps": 150,
		"special": {
			"might": 5,
			"awareness": 5,
			"vigor": 5,
			"presence": 5,
			"intellect": 5,
			"dexterity": 5,
			"fortune": 5
		},
		"skills": {
			"small_guns": 0,
			"big_guns": 0,
			"energy_weapons": 0,
			"unarmed": 0,
			"melee": 0,
			"throwing": 0,
			"first_aid": 0,
			"doctor": 0,
			"sneak": 0,
			"lockpick": 0,
			"steal": 0,
			"traps": 0,
			"science": 0,
			"repair": 0,
			"speech": 0,
			"barter": 0,
			"gambling": 0,
			"outdoorsman": 0
		},
		"tag_skills": ["small_guns", "speech", "lockpick"],
		"perks": [],
		"inventory": [],
		"equipment": {
			"weapon": null,
			"armor": null
		},
		"position": Vector2(0, 0)
	}
	world_state = {}
	quest_flags = {}
	game_time = 0.0

func change_state(new_state: int) -> void:
	if current_state == new_state:
		return
	var old_state = current_state
	current_state = new_state
	_match_state(new_state)
	print("Game state: ", old_state, " -> ", new_state)

func _match_state(state: int) -> void:
	match state:
		0:  # MAIN_MENU
			Engine.set_time_scale(1.0)
		1:  # PLAYING
			Engine.set_time_scale(1.0)
		2:  # PAUSED
			Engine.set_time_scale(0.0)
		3:  # DIALOGUE
			Engine.set_time_scale(0.0)
		4:  # COMBAT
			Engine.set_time_scale(1.0)
			_show_combat_ui()
		5:  # INVENTORY
			Engine.set_time_scale(0.0)
		6:  # WORLD_MAP
			Engine.set_time_scale(1.0)
		7:  # GAME_OVER
			Engine.set_time_scale(0.0)

func _show_combat_ui() -> void:
	var combat_ui = get_node_or_null("/root/CombatUI") or get_tree().root.get_node_or_null("CombatUI")
	if combat_ui:
		combat_ui.show_combat()

func get_player_stat(stat: String) -> int:
	return player_data.special.get(stat, 5)

func set_player_stat(stat: String, value: int) -> void:
	player_data.special[stat] = clamp(value, 1, 10)
	_get_eventbus().emit("stats_changed", [stat, player_data.special[stat]])
	_recalculate_derived_stats()

func modify_player_stat(stat: String, delta: int) -> void:
	set_player_stat(stat, get_player_stat(stat) + delta)

func _recalculate_derived_stats() -> void:
	var s = player_data.special
	# HP = 15 + Might + Vigor * 2
	player_data.max_hp = 15 + s.might + s.vigor * 2
	player_data.hp = min(player_data.hp, player_data.max_hp)
	# AP = 5 + Dexterity / 2
	player_data.max_ap = 5 + int(s.dexterity / 2)
	player_data.ap = min(player_data.ap, player_data.max_ap)
	# Carry Weight = 25 + Might * 25
	# Sequence = Awareness * 2
	# Healing Rate = Vigor / 3
	# Critical Chance = Fortune / 2

func add_xp(amount: int) -> void:
	player_data.xp += amount
	while player_data.xp >= player_data.xp_to_next:
		_level_up()

func _level_up() -> void:
	player_data.xp -= player_data.xp_to_next
	player_data.level += 1
	player_data.xp_to_next = int(player_data.xp_to_next * 1.5)
	_get_eventbus().emit("level_up", [player_data.level, 0, false])
	print("Level up! Now level ", player_data.level)

func add_quest_flag(quest_id: String, flag: String, value: Variant = true) -> void:
	if not quest_flags.has(quest_id):
		quest_flags[quest_id] = {}
	quest_flags[quest_id][flag] = value
	_get_eventbus().emit("quest_updated", [quest_id, flag])

func get_quest_flag(quest_id: String, flag: String, default: Variant = false) -> Variant:
	return quest_flags.get(quest_id, {}).get(flag, default)

func clear_quest_flag(quest_id: String) -> void:
	if quest_flags.has(quest_id):
		quest_flags.erase(quest_id)
		_get_eventbus().emit("quest_updated", [quest_id, "cleared"])

func set_world_state(key: String, value: Variant) -> void:
	world_state[key] = value

func get_world_state(key: String, default: Variant = null) -> Variant:
	return world_state.get(key, default)

func advance_time(hours: float) -> void:
	game_time += hours

func get_save_data() -> Dictionary:
	var inventory = get_node_or_null("/root/Inventory")
	return {
		"version": 2,
		"player": player_data,
		"inventory": inventory.get_save_data() if inventory else [],
		"world": world_state,
		"quests": quest_flags,
		"time": game_time,
		"map": current_map
	}

func _migrate_save_data(data: Dictionary) -> Dictionary:
	"""Migrate save data from older versions to current version."""
	var version = data.get("version", 1)
	var migrated = data.duplicate(true)
	
	# Migration from v1 to v2: SPECIAL attribute rename
	if version < 2:
		print("SaveSystem: Migrating save from v", version, " to v2")
		migrated = _migrate_v1_to_v2(migrated)
		migrated["version"] = 2
	
	return migrated

func _migrate_v1_to_v2(data: Dictionary) -> Dictionary:
	"""Migrate v1 saves with old SPECIAL names to v2 with new names."""
	var migrated = data.duplicate(true)
	
	# Mapping old SPECIAL keys to new keys
	var special_mapping = {
		"strength": "might",
		"perception": "awareness",
		"endurance": "vigor",
		"charisma": "presence",
		"intelligence": "intellect",
		"agility": "dexterity",
		"luck": "fortune"
	}
	
	# Migrate player.special
	var player = migrated.get("player", {})
	var old_special = player.get("special", {})
	var new_special = {}
	
	for old_key in old_special:
		var new_key = special_mapping.get(old_key, old_key)
		# Preserve value; if both old and new exist, prefer old (deterministic)
		if not new_special.has(new_key):
			new_special[new_key] = old_special[old_key]
	
	# Preserve all other player fields, only replace special
	player.special = new_special
	migrated.player = player
	
	# Note: CharacterSystem is the source of truth for derived stats
	# GameManager will recalculate derived stats on load
	return migrated

func load_save_data(data: Dictionary) -> void:
	# Migrate save data if needed
	var migrated_data = _migrate_save_data(data)
	
	player_data = migrated_data.get("player", player_data)
	world_state = migrated_data.get("world", {})
	quest_flags = migrated_data.get("quests", {})
	game_time = migrated_data.get("time", 0.0)
	current_map = migrated_data.get("map", "test_map")
	
	var inventory = get_node_or_null("/root/Inventory")
	if inventory:
		inventory.load_save_data(migrated_data.get("inventory", []))
	
	var cs = _get_character_system()
	if cs and cs.has_method("load_save_data"):
		cs.load_save_data(migrated_data.get("player", player_data))
	
	# Sync GameManager player_data with CharacterSystem after load
	if cs and cs.has_method("get_character_sheet"):
		var sheet = cs.get_character_sheet()
		if sheet and sheet.has("level"):
			player_data.level = sheet.level
		if sheet and sheet.has("xp"):
			player_data.xp = sheet.xp
		if sheet and sheet.has("xp_to_next"):
			player_data.xp_to_next = sheet.xp_to_next
	
	# Do NOT recalculate derived stats on load - preserve exact saved HP/AP values.
	# Recalculation happens on level up or when SPECIAL attributes change.

func add_to_inventory(item_instance: Dictionary) -> bool:
	var inventory = get_node_or_null("/root/Inventory")
	if inventory:
		return inventory.add_item(item_instance)
	return false

func get_item_count(item_id: String) -> int:
	var inventory = get_node_or_null("/root/Inventory")
	if inventory and inventory.has_method("get_item_count"):
		return inventory.get_item_count(item_id)
	return 0

func _on_save_requested(slot: int) -> void:
	save_system.save_game(slot, get_save_data())

func _on_load_requested(slot: int) -> void:
	var data = save_system.load_game(slot)
	if data:
		load_save_data(data)
		_get_eventbus().emit("scene_change_requested", ["res://scenes/world/" + current_map + ".tscn"])

func _on_scene_change_requested(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)

func _on_combat_started(combat_data: Dictionary) -> void:
	change_state(4)  # COMBAT state
	print("Combat started via GameManager")

func _on_combat_ended(victor: String, rewards: Dictionary) -> void:
	change_state(1)  # Return to PLAYING
	
	if rewards.has("xp") and rewards.xp > 0:
		var cs = _get_character_system()
		if cs:
			cs.add_xp(rewards.xp)
	
	# Give loot
	if rewards.has("loot"):
		for item in rewards.loot:
			add_to_inventory(item)
	
	var combat_ui = get_node_or_null("/root/CombatUI") or get_tree().root.get_node_or_null("CombatUI")
	if combat_ui:
		combat_ui.hide_combat()

func _on_level_up(new_level: int, skill_points: int, perk_available: bool) -> void:
	# Sync with local player_data
	player_data.level = new_level
	var cs = _get_character_system()
	if cs:
		player_data.xp_to_next = cs.xp_for_level(new_level + 1) - player_data.xp
	_get_eventbus().emit("level_up", [new_level, skill_points, perk_available])
	print("Level up synced to GameManager: level ", new_level)

func _on_xp_gained(amount: int, total_xp: int) -> void:
	player_data.xp = total_xp
	var cs = _get_character_system()
	if cs:
		player_data.level = cs.character_data.level
		player_data.xp_to_next = cs.character_data.xp_to_next
	_get_eventbus().emit("xp_gained", [amount, total_xp])

func start_combat(participants: Array) -> Dictionary:
	var cs = _get_combat_system()
	if cs:
		return cs.start_combat(participants)
	return {}

func get_character_sheet() -> Dictionary:
	var cs = _get_character_system()
	if cs:
		return cs.get_character_sheet()
	return {}

func get_equipped_items() -> Dictionary:
	"""Get currently equipped items for paperdoll visualization"""
	var inventory = get_node_or_null("/root/Inventory")
	if inventory and inventory.has_method("get_all_equipped"):
		return inventory.get_all_equipped()
	return {}