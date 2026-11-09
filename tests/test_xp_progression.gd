#!/usr/bin/env -S godot --headless --script

## XP Progression Test — Fallout 2 Fidelity Verification
## Tests that xp_for_level and level_from_xp match original Fallout 2 values

extends SceneTree

const FALLOUT2_XP_THRESHOLDS = {
	1: 0,
	2: 1000,
	3: 3000,
	4: 6000,
	5: 10000,
	6: 15000,
	7: 21000,
	8: 28000,
	9: 36000,
	10: 45000,
	11: 55000,
	12: 66000,
	13: 78000,
	14: 91000,
	15: 105000,
	16: 120000,
	17: 136000,
	18: 153000,
	19: 171000,
	20: 190000,
	21: 210000,
	22: 231000,
	23: 253000,
	24: 276000,
	25: 300000,
}

func _init() -> void:
	var CharacterSystem = load("res://scripts/systems/character_system.gd")
	
	var all_passed = true
	
	print("=== XP Progression Test ===")
	print("Testing CharacterSystem.xp_for_level() and level_from_xp()")
	print()
	
	# Test xp_for_level for levels 1-25
	for level in FALLOUT2_XP_THRESHOLDS:
		var expected_xp = FALLOUT2_XP_THRESHOLDS[level]
		var actual_xp = CharacterSystem.xp_for_level(level)
		
		if actual_xp == expected_xp:
			print("✅ Level %d: XP = %d (expected %d)" % [level, actual_xp, expected_xp])
		else:
			print("❌ Level %d: XP = %d (expected %d) — MISMATCH" % [level, actual_xp, expected_xp])
			all_passed = false
	
	print()
	
	# Test level_from_xp for boundary values
	for level in FALLOUT2_XP_THRESHOLDS:
		var xp_at_level = FALLOUT2_XP_THRESHOLDS[level]
		
		# At exactly the threshold, should be at that level
		var calculated_level = CharacterSystem.level_from_xp(xp_at_level)
		if calculated_level == level:
			print("✅ XP %d -> Level %d (exact threshold)" % [xp_at_level, calculated_level])
		else:
			print("❌ XP %d -> Level %d (expected %d) — MISMATCH" % [xp_at_level, calculated_level, level])
			all_passed = false
		
		# Just below threshold (if not level 1)
		if level > 1:
			var xp_below = xp_at_level - 1
			var calculated_level_below = CharacterSystem.level_from_xp(xp_below)
			if calculated_level_below == level - 1:
				print("✅ XP %d -> Level %d (just below threshold)" % [xp_below, calculated_level_below])
			else:
				print("❌ XP %d -> Level %d (expected %d) — MISMATCH" % [xp_below, calculated_level_below, level - 1])
				all_passed = false
	
	print()
	
	# Test edge cases
	var edge_tests = [
		{"xp": -100, "expected_level": 1, "desc": "Negative XP"},
		{"xp": 0, "expected_level": 1, "desc": "Zero XP"},
		{"xp": 999, "expected_level": 1, "desc": "Just below level 2"},
		{"xp": 1000, "expected_level": 2, "desc": "Exactly level 2 threshold"},
		{"xp": 2999, "expected_level": 2, "desc": "Just below level 3"},
		{"xp": 3000, "expected_level": 3, "desc": "Exactly level 3 threshold"},
	]
	
	for test in edge_tests:
		var calculated = CharacterSystem.level_from_xp(test.xp)
		if calculated == test.expected_level:
			print("✅ %s: XP %d -> Level %d" % [test.desc, test.xp, calculated])
		else:
			print("❌ %s: XP %d -> Level %d (expected %d) — MISMATCH" % [test.desc, test.xp, calculated, test.expected_level])
			all_passed = false
	
	print()
	
	# Test repeated level-ups (simulating actual gameplay)
	print("=== Simulated Level-Up Sequence ===")
	var test_char = CharacterSystem.new()
	test_char._init_default_character()
	
	for target_level in range(2, 11):
		var current_xp = test_char.character_data.xp
		var xp_needed = CharacterSystem.xp_for_level(target_level) - current_xp
		test_char.add_xp(xp_needed)
		
		if test_char.character_data.level == target_level:
			print("✅ Level-up to %d: XP added %d, total XP %d, character level %d" % [target_level, xp_needed, test_char.character_data.xp, test_char.character_data.level])
		else:
			print("❌ Level-up to %d: XP added %d, total XP %d, character level %d (expected %d)" % [target_level, xp_needed, test_char.character_data.xp, test_char.character_data.level, target_level])
			all_passed = false
	
	print()
	
	# Test save/load compatibility
	print("=== Save/Load Compatibility ===")
	var char1 = CharacterSystem.new()
	char1._init_default_character()
	char1.add_xp(15000)  # Should reach level 6
	
	var save_data = char1.get_save_data()
	
	var char2 = CharacterSystem.new()
	char2.load_save_data(save_data)
	
	if char2.character_data.level == char1.character_data.level and char2.character_data.xp == char1.character_data.xp:
		print("✅ Save/Load: Level %d, XP %d preserved" % [char2.character_data.level, char2.character_data.xp])
	else:
		print("❌ Save/Load: Level %d->%d, XP %d->%d MISMATCH" % [char1.character_data.level, char2.character_data.level, char1.character_data.xp, char2.character_data.xp])
		all_passed = false
	
	print()
	print("=== SUMMARY ===")
	if all_passed:
		print("✅ ALL TESTS PASSED — XP progression matches Fallout 2")
	else:
		print("❌ SOME TESTS FAILED — XP progression deviates from Fallout 2")
	
	quit(0 if all_passed else 1)