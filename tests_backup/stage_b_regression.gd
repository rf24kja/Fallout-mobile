#!/usr/bin/env -S godot --headless --script

## Stage B Regression Tests
## Tests all Stage B functionality: interaction, dialogue, inventory, quest, save/load

class_name StageBRegressionTests
extends SceneTree

var _test_results: Array[Dictionary] = []
var _current_scene
var _game_manager
var _event_bus
var _save_system
var _interaction_manager
var _item_database
var _inventory
var _dialogue_manager
var _player

func _init():
	# Run tests after scene tree is ready
	call_deferred("_run_tests")

func _run_tests() -> void:
	print("=== Stage B Regression Tests ===")
	
	# Initialize autoloads manually for headless testing
	_initialize_autoloads()
	
	# Load test scene
	_load_test_scene()
	
	# Wait a frame for scene to initialize
	call_deferred("_execute_tests")

func _initialize_autoloads() -> void:
	# Create and register all autoload singletons
	var eb = preload("res://scripts/core/event_bus.gd").new()
	var gm = preload("res://scripts/core/game_manager.gd").new()
	var ss = preload("res://scripts/core/save_system.gd").new()
	var im = preload("res://scripts/systems/interaction.gd").new()
	var idb = preload("res://scripts/systems/item_database.gd").new()
	var inv = preload("res://scripts/systems/inventory.gd").new()
	var dm = preload("res://scripts/systems/dialogue_manager.gd").new()
	
	root.add_child(eb)
	root.add_child(gm)
	root.add_child(ss)
	root.add_child(im)
	root.add_child(idb)
	root.add_child(inv)
	root.add_child(dm)
	
	eb.name = "EventBus"
	gm.name = "GameManager"
	ss.name = "SaveSystem"
	im.name = "InteractionManager"
	idb.name = "ItemDatabase"
	inv.name = "Inventory"
	dm.name = "DialogueManager"
	
	_event_bus = eb
	_game_manager = gm
	_save_system = ss
	_interaction_manager = im
	_item_database = idb
	_inventory = inv
	_dialogue_manager = dm
	
	# Give them a frame to initialize
	_process_frame()

func _process_frame() -> void:
	# Process one frame
	get_root().call_deferred("process_frame")

func _load_test_scene() -> void:
	var scene = load("res://scenes/world/test_map.tscn")
	_current_scene = scene.instantiate()
	root.add_child(_current_scene)
	_current_scene.name = "TestMap"
	_process_frame()

func _execute_tests() -> void:
	# Get player reference
	_player = _current_scene.get_node("Player")
	
	# Test 1: Player movement and interaction distance
	_test_player_movement()
	
	# Test 2: NPC dialogue opens and closes
	_test_npc_dialogue()
	
	# Test 3: Dialogue conditions and consequences
	_test_dialogue_conditions_consequences()
	
	# Test 4: Quest activation
	_test_quest_activation()
	
	# Test 5: Item pickup adds exactly one item
	_test_item_pickup()
	
	# Test 6: Collected world items don't respawn after save/load
	_test_item_respawn_save_load()
	
	# Test 7: Inventory respects stack sizes and capacity
	_test_inventory_stacking_capacity()
	
	# Test 8: Quest rewards granted exactly once
	_test_quest_rewards_once()
	
	# Test 9: Both quest outcomes produce distinct results
	_test_quest_outcomes_distinct()
	
	# Test 10: Save/load restores all state
	_test_save_load_restores_state()
	
	# Test 11: UI touches don't trigger movement
	_test_ui_input_blocking()
	
	# Test 12: Malformed save data fails safely
	_test_malformed_save_handling()
	
	# Print results
	_print_results()
	
	# Exit with appropriate code
	var failed = _test_results.filter(func(r): return not r.passed).size()
	quit(failed)

func _test_player_movement() -> void:
	print("\n--- Test: Player Movement ---")
	var start_pos = _player.global_position
	_player.move_to(Vector2(300, 300))
	_process_frame()
	_process_frame()
	var moved = _player.global_position.distance_to(start_pos) > 10
	_record("Player movement", moved, "Player should move towards target")

