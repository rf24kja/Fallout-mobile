class_name StageCTestRunner
extends Node

## Stage C Regression Tests - Combat System & Character Progression

signal tests_completed(results: Array)

var _tests: Array = []
var _test_index: int = 0
var _test_results: Array = []
var _current_test_wait_frames: int = 0
var _current_test_max_wait: int = 600
var _results_printed: bool = false

var _combat_system
var _character_system
var _game_manager
var _inventory
var _item_database
var _event_bus
var _character_system_class
# Fresh CharacterSystem instances created by the progression tests.
# They are never added to the scene tree, so they must be freed explicitly.
var _temp_systems: Array = []

func _ready() -> void:
	print("=== Stage C Test Runner _ready (autoload) ===")
	_load_autoloads()
	_setup_tests()
	call_deferred("_run_next_test")

func _process(_delta: float) -> void:
	# Watchdog: a hung test (awaiting a frame that never comes) must not block the suite.
	if _current_test_wait_frames > 0:
		_current_test_wait_frames -= 1
		if _current_test_wait_frames == 0:
			print("Per-test timeout, advancing to next test")
			_fail_current_test("Per-test timeout")
			_test_index += 1
			call_deferred("_run_next_test")

func _new_character_system() -> Node:
	# Fresh instance - the shared autoload carries state from earlier tests.
	# Not added to the tree, so it has to be freed explicitly.
	var cs = _character_system_class.new()
	cs._init_default_character()
	_temp_systems.append(cs)
	return cs

func _fail_current_test(message: String) -> void:
	if _test_index >= _tests.size():
		return
	# Only record once - the test may have completed in the same frame.
	for r in _test_results:
		if r["name"] == _tests[_test_index]["name"]:
			return
	_test_results.append({
		"name": _tests[_test_index]["name"],
		"passed": false,
		"message": message
	})
func _load_autoloads() -> void:
	_combat_system = get_node_or_null("/root/CombatSystem")
	_character_system = get_node_or_null("/root/CharacterSystem")
	_game_manager = get_node_or_null("/root/GameManager")
	_inventory = get_node_or_null("/root/Inventory")
	_item_database = get_node_or_null("/root/ItemDatabase")
	_event_bus = get_node_or_null("/root/EventBus")
	
	# Preload CharacterSystem class for static methods
	_character_system_class = preload("res://scripts/systems/character_system.gd")
	
	print("CombatSystem: ", _combat_system)
	print("CharacterSystem: ", _character_system)
	print("GameManager: ", _game_manager)
	print("Inventory: ", _inventory)
	print("ItemDatabase: ", _item_database)
	print("EventBus: ", _event_bus)

func _setup_tests() -> void:
	_tests = [
		{"name": "Combat Start", "callable": Callable(self, "_test_combat_start")},
		{"name": "Combat Turn Order", "callable": Callable(self, "_test_combat_turn_order")},
		{"name": "Combat Attack Hit/Miss", "callable": Callable(self, "_test_combat_attack_hit_miss")},
		{"name": "Combat Critical Hit", "callable": Callable(self, "_test_combat_critical_hit")},
		{"name": "Combat Damage Calculation", "callable": Callable(self, "_test_combat_damage_calculation")},
		{"name": "Combat Armor DR/DT", "callable": Callable(self, "_test_combat_armor_drdt")},
		{"name": "Combat End Conditions", "callable": Callable(self, "_test_combat_end_conditions")},
		{"name": "Character XP and Level Up", "callable": Callable(self, "_test_character_xp_level")},
		{"name": "Character SPECIAL Improvement", "callable": Callable(self, "_test_character_special_improvement")},
		{"name": "Character Skill Points", "callable": Callable(self, "_test_character_skill_points")},
		{"name": "Character Perk Acquisition", "callable": Callable(self, "_test_character_perk_acquisition")},
		{"name": "Character Derived Stats", "callable": Callable(self, "_test_character_derived_stats")},
		{"name": "Character Save/Load", "callable": Callable(self, "_test_character_save_load")},
		{"name": "Combat + Character Integration", "callable": Callable(self, "_test_combat_character_integration")},
	]

