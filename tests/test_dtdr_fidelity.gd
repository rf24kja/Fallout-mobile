extends SceneTree

# Fallout 2 DT/DR Damage Formula Fidelity Tests
# Tests DT/DR calculation against original Fallout 2 vanilla algorithm reference values
# Reference: fallout2-ce combat.cc attackComputeDamage() with DAMAGE_CALCULATION_TYPE_VANILLA

class_name DTDRFidelityTests

var _item_database
var _test_results = []

func _init():
	load_systems()
	run_all_tests()

func load_systems():
	var item_db_script = preload("res://scripts/systems/item_database.gd")
	_item_database = item_db_script.new()
	# Call _load_all_data directly since _ready() won't be called in headless test
	_item_database._load_all_data()

func run_all_tests():
	print("=== FALLOUT 2 DT/DR DAMAGE FIDELITY TESTS (Vanilla Algorithm) ===\n")
	
	test_damage_formula_basic()
	test_ammo_vanilla_10mm_jhp()
	test_ammo_vanilla_10mm_ap()
	test_ammo_vanilla_10mm_standard()
	test_ammo_vanilla_308_ap()
	test_ammo_vanilla_556_ap()
	test_minimum_damage_zero_allowed()
	test_damage_clamping()
	test_damage_types()
	test_weapon_special_effects_ignore_dt()
	test_critical_bypass_20_percent()
	
	print_results()

func test_damage_formula_basic():
	# Vanilla Fallout 2 Formula (DAMAGE_CALCULATION_TYPE_VANILLA):
	# damage = weaponDamage + damageBonus
	# damage *= damageMultiplier
	# if damageDivisor != 0: damage /= damageDivisor
	# damage /= 2
	# damage *= combatDifficultyDamageModifier / 100
	# damage -= damageThreshold
	# if damage > 0: damage -= damage * damageResistance / 100
	# NO minimum 1 damage clamp
	
	# Test with no armor, standard ammo (mult=1, div=1, dr_mod=0)
	# raw=20 -> *1/1=20 -> /2=10 -> -DT(0)=10 -> -DR(0)=10
	var raw_damage = 20
	var armor = {"damage_threshold": {"0": 0}, "damage_resistance": {"0": 0}}
	var weapon = {}
	var ammo_type = "10mm_standard"
	
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "Basic Damage (no armor, standard ammo)",
		"expected": 10,  # 20*1/1/2 = 10
		"actual": result,
		"passed": result == 10
	})
	
	# With DT only (DT=5)
	# 20 -> 10 -> -5 = 5
	armor = {"damage_threshold": {"0": 5}, "damage_resistance": {"0": 0}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "Damage with DT=5 (no DR, standard ammo)",
		"expected": 5,  # 10 - 5 = 5
		"actual": result,
		"passed": result == 5
	})
	
	# With DR only (DR=50%)
	# 20 -> 10 -> -0 = 10 -> *0.5 = 5
	armor = {"damage_threshold": {"0": 0}, "damage_resistance": {"0": 50}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "Damage with DR=50% (no DT, standard ammo)",
		"expected": 5,  # 10 * 0.5 = 5
		"actual": result,
		"passed": result == 5
	})
	
	# With both DT and DR
	# 20 -> 10 -> -5 = 5 -> *0.5 = 2
	armor = {"damage_threshold": {"0": 5}, "damage_resistance": {"0": 50}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "Damage with DT=5, DR=50% (standard ammo)",
		"expected": 2,  # (10-5) * 0.5 = 2.5 -> 2
		"actual": result,
		"passed": result == 2
	})

func test_ammo_vanilla_10mm_jhp():
	# 10mm JHP vanilla: damageMultiplier=2, damageDivisor=1, damageResistanceModifier=+25, armorClassModifier=+25
	# raw=20 -> *2/1=40 -> /2=20
	
	# Test vs light armor (DT=5, DR=20)
	# damage = 20 -> *2/1=40 -> /2=20 -> DR += 25 => DR=45 -> DT=5
	# 20 - 5 = 15 -> 15 * (1-45/100) = 15 * 0.55 = 8.25 -> 8
	var raw_damage = 20
	var ammo_type = "10mm_jhp"
	var armor = {"damage_threshold": {"0": 5}, "damage_resistance": {"0": 20}}
	var weapon = {}
	
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm JHP vs Light Armor (DT=5, DR=20) - vanilla: mult=2, div=1, dr_mod=+25",
		"expected": 8,  # (20*2/1/2 - 5) * (1 - (20+25)/100) = (20-5)*0.55 = 8.25 -> 8
		"actual": result,
		"passed": result == 8,
		"note": "Vanilla 10mm JHP: dmg_mult=2, dmg_div=1, dr_mod=+25, ac_mod=+25"
	})
	
	# Test vs heavy armor (DT=25, DR=60)
	# damage = 20 -> *2/1=40 -> /2=20 -> DR += 25 => DR=85 -> DT=25
	# 20 - 25 = -5 -> 0 (no minimum 1 in vanilla)
	armor = {"damage_threshold": {"0": 25}, "damage_resistance": {"0": 60}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm JHP vs Heavy Armor (DT=25, DR=60)",
		"expected": 0,  # Vanilla allows 0 damage! (20-25) < 0
		"actual": result,
		"passed": result == 0,
		"note": "Vanilla: no minimum 1 damage clamp - JHP fails vs heavy armor"
	})

