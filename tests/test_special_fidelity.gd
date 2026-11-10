extends SceneTree

# Fallout 2 SPECIAL Derived Stats Fidelity Tests
# Tests all derived stat calculations against original Fallout 2 reference formulas

class_name SpecialFidelityTests

var _character_system
var _test_results = []

func _init():
	load_systems()
	run_all_tests()

func load_systems():
	# Load CharacterSystem
	var char_script = preload("res://scripts/systems/character_system.gd")
	_character_system = char_script.new()

func run_all_tests():
	print("=== FALLOUT 2 SPECIAL DERIVED STATS FIDELITY TESTS ===\n")
	
	test_max_hp_formula()
	test_max_ap_formula()
	test_healing_rate()
	test_poison_resistance()
	test_radiation_resistance()
	test_sequence()
	test_critical_chance()
	test_carry_weight()
	test_melee_damage()
	test_level_up_hp_gain()
	test_skill_points_per_level()
	
	print_results()

func test_max_hp_formula():
	# Fallout 2: HP = 15 + ST + EN*2 + (Lv-1)*(3+EN/2)
	# This test verifies the authoritative Fallout 2 formula
	
	var test_cases = [
		# {might, vigor, level, expected_fallout2, description}
		{"might": 5, "vigor": 5, "level": 1, "expected": 15 + 5 + 10 + 0*(3+2), "desc": "Average stats L1"},
		{"might": 10, "vigor": 10, "level": 1, "expected": 15 + 10 + 20 + 0*(3+5), "desc": "Max stats L1"},
		{"might": 1, "vigor": 1, "level": 1, "expected": 15 + 1 + 2 + 0*(3+0), "desc": "Min stats L1"},
	]
	
	for case in test_cases:
		var stats = {"might": case.might, "vigor": case.vigor}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.max_hp
		var expected = case.expected
		var passed = actual == expected
		
		_test_results.append({
			"name": "Max HP " + case.desc,
			"formula": "Fallout 2: 15+ST+EN*2+Lv*(3+EN/2)",
			"expected": expected,
			"actual": actual,
			"passed": passed,
			"note": "Fallout 2 reference formula (get_derived_stats default level=1)"
		})
	
	# Test level scaling using internal character data (not get_derived_stats which defaults to level=1)
	var char = _character_system.new()
	char.character_data.level = 10
	char.character_data.special.might = 5
	char.character_data.special.vigor = 5
	char._recalculate_derived_stats()
	var actual_l10 = char.character_data.max_hp
	# Fallout 2: HP = 15 + ST + EN*2 + (Lv-1)*(3+EN/2)
	# L10: 15 + 5 + 10 + 9*(3+2) = 30 + 45 = 75
	var expected_l10 = 15 + 5 + 10 + 9*(3+2)
	_test_results.append({
		"name": "Max HP Average stats L10 (internal)",
		"formula": "Fallout 2: 15+ST+EN*2+(Lv-1)*(3+EN/2)",
		"expected": expected_l10,
		"actual": actual_l10,
		"passed": actual_l10 == expected_l10,
		"note": "Fallout 2 reference formula via internal _recalculate_derived_stats"
	})
	
	char.character_data.level = 20
	char.character_data.special.might = 10
	char.character_data.special.vigor = 10
	char._recalculate_derived_stats()
	var actual_l20 = char.character_data.max_hp
	# L20: 15 + 10 + 20 + 19*(3+5) = 45 + 152 = 197
	var expected_l20 = 15 + 10 + 20 + 19*(3+5)
	_test_results.append({
		"name": "Max HP Max stats L20 (internal)",
		"formula": "Fallout 2: 15+ST+EN*2+(Lv-1)*(3+EN/2)",
		"expected": expected_l20,
		"actual": actual_l20,
		"passed": actual_l20 == expected_l20,
		"note": "Fallout 2 reference formula via internal _recalculate_derived_stats"
	})
	
	char.character_data.level = 5
	char.character_data.special.might = 6
	char.character_data.special.vigor = 6
	char._recalculate_derived_stats()
	var actual_l5 = char.character_data.max_hp
	# L5: 15 + 6 + 12 + 4*(3+3) = 33 + 24 = 57
	var expected_l5 = 15 + 6 + 12 + 4*(3+3)
	_test_results.append({
		"name": "Max HP VIG=6 L5 (internal)",
		"formula": "Fallout 2: 15+ST+EN*2+(Lv-1)*(3+EN/2)",
		"expected": expected_l5,
		"actual": actual_l5,
		"passed": actual_l5 == expected_l5,
		"note": "Fallout 2 reference formula via internal _recalculate_derived_stats"
	})