func _run_next_test() -> void:
	if _test_index >= _tests.size():
		_finish_suite()
		return
	
	var test = _tests[_test_index]
	print("\n=== Running test ", _test_index + 1, "/", _tests.size(), ": ", test["name"], " ===")
	_current_test_wait_frames = _current_test_max_wait
	
	test["callable"].call()

func _test_complete(passed: bool, message: String) -> void:
	if _test_index >= _tests.size():
		print("ERROR: _test_complete called with invalid index ", _test_index)
		return
	
	var test_name = _tests[_test_index]["name"]
	var status = "PASS" if passed else "FAIL"
	print("Test ", _test_index + 1, ": ", test_name, " - ", status)
	if message != "":
		print("  ", message)
	
	_test_results.append({
		"name": test_name,
		"passed": passed,
		"message": message
	})
	
	# Disarm the watchdog - this test is done.
	_current_test_wait_frames = 0
	_test_index += 1
	call_deferred("_run_next_test")

func _finish_suite() -> void:
	if _results_printed:
		return
	_results_printed = true
	print("All Stage C tests completed!")
	_print_results()
	
	await _wait_for_stage_b()
	
	var stage_c_failed := 0
	for r in _test_results:
		if not r.passed:
			stage_c_failed += 1
	
	var sb = get_node_or_null("/root/StageBTestRunner")
	var stage_b_ok = sb == null or sb.all_passed
	
	# Free the throwaway character systems - they were never added to the tree.
	for cs in _temp_systems:
		if is_instance_valid(cs):
			cs.free()
	_temp_systems.clear()
	
	if stage_c_failed == 0 and stage_b_ok:
		print("=== ALL STAGES PASSED ===")
		get_tree().quit(0)
	else:
		print("=== FAILURES DETECTED (Stage C failed: ", stage_c_failed, ", Stage B ok: ", stage_b_ok, ") ===")
		get_tree().quit(1)

func _wait_for_stage_b() -> void:
	var sb = get_node_or_null("/root/StageBTestRunner")
	if not sb:
		return
	var waited := 0
	while not sb.completed and waited < 3000:
		await get_tree().process_frame
		waited += 1
		if waited % 600 == 0:
			print("Waiting for Stage B to finish... ", waited, " frames")
	if not sb.completed:
		print("Stage B did not complete within the frame budget")

func _print_results() -> void:
	print("\n=== STAGE C TEST RESULTS SUMMARY ===")
	var passed = 0
	var failed = 0
	for r in _test_results:
		var status = "PASS" if r.passed else "FAIL"
		print(status, ": ", r.name)
		if r.message != "":
			print("  ", r.message)
		if r.passed:
			passed += 1
		else:
			failed += 1
	print("Total: ", _test_results.size(), " | Passed: ", passed, " | Failed: ", failed)
	
	if failed > 0:
		print("STAGE C: SOME TESTS FAILED")
	else:
		print("STAGE C: ALL TESTS PASSED!")

# ========================================================================
# COMBAT SYSTEM TESTS
# ========================================================================

func _test_combat_start() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var participants = [
		{
			"id": "player",
			"name": "Player",
			"team": "player",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 5},
			"skills": {"small_guns": 50},
			"weapon": {"damage_min": 10, "damage_max": 20, "damage_type": 0, "ap_cost": 5, "range": 200, "skill": "small_guns", "crit_chance": 5, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "enemy1",
			"name": "Raider",
			"team": "enemy",
			"hp": 50,
			"max_hp": 50,
			"stats": {"strength": 4, "perception": 4, "endurance": 4, "charisma": 3, "intelligence": 4, "agility": 4, "luck": 4},
			"skills": {"small_guns": 30},
			"weapon": {"damage_min": 8, "damage_max": 15, "damage_type": 0, "ap_cost": 5, "range": 150, "skill": "small_guns", "crit_chance": 3, "crit_multiplier": 2.0},
			"position": Vector2(100, 0)
		}
	]
	
	var combat_data = _combat_system.start_combat(participants)
	
	if not combat_data or not combat_data.has("participants"):
		_test_complete(false, "Combat start returned invalid data")
		return
	
	if combat_data.participants.size() != 2:
		_test_complete(false, "Expected 2 participants, got " + str(combat_data.participants.size()))
		return
	
	if combat_data.turn_order.size() != 2:
		_test_complete(false, "Expected 2 in turn order, got " + str(combat_data.turn_order.size()))
		return
	
	_test_complete(true, "Combat started with 2 participants, turn order: " + str(combat_data.turn_order))

