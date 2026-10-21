#!/usr/bin/env python3
"""Test script for CombatSystem DT/DR and ammo calculations."""
import sys
import os

# Add the project root to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

# We'll test the logic by replicating it in Python since we can't run Godot headless easily here

def calculate_damage_test(raw_damage: int, ammo_type: str, target_armor: dict, damage_type: int = 0, ammo_data: dict = None) -> int:
    """Replicate the CombatSystem.calculate_damage_test logic in Python."""
    damage = raw_damage
    dr = target_armor.get("damage_resistance", {}).get(str(damage_type), 0)
    dt = target_armor.get("damage_threshold", {}).get(str(damage_type), 0)
    
    if ammo_type != "" and ammo_data and ammo_type in ammo_data:
        ammo_def = ammo_data[ammo_type]
        damage = int(damage * ammo_def.get("damage_modifier", 1.0))
        dt = int(dt * ammo_def.get("dt_modifier", 1.0))
        dr = int(dr * ammo_def.get("dr_modifier", 1.0))
        if ammo_def.get("damage_type_override", -1) >= 0:
            damage_type = ammo_def["damage_type_override"]
    
    after_dr = int(damage * (100 - dr) / 100)
    return max(0, after_dr - dt)

# Ammo data from ammo.json
AMMO_DATA = {
    "38_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "38_jhp": {"damage_modifier": 1.5, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "38_ap": {"damage_modifier": 0.7, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "9mm_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "9mm_jhp": {"damage_modifier": 1.5, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "9mm_ap": {"damage_modifier": 0.75, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "10mm_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "10mm_jhp": {"damage_modifier": 1.4, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "10mm_ap": {"damage_modifier": 0.8, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "44_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "44_jhp": {"damage_modifier": 1.6, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "44_ap": {"damage_modifier": 0.85, "dt_modifier": 0.4, "dr_modifier": 1.0, "damage_type_override": -1},
    "308_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "308_ap": {"damage_modifier": 0.9, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "556_standard": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "556_ap": {"damage_modifier": 0.85, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "12ga_buckshot": {"damage_modifier": 1.0, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": -1},
    "12ga_slug": {"damage_modifier": 1.2, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "12ga_dragons_breath": {"damage_modifier": 0.8, "dt_modifier": 1.5, "dr_modifier": 1.0, "damage_type_override": 2},  # FIRE
    "microfusion_cell": {"damage_modifier": 1.0, "dt_modifier": 0.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "microfusion_overcharge": {"damage_modifier": 1.3, "dt_modifier": 0.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "small_energy_cell": {"damage_modifier": 1.0, "dt_modifier": 0.5, "dr_modifier": 1.0, "damage_type_override": -1},
}

# Armor data from armor.json (sample)
ARMOR_SAMPLES = {
    "leather_armor": {"damage_resistance": {"0": 15}, "damage_threshold": {"0": 2}},
    "combat_armor": {"damage_resistance": {"0": 35}, "damage_threshold": {"0": 10}},
    "power_armor_mk2": {"damage_resistance": {"0": 65}, "damage_threshold": {"0": 25}},
    "enclave_armor": {"damage_resistance": {"0": 75}, "damage_threshold": {"0": 30}},
}

def test_case(name: str, raw_damage: int, ammo_type: str, armor: dict, expected_min: int, expected_max: int):
    """Run a single test case."""
    result = calculate_damage_test(raw_damage, ammo_type, armor, 0, AMMO_DATA)
    passed = expected_min <= result <= expected_max
    status = "PASS" if passed else "FAIL"
    print(f"  {status}: {name} -> {result} (expected {expected_min}-{expected_max})")
    return passed

def run_tests():
    print("=== Combat System DT/DR & Ammo Tests ===\n")
    
    all_passed = True
    
    # Test 1: Standard ammo vs various armors
    print("Test 1: Standard .38 vs Leather Armor (DT=2, DR=15)")
    all_passed &= test_case("Standard .38, 20 dmg vs Leather", 20, "38_standard", ARMOR_SAMPLES["leather_armor"], 15, 19)
    all_passed &= test_case("Standard .38, 20 dmg vs Combat", 20, "38_standard", ARMOR_SAMPLES["combat_armor"], 3, 8)
    all_passed &= test_case("Standard .38, 20 dmg vs T-51b", 20, "38_standard", ARMOR_SAMPLES["power_armor_mk2"], 0, 0)
    
    # Test 2: JHP ammo (higher damage, higher DT effectiveness)
    print("\nTest 2: JHP .38 vs Armor (1.5x damage, 1.5x DT)")
    all_passed &= test_case("JHP .38, 20 dmg vs Leather", 20, "38_jhp", ARMOR_SAMPLES["leather_armor"], 21, 27)
    all_passed &= test_case("JHP .38, 20 dmg vs Combat", 20, "38_jhp", ARMOR_SAMPLES["combat_armor"], 4, 11)
    all_passed &= test_case("JHP .38, 20 dmg vs T-51b", 20, "38_jhp", ARMOR_SAMPLES["power_armor_mk2"], 0, 0)
    
    # Test 3: AP ammo (lower damage, penetrates DT)
    print("\nTest 3: AP .38 vs Armor (0.7x damage, 0.5x DT)")
    all_passed &= test_case("AP .38, 20 dmg vs Leather", 20, "38_ap", ARMOR_SAMPLES["leather_armor"], 10, 13)
    all_passed &= test_case("AP .38, 20 dmg vs Combat", 20, "38_ap", ARMOR_SAMPLES["combat_armor"], 4, 7)
    all_passed &= test_case("AP .38, 20 dmg vs T-51b", 20, "38_ap", ARMOR_SAMPLES["power_armor_mk2"], 0, 3)
    
    # Test 4: .44 Magnum with different ammo types
    print("\nTest 4: .44 Magnum (40 base dmg) vs Combat Armor")
    all_passed &= test_case("Standard .44, 40 dmg vs Combat", 40, "44_standard", ARMOR_SAMPLES["combat_armor"], 16, 21)
    all_passed &= test_case("JHP .44, 40 dmg vs Combat", 40, "44_jhp", ARMOR_SAMPLES["combat_armor"], 24, 33)
    all_passed &= test_case("AP .44, 40 dmg vs Combat", 40, "44_ap", ARMOR_SAMPLES["combat_armor"], 16, 21)
    
    # Test 5: Energy weapons (DT=0 for microfusion)
    print("\nTest 5: Energy weapons vs Power Armor (DT ignored)")
    all_passed &= test_case("Microfusion, 50 dmg vs T-51b", 50, "microfusion_cell", ARMOR_SAMPLES["power_armor_mk2"], 17, 18)
    all_passed &= test_case("Overcharge, 50 dmg vs T-51b", 50, "microfusion_overcharge", ARMOR_SAMPLES["power_armor_mk2"], 22, 23)
    all_passed &= test_case("Small Energy, 30 dmg vs T-51b", 30, "small_energy_cell", ARMOR_SAMPLES["power_armor_mk2"], 0, 0)
    
    # Test 6: 12ga Shotgun variants
    print("\nTest 6: 12ga Shotgun vs Combat Armor")
    all_passed &= test_case("Buckshot, 30 dmg vs Combat", 30, "12ga_buckshot", ARMOR_SAMPLES["combat_armor"], 3, 5)
    all_passed &= test_case("Slug, 30 dmg vs Combat", 30, "12ga_slug", ARMOR_SAMPLES["combat_armor"], 9, 13)
    all_passed &= test_case("Dragon's Breath, 30 dmg vs Combat (FIRE)", 30, "12ga_dragons_breath", ARMOR_SAMPLES["combat_armor"], 0, 3)
    
    # Test 7: High damage vs low armor
    print("\nTest 7: High damage weapons vs Light Armor")
    all_passed &= test_case("Gauss Rifle 85 dmg vs Leather (AP)", 85, "556_ap", ARMOR_SAMPLES["leather_armor"], 50, 65)
    all_passed &= test_case("Plasma Rifle 65 dmg vs Leather", 65, "microfusion_cell", ARMOR_SAMPLES["leather_armor"], 55, 56)
    
    # Test 8: Edge cases
    print("\nTest 8: Edge Cases")
    all_passed &= test_case("Zero damage", 0, "38_standard", ARMOR_SAMPLES["leather_armor"], 0, 0)
    all_passed &= test_case("Armor DR=100%", 50, "38_standard", {"damage_resistance": {"0": 100}, "damage_threshold": {"0": 0}}, 0, 0)
    all_passed &= test_case("Armor DT > damage", 10, "38_standard", {"damage_resistance": {"0": 0}, "damage_threshold": {"0": 20}}, 0, 0)
    
    print(f"\n=== {'ALL TESTS PASSED' if all_passed else 'SOME TESTS FAILED'} ===")
    return all_passed

if __name__ == "__main__":
    success = run_tests()
    sys.exit(0 if success else 1)