func _test_npc_dialogue() -> void:
	print("\n--- Test: NPC Dialogue ---")
	var npc = _current_scene.get_node("Marcus")
	var dialogue_ui = _current_scene.get_node("DialogueUI")
	
	# Move player near NPC
	_player.global_position = Vector2(600, 400)
	_process_frame()
	
	# Check interaction is possible
	var interactable = npc.get_node("Interactable")
	var can_interact = interactable.can_interact(_player)
	
	# Start dialogue via EventBus
	_event_bus.emit("dialogue_started", "lost_power_cell")
	_process_frame()
	
	var dialogue_active = _game_manager.current_state == _game_manager.GameState.DIALOGUE
	var ui_visible = dialogue_ui.visible
	
	_record("NPC dialogue opens", can_interact and dialogue_active and ui_visible, "Dialogue should open when interacting with NPC")
	
	# Close dialogue
	_dialogue_manager.end_dialogue()
	_process_frame()
	
	var dialogue_closed = _game_manager.current_state == _game_manager.GameState.PLAYING
	var ui_hidden = not dialogue_ui.visible
	
	_record("NPC dialogue closes", dialogue_closed and ui_hidden, "Dialogue should close and return to PLAYING state")

func _test_dialogue_conditions_consequences() -> void:
	print("\n--- Test: Dialogue Conditions & Consequences ---")
	
	# Test STAT_CHECK condition (high intelligence dialogue)
	_game_manager.set_player_stat("intelligence", 7)
	_process_frame()
	
	var started = _dialogue_manager.start_dialogue("high_int")
	var node = _dialogue_manager.get_current_node()
	var has_smart_option = false
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "s_talk_science":
			has_smart_option = true
	
	_record("STAT_CHECK condition works", started and node and has_smart_option, "High INT should unlock smart dialogue option")
	
	_dialogue_manager.end_dialogue()
	_process_frame()
	
	# Test QUEST_FLAG condition
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_game_manager.add_quest_flag("lost_power_cell", "has_cell", true)
	_process_frame()
	
	started = _dialogue_manager.start_dialogue("lost_power_cell")
	node = _dialogue_manager.get_current_node()
	var has_return_option = false
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "q1_give_cell":
			has_return_option = true
	
	_record("QUEST_FLAG condition works", started and has_return_option, "Quest flag should unlock return cell option")
	
	_dialogue_manager.end_dialogue()
	_process_frame()

func _test_quest_activation() -> void:
	print("\n--- Test: Quest Activation ---")
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_process_frame()
	
	var quest_started = _game_manager.get_quest_flag("lost_power_cell", "started", false)
	_record("Quest activation", quest_started, "Quest flag should be set when activated")

func _test_item_pickup() -> void:
	print("\n--- Test: Item Pickup ---")
	var power_cell = _current_scene.get_node("PowerCell")
	var initial_count = _inventory.get_item_count("power_cell")
	
	# Move player to item
	_player.global_position = Vector2(900, 600)
	_process_frame()
	
	# Simulate pickup via interaction
	var interactable = power_cell.get_node("Interactable")
	var can_interact = interactable.can_interact(_player)
	
	if can_interact:
		interactable.interact(_player)
		_process_frame()
	
	var final_count = _inventory.get_item_count("power_cell")
	var picked_up = final_count == initial_count + 1
	
	_record("Item pickup adds exactly one", picked_up and can_interact, "Should add exactly 1 Power Cell to inventory")

func _test_item_respawn_save_load() -> void:
	print("\n--- Test: Item Respawn After Save/Load ---")
	var stimpak = _current_scene.get_node("Stimpak")
	
	# Pick up stimpak
	_player.global_position = Vector2(400, 700)
	_process_frame()
	var interactable = stimpak.get_node("Interactable")
	if interactable.can_interact(_player):
		interactable.interact(_player)
		_process_frame()
	
	var picked_up = stimpak._is_picked_up
	
	# Save game
	_save_system.save_game(5, _game_manager.get_save_data())
	_process_frame()
	
	# Create new scene instance (simulate reload)
	root.remove_child(_current_scene)
	_load_test_scene()
	_player = _current_scene.get_node("Player")
	var new_stimpak = _current_scene.get_node("Stimpak")
	
	# Load game
	var data = _save_system.load_game(5)
	if data:
		_game_manager.load_save_data(data)
		_process_frame()
	
	# Check item is still picked up (not respawned)
	var still_picked_up = new_stimpak._is_picked_up
	
	_record("Collected items don't respawn after save/load", picked_up and still_picked_up, "Picked up items should remain picked up after save/load")