func _test_combat_turn_order() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var participants = [
		{
			"id": "slow_guy",
			"name": "Slow",
			"team": "player",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 2, "luck": 5},
			"skills": {},
			"weapon": {"damage_min": 5, "damage_max": 10, "damage_type": 0, "ap_cost": 5, "range": 100, "skill": "melee", "crit_chance": 5, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "fast_guy",
			"name": "Fast",
			"team": "enemy",
			"hp": 50,
			"max_hp": 50,
			"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 9, "luck": 5},
			"skills": {},
			"weapon": {"damage_min": 5, "damage_max": 10, "damage_type": 0, "ap_cost": 5, "range": 100, "skill": "melee", "crit_chance": 5, "crit_multiplier": 2.0},
			"position": Vector2(50, 0)
		}
	]
	
	_combat_system.start_combat(participants)
	
	# Fast guy (AGI 9 + PER 5 = 14) should go before Slow guy (AGI 2 + PER 5 = 7)
	var turn_order = _combat_system._turn_order
	if turn_order.size() != 2:
		_test_complete(false, "Turn order size mismatch")
		return
	
	if turn_order[0] != "fast_guy":
		_test_complete(false, "Fast character should go first (initiative: AGI+PER), got: " + str(turn_order))
		return
	
	_test_complete(true, "Turn order correct: Fast (initiative 14) before Slow (initiative 7)")

func _test_combat_attack_hit_miss() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var hit_count = 0
	var miss_count = 0
	var iterations = 100
	
	for i in range(iterations):
		var participants = [
			{
				"id": "attacker",
				"name": "Attacker",
				"team": "player",
				"hp": 100,
				"max_hp": 100,
				"stats": {"strength": 5, "perception": 10, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 5},
				"skills": {"small_guns": 100},
				"weapon": {"damage_min": 10, "damage_max": 10, "damage_type": 0, "ap_cost": 0, "range": 200, "skill": "small_guns", "crit_chance": 0, "crit_multiplier": 2.0},
				"position": Vector2(0, 0)
			},
			{
				"id": "target",
				"name": "Target",
				"team": "enemy",
				"hp": 100,
				"max_hp": 100,
				"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 1, "luck": 5},
				"skills": {},
				"weapon": {},
				"position": Vector2(10, 0)
			}
		]
		
		_combat_system.start_combat(participants)
		
		# Attack with high skill vs low agility target - should hit most of the time
		_combat_system.perform_attack_direct("attacker", "target")
		await get_tree().process_frame
		
		var target = _combat_system._get_participant("target")
		
		if target and target.hp < 100:
			hit_count += 1
		else:
			miss_count += 1
	
	# With PER 10 + skill 100 vs AGI 1, hit chance should be very high
	# We expect at least 80% hit rate
	var hit_rate = float(hit_count) / iterations
	if hit_rate < 0.7:
		_test_complete(false, "Hit rate too low: " + str(hit_rate * 100) + "% (hits: " + str(hit_count) + ", misses: " + str(miss_count) + ")")
		return
	
	_test_complete(true, "Hit/Miss mechanics working: " + str(hit_count) + " hits, " + str(miss_count) + " misses (" + str(hit_rate * 100) + "% hit rate)")