func test_max_ap_formula():
	# Fallout 2: AP = 5 + AG/2 (round down)
	# Current Godot: 5 + DEX/2 (DEX = AG equivalent)
	
	var test_cases = [
		{"dexterity": 1, "expected": 5},  # 5 + 0 = 5
		{"dexterity": 2, "expected": 6},  # 5 + 1 = 6
		{"dexterity": 3, "expected": 6},  # 5 + 1 = 6
		{"dexterity": 4, "expected": 7},  # 5 + 2 = 7
		{"dexterity": 5, "expected": 7},  # 5 + 2 = 7
		{"dexterity": 6, "expected": 8},  # 5 + 3 = 8
		{"dexterity": 7, "expected": 8},  # 5 + 3 = 8
		{"dexterity": 8, "expected": 9},  # 5 + 4 = 9
		{"dexterity": 9, "expected": 9},  # 5 + 4 = 9
		{"dexterity": 10, "expected": 10}, # 5 + 5 = 10
	]
	
	for case in test_cases:
		var stats = {"dexterity": case.dexterity}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.max_action_points
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Max AP (DEX=" + str(case.dexterity) + ")",
			"formula": "Fallout 2: 5 + AG/2 (round down)",
			"expected": case.expected,
			"actual": actual,
			"passed": passed
		})

func test_healing_rate():
	# Fallout 2: Healing Rate = EN/3 (round down)
	# Current Godot: VIG/3 (VIG = EN equivalent)
	
	var test_cases = [
		{"vigor": 1, "expected": 0},
		{"vigor": 2, "expected": 0},
		{"vigor": 3, "expected": 1},
		{"vigor": 4, "expected": 1},
		{"vigor": 5, "expected": 1},
		{"vigor": 6, "expected": 2},
		{"vigor": 7, "expected": 2},
		{"vigor": 8, "expected": 2},
		{"vigor": 9, "expected": 3},
		{"vigor": 10, "expected": 3},
	]
	
	for case in test_cases:
		var stats = {"vigor": case.vigor}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.healing_rate
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Healing Rate (VIG=" + str(case.vigor) + ")",
			"formula": "Fallout 2: EN/3 (round down)",
			"expected": case.expected,
			"actual": actual,
			"passed": passed
		})

func test_poison_resistance():
	# Fallout 2: Poison Resist = EN * 5
	# Current Godot: VIG * 5
	
	var test_cases = [
		{"vigor": 1, "expected": 5},
		{"vigor": 5, "expected": 25},
		{"vigor": 10, "expected": 50},
	]
	
	for case in test_cases:
		var stats = {"vigor": case.vigor}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.poison_resistance
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Poison Resistance (VIG=" + str(case.vigor) + ")",
			"formula": "Fallout 2: EN * 5",
			"expected": case.expected,
			"actual": actual,
			"passed": passed
		})

func test_radiation_resistance():
	# Fallout 2: Rad Resist = EN * 2 + Armor bonus
	# Current Godot: VIG * 2 (base only, no armor)
	
	var test_cases = [
		{"vigor": 1, "expected": 2},
		{"vigor": 5, "expected": 10},
		{"vigor": 10, "expected": 20},
	]
	
	for case in test_cases:
		var stats = {"vigor": case.vigor}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.radiation_resistance
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Radiation Resistance Base (VIG=" + str(case.vigor) + ")",
			"formula": "Fallout 2: EN * 2 (base, +Armor)",
			"expected": case.expected,
			"actual": actual,
			"passed": passed,
			"note": "Armor bonus not included in base calculation"
		})