func _test_inventory_stacking_capacity() -> void:
	print("\n--- Test: Inventory Stacking & Capacity ---")
	
	# Test stacking
	var def = _item_database.get_item("stimpak")
	var instance1 = def.create_instance(5)
	var instance2 = def.create_instance(3)
	
	_inventory.add_item(instance1)
	_inventory.add_item(instance2)
	_process_frame()
	
	var stacked_correctly = _inventory.get_item_count("stimpak") == 8
	_record("Item stacking works", stacked_correctly, "Stackable items should combine into single stack")
	
	# Test capacity limit (max_slots = 30)
	_inventory.clear()
	var scrap_def = _item_database.get_item("scrap_metal")
	for i in range(35):
		_inventory.add_item(scrap_def.create_instance(1))
	_process_frame()
	
	var respect_capacity = _inventory.get_used_slots() <= 30
	_record("Inventory respects slot capacity", respect_capacity, "Should not exceed max_slots (30)")

func _test_quest_rewards_once() -> void:
	print("\n--- Test: Quest Rewards Once ---")
	
	# Reset quest state
	_game_manager.quest_flags.erase("lost_power_cell")
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_game_manager.add_quest_flag("lost_power_cell", "has_cell", true)
	_process_frame()
	
	var initial_caps = _game_manager.player_data.caps
	
	# Complete quest - return cell
	_dialogue_manager.start_dialogue("lost_power_cell")
	# Navigate to return cell node
	var node = _dialogue_manager.get_current_node()
	while node and node.node_id != "q1_return_cell":
		# Find and select option that leads to return
		for opt in _dialogue_manager.get_available_options():
			if opt.next_node == "q1_return_cell" or opt.option_id == "q1_accept_quest":
				_dialogue_manager.select_option(opt)
				node = _dialogue_manager.get_current_node()
				break
	
	# Now at q1_return_cell, select give cell
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "q1_give_cell":
			_dialogue_manager.select_option(opt)
			break
	_process_frame()
	
	var caps_after_first = _game_manager.player_data.caps
	var reward_given = caps_after_first > initial_caps
	
	# Try to complete again (should not give reward twice)
	_dialogue_manager.end_dialogue()
	_process_frame()
	_dialogue_manager.start_dialogue("lost_power_cell")
	node = _dialogue_manager.get_current_node()
	while node and node.node_id != "q1_return_cell":
		for opt in _dialogue_manager.get_available_options():
			if opt.next_node == "q1_return_cell":
				_dialogue_manager.select_option(opt)
				node = _dialogue_manager.get_current_node()
				break
	
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "q1_give_cell":
			_dialogue_manager.select_option(opt)
			break
	_process_frame()
	
	var caps_after_second = _game_manager.player_data.caps
	var reward_once = caps_after_second == caps_after_first
	
	_dialogue_manager.end_dialogue()
	_process_frame()
	
	_record("Quest reward granted exactly once", reward_given and reward_once, "Reward should only be given once per completion")

func _test_quest_outcomes_distinct() -> void:
	print("\n--- Test: Distinct Quest Outcomes ---")
	
	# Test "returned" outcome
	_game_manager.quest_flags.erase("lost_power_cell")
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_game_manager.add_quest_flag("lost_power_cell", "has_cell", true)
	_process_frame()
	
	_dialogue_manager.start_dialogue("lost_power_cell")
	var node = _dialogue_manager.get_current_node()
	while node and node.node_id != "q1_return_cell":
		for opt in _dialogue_manager.get_available_options():
			if opt.next_node == "q1_return_cell":
				_dialogue_manager.select_option(opt)
				node = _dialogue_manager.get_current_node()
				break
	
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "q1_give_cell":
			_dialogue_manager.select_option(opt)
			break
	_process_frame()
	
	var returned_flag = _game_manager.get_quest_flag("lost_power_cell", "returned", false)
	var kept_flag = _game_manager.get_quest_flag("lost_power_cell", "kept", false)
	
	_dialogue_manager.end_dialogue()
	_process_frame()
	
	# Test "kept" outcome
	_game_manager.quest_flags.erase("lost_power_cell")
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_game_manager.add_quest_flag("lost_power_cell", "has_cell", true)
	_process_frame()
	
	_dialogue_manager.start_dialogue("lost_power_cell")
	node = _dialogue_manager.get_current_node()
	while node and node.node_id != "q1_return_cell":
		for opt in _dialogue_manager.get_available_options():
			if opt.next_node == "q1_return_cell":
				_dialogue_manager.select_option(opt)
				node = _dialogue_manager.get_current_node()
				break
	
	for opt in _dialogue_manager.get_available_options():
		if opt.option_id == "q1_keep_cell":
			_dialogue_manager.select_option(opt)
			break
	_process_frame()
	
	var kept_flag2 = _game_manager.get_quest_flag("lost_power_cell", "kept", false)
	var returned_flag2 = _game_manager.get_quest_flag("lost_power_cell", "returned", false)
	
	_dialogue_manager.end_dialogue()
	_process_frame()
	
	var outcomes_distinct = returned_flag and not kept_flag and kept_flag2 and not returned_flag2
	_record("Quest outcomes are distinct", outcomes_distinct, "Return vs Keep should produce mutually exclusive flags")