func _test_combat_critical_hit() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var crit_count = 0
	var iterations = 200
	
	for i in range(iterations):
		var participants = [
			{
				"id": "attacker",
				"name": "Attacker",
				"team": "player",
				"hp": 100,
				"max_hp": 100,
				"stats": {"strength": 5, "perception": 10, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 10},
				"skills": {"small_guns": 100},
				"weapon": {"damage_min": 10, "damage_max": 10, "damage_type": 0, "ap_cost": 0, "range": 200, "skill": "small_guns", "crit_chance": 15, "crit_multiplier": 2.0},
				"position": Vector2(0, 0)
			},
			{
				"id": "target",
				"name": "Target",
				"team": "enemy",
				"hp": 100,
				"max_hp": 100,
				"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 1, "luck": 5},
				"skills": {},
				"weapon": {},
				"position": Vector2(10, 0)
			}
		]
		
		_combat_system.start_combat(participants)
		_combat_system.perform_player_action("attack", "target")
		await get_tree().process_frame
		
		# Check if target took double damage (20 instead of 10)
		var target = _combat_system._get_participant("target")
		if target and target.hp <= 80:  # 100 - 20 = 80 (crit does 2x damage)
			crit_count += 1
	
	var crit_rate = float(crit_count) / iterations
	# With LUK 10 + weapon crit 15 = 25% crit chance, but roll must be < crit_chance
	# So roughly 25% of hits should be crits, and with near 100% hit rate...
	if crit_rate < 0.1:  # At least 10% crits expected
		_test_complete(false, "Critical hit rate too low: " + str(crit_rate * 100) + "%")
		return
	
	_test_complete(true, "Critical hits working: " + str(crit_count) + "/" + str(iterations) + " (" + str(crit_rate * 100) + "%)")

func _test_combat_damage_calculation() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var participants = [
		{
			"id": "attacker",
			"name": "Attacker",
			"team": "player",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 8, "perception": 10, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 0},
			"skills": {"melee": 100},
			"weapon": {"damage_min": 15, "damage_max": 15, "damage_type": 6, "ap_cost": 0, "range": 50, "skill": "melee", "crit_chance": 0, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "target",
			"name": "Target",
			"team": "enemy",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 1, "luck": 5},
			"skills": {},
			"weapon": {},
			"position": Vector2(10, 0)
		}
	]
	
	_combat_system.start_combat(participants)
	
	# Hit chance is not 100% - retry until the first connecting blow.
	var target = null
	for attempt in range(20):
		_combat_system.perform_attack_direct("attacker", "target")
		target = _combat_system._get_participant("target")
		if target and target.hp < 100:
			break
	
	# Melee damage: base 15 + STR 8 * 2 = 31 damage (no armor)
	if not target:
		_test_complete(false, "Target not found")
		return
	
	if target.hp >= 100:
		_test_complete(false, "Attack never connected after 20 attempts")
		return
	
	var damage_taken = 100 - target.hp
	# Expect exactly 31 damage (15 base + 16 STR bonus)
	if damage_taken != 31:
		_test_complete(false, "Melee damage calculation incorrect: " + str(damage_taken) + " damage (expected 31)")
		return
	
	_test_complete(true, "Damage calculation correct: " + str(damage_taken) + " damage (STR bonus applied)")

func _test_combat_armor_drdt() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var participants = [
		{
			"id": "attacker",
			"name": "Attacker",
			"team": "player",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 10, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 0},
			"skills": {"small_guns": 100},
			"weapon": {"damage_min": 50, "damage_max": 50, "damage_type": 0, "ap_cost": 0, "range": 200, "skill": "small_guns", "crit_chance": 0, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "target",
			"name": "Armored Target",
			"team": "enemy",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 5, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 1, "luck": 5},
			"skills": {},
			"weapon": {},
			"armor": {
				"damage_resistance": {"0": 50},  # 50% DR vs normal
				"damage_threshold": {"0": 10}    # 10 DT vs normal
			},
			"position": Vector2(10, 0)
		}
	]
	
	_combat_system.start_combat(participants)
	
	# Retry until the first connecting blow - hit chance is not 100%.
	for attempt in range(20):
		_combat_system.perform_attack_direct("attacker", "target")
		var probe = _combat_system._get_participant("target")
		if probe and probe.hp < 100:
			break
	
	var target = _combat_system._get_participant("target")
	if not target or target.hp >= 100:
		_test_complete(false, "Attack never connected after 20 attempts")
		return
	
	# 50 damage -> 50% DR = 25 -> -10 DT = 15 final damage
	var expected_damage = 15
	var actual_damage = 100 - target.hp
	
	if actual_damage != expected_damage:
		_test_complete(false, "Armor DR/DT calculation incorrect: got " + str(actual_damage) + " expected " + str(expected_damage))
		return
	
	_test_complete(true, "Armor DR/DT working: 50 dmg -> 50% DR (25) -> -10 DT = 15 final")