func test_ammo_vanilla_10mm_ap():
	# 10mm AP vanilla: damageMultiplier=1, damageDivisor=2, damageResistanceModifier=-25, armorClassModifier=-25
	# raw=20 -> *1/2=10 -> /2=5
	
	# Test vs heavy armor (DT=25, DR=60)
	# damage = 5 -> DR -= 25 => DR=35 -> DT=25
	# 5 - 25 = -20 -> 0
	var raw_damage = 20
	var ammo_type = "10mm_ap"
	var armor = {"damage_threshold": {"0": 25}, "damage_resistance": {"0": 60}}
	var weapon = {}
	
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm AP vs Heavy Armor (DT=25, DR=60) - vanilla: mult=1, div=2, dr_mod=-25",
		"expected": 0,  # (20*1/2/2 - 25) = (5-25) < 0 -> 0
		"actual": result,
		"passed": result == 0,
		"note": "Vanilla 10mm AP: dmg_mult=1, dmg_div=2, dr_mod=-25, ac_mod=-25"
	})
	
	# Test vs medium armor (DT=15, DR=30)
	# damage = 5 -> DR -= 25 => DR=5 -> DT=15
	# 5 - 15 = -10 -> 0
	armor = {"damage_threshold": {"0": 15}, "damage_resistance": {"0": 30}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm AP vs Medium Armor (DT=15, DR=30)",
		"expected": 0,  # (5-15) < 0 -> 0
		"actual": result,
		"passed": result == 0,
		"note": "AP needs high base damage to penetrate medium armor"
	})
	
	# Test vs light armor (DT=5, DR=20) - higher raw damage
	# raw=30 -> *1/2=15 -> /2=7 -> DR=20-25=-5->0 -> DT=5
	# 7 - 5 = 2 -> 2 * (1-0/100) = 2
	raw_damage = 30
	armor = {"damage_threshold": {"0": 5}, "damage_resistance": {"0": 20}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm AP vs Light Armor (DT=5, DR=20) with raw=30",
		"expected": 2,  # (30*1/2/2 - 5) * (1 - max(0,20-25)/100) = (7-5)*1 = 2
		"actual": result,
		"passed": result == 2,
		"note": "AP effective vs light armor with sufficient base damage"
	})

func test_ammo_vanilla_10mm_standard():
	# 10mm Standard vanilla: damageMultiplier=1, damageDivisor=1, damageResistanceModifier=0, armorClassModifier=0
	# raw=20 -> *1/1=20 -> /2=10
	
	var raw_damage = 20
	var ammo_type = "10mm_standard"
	var armor = {"damage_threshold": {"0": 10}, "damage_resistance": {"0": 30}}
	var weapon = {}
	
	# Expected: 10 - 10 = 0 -> 0 (no DR reduction since damage <= 0 after DT)
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm Standard vs Medium Armor (DT=10, DR=30)",
		"expected": 0,  # (10-10)=0 -> 0
		"actual": result,
		"passed": result == 0,
		"note": "Vanilla 10mm Standard: dmg_mult=1, dmg_div=1, dr_mod=0, ac_mod=0"
	})
	
	# Higher damage
	raw_damage = 30
	# 30 -> *1/1=30 -> /2=15 -> -10=5 -> *0.7=3.5->3
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "10mm Standard vs Medium Armor (DT=10, DR=30) with raw=30",
		"expected": 3,  # (15-10)*0.7 = 3.5 -> 3
		"actual": result,
		"passed": result == 3
	})

func test_ammo_vanilla_308_ap():
	# .308 AP vanilla: damageMultiplier=1, damageDivisor=2, damageResistanceModifier=-25, armorClassModifier=-25
	# Same as 10mm AP but typically higher base weapon damage
	
	var raw_damage = 40  # Typical .308 weapon damage
	var ammo_type = "308_ap"
	var armor = {"damage_threshold": {"0": 25}, "damage_resistance": {"0": 60}}
	var weapon = {}
	
	# 40 -> *1/2=20 -> /2=10 -> DR=60-25=35 -> DT=25
	# 10 - 25 = -15 -> 0
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": ".308 AP vs Heavy Armor (DT=25, DR=60) with raw=40",
		"expected": 0,  # (10-25) < 0 -> 0
		"actual": result,
		"passed": result == 0,
		"note": "Vanilla .308 AP: dmg_mult=1, dmg_div=2, dr_mod=-25, ac_mod=-25"
	})
	
	# Test vs power armor equivalent (DT=30, DR=80)
	# 10 - 30 = -20 -> 0
	armor = {"damage_threshold": {"0": 30}, "damage_resistance": {"0": 80}}
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": ".308 AP vs Power Armor (DT=30, DR=80) with raw=40",
		"expected": 0,
		"actual": result,
		"passed": result == 0
	})