func _test_save_load_restores_state() -> void:
	print("\n--- Test: Save/Load Restores State ---")
	
	# Set up complex state
	_game_manager.player_data.caps = 500
	_game_manager.player_data.hp = 75
	_game_manager.player_data.level = 3
	_game_manager.add_quest_flag("lost_power_cell", "started", true)
	_game_manager.add_quest_flag("lost_power_cell", "completed", true)
	_game_manager.add_quest_flag("lost_power_cell", "returned", true)
	
	# Add items to inventory
	var def = _item_database.get_item("stimpak")
	_inventory.add_item(def.create_instance(3))
	def = _item_database.get_item("rad_away")
	_inventory.add_item(def.create_instance(2))
	_process_frame()
	
	# Save
	_save_system.save_game(6, _game_manager.get_save_data())
	_process_frame()
	
	# Reset state
	_game_manager._load_default_state()
	_inventory.clear()
	_process_frame()
	
	# Load
	var data = _save_system.load_game(6)
	if data:
		_game_manager.load_save_data(data)
		_process_frame()
	
	# Verify restored
	var caps_restored = _game_manager.player_data.caps == 500
	var hp_restored = _game_manager.player_data.hp == 75
	var level_restored = _game_manager.player_data.level == 3
	var quest_restored = _game_manager.get_quest_flag("lost_power_cell", "returned", false)
	var stimpak_restored = _inventory.get_item_count("stimpak") == 3
	var radaway_restored = _inventory.get_item_count("rad_away") == 2
	
	_record("Save/load restores all state", caps_restored and hp_restored and level_restored and quest_restored and stimpak_restored and radaway_restored, "All player data, quest flags, and inventory should be restored")

func _test_ui_input_blocking() -> void:
	print("\n--- Test: UI Input Blocking ---")
	
	# Open inventory UI
	var inventory_ui = _current_scene.get_node("InventoryUI")
	inventory_ui.show()
	_process_frame()
	
	var ui_blocks = _player._is_ui_focused()
	
	# Try to move (should be blocked)
	var start_pos = _player.global_position
	_player.move_to(Vector2(500, 500))
	_process_frame()
	
	var position_unchanged = _player.global_position == start_pos
	
	inventory_ui.hide()
	_process_frame()
	
	_record("UI blocks world input", ui_blocks and position_unchanged, "UI should block movement input when visible")

func _test_malformed_save_handling() -> void:
	print("\n--- Test: Malformed Save Handling ---")
	
	# Create corrupted save file
	var save_dir = "user://saves/"
	DirAccess.make_dir_recursive_absolute(save_dir)
	var file_path = save_dir + "slot_9.save"
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		file.store_string("{ invalid json }")
		file.close()
	
	# Try to load - should not crash
	var data = _save_system.load_game(9)
	var handled_gracefully = data == null
	
	# Clean up
	DirAccess.remove_absolute(file_path)
	_process_frame()
	
	_record("Malformed save handled gracefully", handled_gracefully, "Corrupted save should return null, not crash")

func _record(test_name: String, passed: bool, description: String) -> void:
	_test_results.append({
		"name": test_name,
		"passed": passed,
		"description": description
	})
	var status = "PASS" if passed else "FAIL"
	print("[%s] %s: %s" % [status, test_name, description])

func _print_results() -> void:
	print("\n=== Test Summary ===")
	var passed = _test_results.filter(func(r): return r.passed).size()
	var total = _test_results.size()
	print("Passed: %d/%d" % [passed, total])
	for r in _test_results:
		var status = "✓" if r.passed else "✗"
		print("  %s %s" % [status, r.name])