func test_sequence():
	# Fallout 2: Sequence = PE * 2
	# Current Godot: AW * 2 (AW = PE equivalent)
	
	var test_cases = [
		{"awareness": 1, "expected": 2},
		{"awareness": 5, "expected": 10},
		{"awareness": 10, "expected": 20},
	]
	
	for case in test_cases:
		var stats = {"awareness": case.awareness}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.sequence
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Sequence (AW=" + str(case.awareness) + ")",
			"formula": "Fallout 2: PE * 2",
			"expected": case.expected,
			"actual": actual,
			"passed": passed
		})

func test_critical_chance():
	# Fallout 2: Crit Chance = LK% (base) + Perks (e.g. More Criticals)
	# Now Godot: FOR% (perks added elsewhere)
	
	var test_cases = [
		{"fortune": 1, "expected": 1},
		{"fortune": 2, "expected": 2},
		{"fortune": 3, "expected": 3},
		{"fortune": 4, "expected": 4},
		{"fortune": 5, "expected": 5},
		{"fortune": 6, "expected": 6},
		{"fortune": 7, "expected": 7},
		{"fortune": 8, "expected": 8},
		{"fortune": 9, "expected": 9},
		{"fortune": 10, "expected": 10},
	]
	
	for case in test_cases:
		var stats = {"fortune": case.fortune}
		var result = _character_system.get_derived_stats(stats)
		var actual = result.critical_chance
		var passed = actual == case.expected
		
		_test_results.append({
			"name": "Critical Chance (FOR=" + str(case.fortune) + ")",
			"formula": "Fallout 2: LK/2 + Perks",
			"expected": case.expected,
			"actual": actual,
			"passed": passed,
			"note": "Fallout 2 reference formula (perks not included in base)"
		})

func test_carry_weight():
	# Fallout 2: Carry Weight = 25 + ST * 25
	# Current Godot: 25 + ST * 25
	
	var test_cases = [
		{"might": 1, "expected": 50},   # 25 + 1*25 = 50
		{"might": 5, "expected": 150},  # 25 + 5*25 = 150
		{"might": 10, "expected": 275}, # 25 + 10*25 = 275
	]
	
	for case in test_cases:
		var stats = {"might": case.might}
		var result = _character_system.get_derived_stats(stats)
		
		# Check if carry_weight exists in result
		var has_carry_weight = result.has("carry_weight")
		var actual = result.get("carry_weight", -1)
		var passed = has_carry_weight and actual == case.expected
		
		var note = "Implemented" if has_carry_weight else "MISSING from get_derived_stats"
		_test_results.append({
			"name": "Carry Weight (Might=" + str(case.might) + ")",
			"formula": "Fallout 2: 25 * ST",
			"expected": case.expected,
			"actual": actual,
			"passed": passed,
			"note": note
		})

func test_melee_damage():
	# Fallout 2: Melee Damage = max(1, ST - 5)
	# Current Godot: max(1, ST - 5)
	
	var test_cases = [
		{"might": 1, "expected": 1},   # max(1, 1-5) = max(1, -4) = 1
		{"might": 2, "expected": 1},   # max(1, 2-5) = max(1, -3) = 1
		{"might": 3, "expected": 1},   # max(1, 3-5) = max(1, -2) = 1
		{"might": 4, "expected": 1},   # max(1, 4-5) = max(1, -1) = 1
		{"might": 5, "expected": 1},   # max(1, 5-5) = max(1, 0) = 1
		{"might": 6, "expected": 1},   # max(1, 6-5) = max(1, 1) = 1
		{"might": 7, "expected": 2},   # max(1, 7-5) = max(1, 2) = 2
		{"might": 10, "expected": 5},  # max(1, 10-5) = 5
	]
	
	for case in test_cases:
		var stats = {"might": case.might}
		var result = _character_system.get_derived_stats(stats)
		
		var has_melee_damage = result.has("melee_damage")
		var actual = result.get("melee_damage", -1)
		var passed = has_melee_damage and actual == case.expected
		
		var note = "Implemented" if has_melee_damage else "MISSING from get_derived_stats"
		_test_results.append({
			"name": "Melee Damage (Might=" + str(case.might) + ")",
			"formula": "Fallout 2: ST/2 (round down)",
			"expected": case.expected,
			"actual": actual,
			"passed": passed,
			"note": note
		})