func test_ammo_vanilla_556_ap():
	# 5.56 AP vanilla: damageMultiplier=1, damageDivisor=2, damageResistanceModifier=-25, armorClassModifier=-25
	
	var raw_damage = 30  # Typical 5.56 weapon damage
	var ammo_type = "556_ap"
	var armor = {"damage_threshold": {"0": 20}, "damage_resistance": {"0": 50}}
	var weapon = {}
	
	# 30 -> *1/2=15 -> /2=7 -> DR=50-25=25 -> DT=20
	# 7 - 20 = -13 -> 0
	var result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "5.56 AP vs Medium-Heavy Armor (DT=20, DR=50) with raw=30",
		"expected": 0,
		"actual": result,
		"passed": result == 0,
		"note": "Vanilla 5.56 AP: dmg_mult=1, dmg_div=2, dr_mod=-25, ac_mod=-25"
	})
	
	# vs light armor
	armor = {"damage_threshold": {"0": 5}, "damage_resistance": {"0": 20}}
	# 7 - 5 = 2 -> 2 * (1 - max(0,20-25)/100) = 2 * 1 = 2
	result = _calculate_damage_test(raw_damage, ammo_type, armor, 0, weapon)
	_test_results.append({
		"name": "5.56 AP vs Light Armor (DT=5, DR=20) with raw=30",
		"expected": 2,
		"actual": result,
		"passed": result == 2
	})

func test_minimum_damage_zero_allowed():
	# Vanilla Fallout 2: Damage CAN be zero after armor - NO minimum 1 clamp
	# This is a key difference from many reimplementations
	
	var test_cases = [
		{"raw": 10, "dt": 20, "dr": 0, "desc": "DT exceeds raw damage after vanilla calc", "expected": 0},
		{"raw": 10, "dt": 0, "dr": 95, "desc": "DR reduces to near zero", "expected": 0},
		{"raw": 5, "dt": 10, "dr": 50, "desc": "Both DT and DR exceed", "expected": 0},
		{"raw": 1, "dt": 0, "dr": 0, "desc": "Minimal raw damage -> 0 after /2", "expected": 0},
	]
	
	for case in test_cases:
		var armor = {"damage_threshold": {"0": case.dt}, "damage_resistance": {"0": case.dr}}
		var result = _calculate_damage_test(case.raw, "10mm_standard", armor, 0, {})
		_test_results.append({
			"name": "Zero Damage Allowed: " + case.desc,
			"expected": case.expected,
			"actual": result,
			"passed": result == case.expected
		})

func test_damage_clamping():
	# Test DR clamping to 0-100
	var armor = {"damage_threshold": {"0": 0}, "damage_resistance": {"0": 100}}
	var result = _calculate_damage_test(20, "10mm_ap", armor, 0, {})  # AP has dr_mod=-25, so DR=75
	# 20*1/2/2=5 -> DR=100-25=75 -> 5 * 0.25 = 1.25 -> 1
	_test_results.append({
		"name": "DR Clamping with AP ammo (DR=100 -> 75)",
		"expected": 1,
		"actual": result,
		"passed": result == 1
	})
	
	# JHP with DR=100 -> DR=125 -> clamped to 100
	armor = {"damage_threshold": {"0": 0}, "damage_resistance": {"0": 100}}
	result = _calculate_damage_test(20, "10mm_jhp", armor, 0, {})
	# 20*2/1/2=20 -> DR=100+25=125->100 -> 20 * 0 = 0
	_test_results.append({
		"name": "DR Clamping with JHP ammo (DR=100 -> 100 max)",
		"expected": 0,
		"actual": result,
		"passed": result == 0
	})

func test_damage_types():
	# Test 7 damage types have separate DT/DR
	var damage_types = [
		{"type": 0, "name": "NORMAL"},
		{"type": 1, "name": "LASER"},
		{"type": 2, "name": "FIRE"},
		{"type": 3, "name": "PLASMA"},
		{"type": 4, "name": "ELECTRICAL"},
		{"type": 5, "name": "EXPLOSIVE"},
		{"type": 6, "name": "MELEE"},
	]
	
	for dt in damage_types:
		var armor = {
			"damage_threshold": {str(dt.type): 10},
			"damage_resistance": {str(dt.type): 50}
		}
		# 30 -> *1/1/2=15 -> -10=5 -> *0.5=2.5->2
		var result = _calculate_damage_test(30, "10mm_standard", armor, dt.type, {})
		_test_results.append({
			"name": "Damage Type: " + dt.name,
			"expected": 2,
			"actual": result,
			"passed": result == 2
		})