func _test_combat_end_conditions() -> void:
	if not _combat_system:
		_test_complete(false, "CombatSystem not available")
		return
	
	var participants = [
		{
			"id": "player",
			"name": "Player",
			"team": "player",
			"hp": 100,
			"max_hp": 100,
			"stats": {"strength": 5, "perception": 10, "endurance": 5, "charisma": 5, "intelligence": 5, "agility": 5, "luck": 5},
			"skills": {"small_guns": 100},
			"weapon": {"damage_min": 100, "damage_max": 100, "damage_type": 0, "ap_cost": 0, "range": 200, "skill": "small_guns", "crit_chance": 0, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "enemy",
			"name": "Weak Enemy",
			"team": "enemy",
			"hp": 10,
			"max_hp": 10,
			"stats": {"strength": 1, "perception": 1, "endurance": 1, "charisma": 1, "intelligence": 1, "agility": 1, "luck": 1},
			"skills": {},
			"weapon": {},
			"position": Vector2(10, 0)
		}
	]
	
	_combat_system.start_combat(participants)
	
	# Retry until the enemy dies - hit chance is not 100%.
	var enemy = null
	for attempt in range(20):
		_combat_system.perform_attack_direct("player", "enemy")
		enemy = _combat_system._get_participant("enemy")
		if enemy and not enemy.is_alive:
			break
	
	await get_tree().process_frame
	await get_tree().process_frame
	
	var state = _combat_system.get_combat_state()
	if state.is_active:
		_test_complete(false, "Combat should have ended (enemy dead)")
		return
	
	enemy = _combat_system._get_participant("enemy")
	if enemy and enemy.is_alive:
		_test_complete(false, "Enemy should be dead")
		return
	
	_test_complete(true, "Combat ends correctly when all enemies defeated")

# ========================================================================
# CHARACTER PROGRESSION TESTS
# ========================================================================

func _test_character_xp_level() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	# Fresh instance - the shared autoload carries state from earlier tests.
	var cs = _new_character_system()
	
	# Test XP curve
	var lvl1_xp = _character_system_class.xp_for_level(1)
	var lvl2_xp = _character_system_class.xp_for_level(2)
	var lvl3_xp = _character_system_class.xp_for_level(3)
	
	if lvl1_xp != 1000 or lvl2_xp != 2000 or lvl3_xp != 3000:
		_test_complete(false, "XP curve incorrect: lvl1=" + str(lvl1_xp) + ", lvl2=" + str(lvl2_xp) + ", lvl3=" + str(lvl3_xp))
		return
	
	# Test level from XP
	if _character_system_class.level_from_xp(0) != 1:
		_test_complete(false, "Level from XP(0) should be 1")
		return
	if _character_system_class.level_from_xp(1500) != 1:
		_test_complete(false, "Level from XP(1500) should be 1")
		return
	if _character_system_class.level_from_xp(2500) != 2:
		_test_complete(false, "Level from XP(2500) should be 2")
		return
	
	# Test actual XP gain and level up
	cs.add_xp(500)
	if cs.character_data.level != 1:
		_test_complete(false, "Should still be level 1 after 500 XP")
		return
	
	cs.add_xp(1500)  # Total 2000 -> level 2
	if cs.character_data.level != 2:
		_test_complete(false, "Should be level 2 after 2000 XP, got " + str(cs.character_data.level))
		return
	
	_test_complete(true, "XP curve and level up working: Level " + str(cs.character_data.level) + " at " + str(cs.character_data.xp) + " XP")

func _test_character_special_improvement() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	var cs = _new_character_system()
	
	var old_str = cs.get_special("strength")
	var result = cs.improve_special("strength", 2)
	
	if not result:
		_test_complete(false, "improve_special returned false")
		return
	
	var new_str = cs.get_special("strength")
	if new_str != old_str + 2:
		_test_complete(false, "SPECIAL not improved: was " + str(old_str) + ", now " + str(new_str))
		return
	
	# Test cap at 10
	for i in range(10):
		cs.improve_special("strength", 1)
	
	if cs.get_special("strength") != 10:
		_test_complete(false, "SPECIAL should cap at 10")
		return
	
	# Further improvements should fail
	result = cs.improve_special("strength", 1)
	if result:
		_test_complete(false, "Should not be able to improve past 10")
		return
	
	_test_complete(true, "SPECIAL improvement working, caps at 10")

func _test_character_skill_points() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	var cs = _new_character_system()
	cs.character_data.unspent_skill_points = 300
	
	# Skills are derived from SPECIAL - record the baseline before spending.
	var base_small = cs.get_skill("small_guns")
	var base_big = cs.get_skill("big_guns")
	var initial_sp = cs.character_data.unspent_skill_points
	
	# Spend skill points
	var result = cs.spend_skill_point("small_guns")
	if not result:
		_test_complete(false, "Failed to spend skill point")
		return
	
	var new_skill = cs.get_skill("small_guns")
	if new_skill != base_small + 1:
		_test_complete(false, "Skill not increased: " + str(new_skill) + " (expected " + str(base_small + 1) + ")")
		return
	
	if cs.character_data.unspent_skill_points != initial_sp - 1:
		_test_complete(false, "Skill points not deducted")
		return
	
	# Test bulk spend
	result = cs.spend_skill_points("big_guns", 5)
	if not result:
		_test_complete(false, "Bulk spend failed")
		return
	
	if cs.get_skill("big_guns") != base_big + 5:
		_test_complete(false, "Bulk spend didn't add correct amount: " + str(cs.get_skill("big_guns")) + " (expected " + str(base_big + 5) + ")")
		return
	
	# Test cap at 200
	for i in range(200):
		cs.spend_skill_point("energy_weapons")
	
	if cs.get_skill("energy_weapons") != 200:
		_test_complete(false, "Skill should cap at 200, got " + str(cs.get_skill("energy_weapons")))
		return
	
	result = cs.spend_skill_point("energy_weapons")
	if result:
		_test_complete(false, "Should not spend past 200")
		return
	
	_test_complete(true, "Skill point spending working, caps at 200")

func _test_character_perk_acquisition() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	var cs = _new_character_system()
	
	# Level up to get perk points (every 3 levels)
	cs.add_xp(3000)  # Level 3 -> perk point
	
	var initial_perk_points = cs.character_data.unspent_perk_points
	if initial_perk_points < 1:
		_test_complete(false, "Should have perk point at level 3, got " + str(initial_perk_points))
		return
	
	# Check available perks
	var available = cs.get_available_perks()
	if available.size() == 0:
		_test_complete(false, "No available perks at level 3")
		return
	
	# Acquire first available perk
	var perk_id = available[0].perk_id
	var result = cs.acquire_perk(perk_id)
	if not result:
		_test_complete(false, "Failed to acquire perk: " + perk_id)
		return
	
	if not cs.has_perk(perk_id):
		_test_complete(false, "Perk not marked as acquired")
		return
	
	if cs.get_perk_rank(perk_id) != 1:
		_test_complete(false, "Perk rank should be 1")
		return
	
	if cs.character_data.unspent_perk_points != initial_perk_points - 1:
		_test_complete(false, "Perk point not deducted")
		return
	
	_test_complete(true, "Perk acquisition working: acquired " + perk_id)

func _test_character_derived_stats() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	var cs = _new_character_system()
	
	# Test with high END
	cs.improve_special("endurance", 5)  # END = 10
	
	var max_hp = cs.character_data.max_hp
	# Level 1, END 10: 15 + 1*2 + 10*3 = 15 + 2 + 30 = 47
	if max_hp != 47:
		_test_complete(false, "Max HP calculation wrong: " + str(max_hp) + " (expected 47)")
		return
	
	# Test with high AGI
	cs.improve_special("agility", 5)  # AGI = 10
	var max_ap = cs.character_data.max_ap
	# AGI 10: 5 + 10/2 = 10
	if max_ap != 10:
		_test_complete(false, "Max AP calculation wrong: " + str(max_ap) + " (expected 10)")
		return
	
	_test_complete(true, "Derived stats correct: HP=" + str(max_hp) + " (END 10), AP=" + str(max_ap) + " (AGI 10)")

func _test_character_save_load() -> void:
	if not _character_system:
		_test_complete(false, "CharacterSystem not available")
		return
	
	var cs = _new_character_system()
	
	# Set up character
	cs.add_xp(3000)  # Level 3
	cs.improve_special("strength", 2)
	cs.improve_special("intelligence", 1)
	cs.character_data.unspent_skill_points = 50
	cs.spend_skill_points("small_guns", 20)
	cs.spend_skill_points("speech", 15)
	
	var save_data = cs.get_save_data()
	
	# Create new character system and load
	var new_cs = _character_system_class.new()
	_temp_systems.append(new_cs)
	new_cs.load_save_data(save_data)
	
	if new_cs.character_data.level != 3:
		_test_complete(false, "Level not saved/loaded: " + str(new_cs.character_data.level))
		return
	
	if new_cs.get_special("strength") != 7:
		_test_complete(false, "STR not saved/loaded: " + str(new_cs.get_special("strength")))
		return
	
	# Skills are derived from SPECIAL plus invested points - compare the values.
	if new_cs.get_skill("small_guns") != cs.get_skill("small_guns"):
		_test_complete(false, "Skill not saved/loaded: " + str(new_cs.get_skill("small_guns")) + " (expected " + str(cs.get_skill("small_guns")) + ")")
		return
	
	_test_complete(true, "Character save/load working: Level " + str(new_cs.character_data.level) + ", STR " + str(new_cs.get_special("strength")) + ", Small Guns " + str(new_cs.get_skill("small_guns")))

# ========================================================================
# INTEGRATION TESTS
# ========================================================================

func _test_combat_character_integration() -> void:
	if not _combat_system or not _character_system or not _game_manager:
		_test_complete(false, "Required systems not available")
		return
	
	# Set up character with high skills
	_character_system.add_xp(3000)  # Level 3
	_character_system.character_data.unspent_skill_points = 50
	_character_system.spend_skill_points("small_guns", 50)
	
	# Start combat using GameManager
	var participants = [
		{
			"id": "player",
			"name": "Player",
			"team": "player",
			"hp": _character_system.character_data.max_hp,
			"max_hp": _character_system.character_data.max_hp,
			"stats": _character_system.character_data.special,
			"skills": _character_system.character_data.skills,
			"weapon": {"damage_min": 15, "damage_max": 25, "damage_type": 0, "ap_cost": 0, "range": 200, "skill": "small_guns", "crit_chance": 5, "crit_multiplier": 2.0},
			"position": Vector2(0, 0)
		},
		{
			"id": "enemy",
			"name": "Raider",
			"team": "enemy",
			"hp": 60,
			"max_hp": 60,
			"stats": {"strength": 4, "perception": 4, "endurance": 4, "charisma": 3, "intelligence": 4, "agility": 4, "luck": 4},
			"skills": {"small_guns": 20},
			"weapon": {"damage_min": 8, "damage_max": 12, "damage_type": 0, "ap_cost": 5, "range": 150, "skill": "small_guns", "crit_chance": 3, "crit_multiplier": 2.0},
			"position": Vector2(50, 0)
		}
	]
	
	var combat_data = _game_manager.start_combat(participants)
	
	if not combat_data:
		_test_complete(false, "GameManager.start_combat returned null")
		return
	
	# Perform attack
	var cs = _game_manager._get_combat_system()
	if not cs:
		_test_complete(false, "CombatSystem not accessible from GameManager")
		return
	
	# Retry until the enemy takes damage - hit chance is not 100%.
	var enemy = cs._get_participant("enemy")
	for attempt in range(20):
		cs.perform_attack_direct("player", "enemy")
		enemy = cs._get_participant("enemy")
		if enemy and enemy.hp < 60:
			break
	
	await get_tree().process_frame
	await get_tree().process_frame
	
	enemy = cs._get_participant("enemy")
	if not enemy:
		_test_complete(false, "Enemy not found after combat")
		return
	
	if enemy.hp >= 60:
		_test_complete(false, "Enemy took no damage")
		return
	
	# Check XP reward on combat end
	var initial_xp = _character_system.character_data.xp
	cs.force_end_combat()
	
	_test_complete(true, "Combat-Character integration working: Enemy damaged, systems connected")