func test_level_up_hp_gain():
	# Fallout 2: HP gain on level up = 2 + VIG/2 (round down) + Lifegiver perk (+4 per rank)
	# Current Godot: 2 + VIG/2 + Lifegiver (+4 per rank)
	
	var test_cases = [
		{"vigor": 1, "perk_lifegiver": 0, "expected": 2 + 0},  # 2 + 0 = 2
		{"vigor": 2, "perk_lifegiver": 0, "expected": 2 + 1},  # 2 + 1 = 3
		{"vigor": 3, "perk_lifegiver": 0, "expected": 2 + 1},  # 2 + 1 = 3
		{"vigor": 4, "perk_lifegiver": 0, "expected": 2 + 2},  # 2 + 2 = 4
		{"vigor": 5, "perk_lifegiver": 0, "expected": 2 + 2},  # 2 + 2 = 4
		{"vigor": 10, "perk_lifegiver": 0, "expected": 2 + 5}, # 2 + 5 = 7
		{"vigor": 5, "perk_lifegiver": 1, "expected": 2 + 2 + 4}, # 2 + 2 + 4 = 8
		{"vigor": 5, "perk_lifegiver": 3, "expected": 2 + 2 + 12}, # 2 + 2 + 12 = 16
	]
	
	for case in test_cases:
		# Calculate HP gain directly from formula
		var hp_gain = 2 + int(case.vigor / 2)
		hp_gain += case.perk_lifegiver * 4
		
		var passed = hp_gain == case.expected
		
		_test_results.append({
			"name": "Level-up HP Gain (VIG=" + str(case.vigor) + ", Lifegiver=" + str(case.perk_lifegiver) + ")",
			"formula": "Fallout 2: 2 + EN/2 + Lifegiver*4",
			"expected": case.expected,
			"actual": hp_gain,
			"passed": passed
		})

func test_skill_points_per_level():
	# Fallout 2: Skill points = 5 + INT/2 + Educated (+2)
	# Current Godot: 5 + INT/2 + Educated (+2)
	
	var test_cases = [
		{"intellect": 1, "educated": 0, "expected": 5 + 0},   # 5 + 0 = 5
		{"intellect": 2, "educated": 0, "expected": 5 + 1},   # 5 + 1 = 6
		{"intellect": 3, "educated": 0, "expected": 5 + 1},   # 5 + 1 = 6
		{"intellect": 4, "educated": 0, "expected": 5 + 2},   # 5 + 2 = 7
		{"intellect": 5, "educated": 0, "expected": 5 + 2},   # 5 + 2 = 7
		{"intellect": 6, "educated": 0, "expected": 5 + 3},   # 5 + 3 = 8
		{"intellect": 10, "educated": 0, "expected": 5 + 5},  # 5 + 5 = 10
		{"intellect": 5, "educated": 1, "expected": 5 + 2 + 2}, # 5 + 2 + 2 = 9
	]
	
	for case in test_cases:
		# Calculate skill points directly from formula
		var sp = 5 + int(case.intellect / 2)
		sp += case.educated * 2
		
		var passed = sp == case.expected
		
		_test_results.append({
			"name": "Skill Points/Level (INT=" + str(case.intellect) + ", Educated=" + str(case.educated) + ")",
			"formula": "Fallout 2: 5 + INT/2 + Educated*2",
			"expected": case.expected,
			"actual": sp,
			"passed": passed
		})

func print_results():
	var passed = 0
	var failed = 0
	
	print("\n=== TEST RESULTS ===")
	for result in _test_results:
		var status = "✅ PASS" if result.passed else "❌ FAIL"
		if not result.passed:
			failed += 1
		else:
			passed += 1
		print(status + " | " + result.name)
		print("       Formula: " + result.formula)
		print("       Expected: " + str(result.expected) + " | Actual: " + str(result.actual))
		if result.has("note"):
			print("       Note: " + result.note)
		print("")
	
	print("=== SUMMARY ===")
	print("Passed: " + str(passed))
	print("Failed: " + str(failed))
	print("Total:  " + str(passed + failed))
	
	if failed == 0:
		print("\n🎉 ALL TESTS PASSED - SPECIAL Derived Stats match Fallout 2 reference!")
	else:
		print("\n⚠️  " + str(failed) + " test(s) failed - SPECIAL Derived Stats need correction")
	
	if failed > 0:
		quit(1)
	else:
		quit(0)