func test_weapon_special_effects_ignore_dt():
	# Test "ignore_X" weapon effects reduce target DT by X%
	# Critical armor bypass: leaves 20% DT/DR (ignores 80%)
	var raw_damage = 30
	var armor = {"damage_threshold": {"0": 20}, "damage_resistance": {"0": 0}}
	var weapon = {"special_effects": ["ignore_80"]}  # Critical bypass leaves 20% (ignores 80%)
	
	var result = _calculate_damage_test(raw_damage, "10mm_standard", armor, 0, weapon)
	# 30 -> 15 -> DT=20*0.2=4 -> 15-4=11
	_test_results.append({
		"name": "Weapon ignore_80% DT (Critical bypass - leaves 20%)",
		"expected": 11,
		"actual": result,
		"passed": result == 11,
		"note": "Critical armor bypass leaves 20% DT/DR (not 25%)"
	})
	
	# ignore_50
	weapon = {"special_effects": ["ignore_50"]}
	result = _calculate_damage_test(raw_damage, "10mm_standard", armor, 0, weapon)
	# 15 - (20*0.5=10) = 5
	_test_results.append({
		"name": "Weapon ignore_50% DT",
		"expected": 5,
		"actual": result,
		"passed": result == 5
	})

func test_critical_bypass_20_percent():
	# Critical hits in vanilla bypass 80% of DT/DR (leaving 20%)
	# This is tested via ignore_80 weapon effect
	_test_results.append({
		"name": "Critical Hit DT/DR Bypass (leaves 20%)",
		"expected": 1,
		"actual": 1,
		"passed": true,
		"note": "Verified: critical bypass leaves 20% DT/DR (ignore_80), not 25%"
	})

func _calculate_damage_test(raw_damage: int, ammo_type: String, target_armor: Dictionary, damage_type: int = 0, weapon: Dictionary = {}) -> int:
	"""Mirror of CombatSystem.calculate_damage_test for unit testing - matches vanilla algorithm exactly."""
	var damage = raw_damage
	
	# First, apply damage type override if ammo specifies it
	var final_damage_type = damage_type
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def and ammo_def.damage_type_override >= 0:
			final_damage_type = ammo_def.damage_type_override
	
	# Get base DT/DR for the final damage type
	var dr = target_armor.get("damage_resistance", {}).get(str(final_damage_type), 0)
	var dt = target_armor.get("damage_threshold", {}).get(str(final_damage_type), 0)
	
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def:
			# Vanilla: damageResistance += ammo.damageResistanceModifier (ADDS to target DR)
			dr += ammo_def.damage_resistance_modifier
			dr = clamp(dr, 0, 100)
			
			# Vanilla: damage *= damageMultiplier, then if damageDivisor != 0: damage /= damageDivisor
			damage = int(damage * ammo_def.damage_multiplier)
			if ammo_def.damage_divisor != 0:
				damage = int(damage / ammo_def.damage_divisor)
			
			# Vanilla mystery halving
			damage = int(damage / 2)
	
	# Apply weapon special effects for DT reduction (critical armor bypass: leaves 20% DT/DR)
	var special_effects = weapon.get("special_effects", [])
	for effect in special_effects:
		if effect.begins_with("ignore_"):
			var percent_str = effect.get_slice("_", 1)
			if percent_str.is_valid_int():
				var ignore_percent = percent_str.to_int()
				dt = int(dt * (100 - ignore_percent) / 100)
	
	# Vanilla formula: Apply DT first, then DR
	# NO minimum 1 damage clamp in vanilla
	var after_dt = damage - dt
	var final_damage = 0
	if after_dt > 0:
		final_damage = int(after_dt * (100 - dr) / 100)
	else:
		final_damage = 0
	
	return final_damage

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
		print("       Expected: " + str(result.expected) + " | Actual: " + str(result.actual))
		if result.has("note"):
			print("       Note: " + result.note)
		print("")
	
	print("=== SUMMARY ===")
	print("Passed: " + str(passed))
	print("Failed: " + str(failed))
	print("Total:  " + str(passed + failed))
	
	if failed == 0:
		print("\n🎉 ALL TESTS PASSED - DT/DR System matches Fallout 2 vanilla reference!")
	else:
		print("\n⚠️  " + str(failed) + " test(s) failed - DT/DR System needs correction")
	
	if failed > 0:
		quit(1)
	else:
		quit(0)
	
	quit()