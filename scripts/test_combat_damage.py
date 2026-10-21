#!/usr/bin/env python3
"""Test script for CombatSystem DT/DR and ammo calculations."""
import sys
import os

# Add the project root to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

# We'll test the logic by replicating it in Python since we can't run Godot headless easily here

def calculate_damage_test(raw_damage: int, ammo_type: str, target_armor: dict, damage_type: int = 0, ammo_data: dict = None, weapon: dict = None) -> int:
    """Replicate the CombatSystem.calculate_damage_test logic in Python."""
    damage = raw_damage
    
    # First, apply damage type override if ammo specifies it
    final_damage_type = damage_type
    if ammo_type != "" and ammo_data and ammo_type in ammo_data:
        ammo_def = ammo_data[ammo_type]
        if ammo_def.get("damage_type_override", -1) >= 0:
            final_damage_type = ammo_def["damage_type_override"]
    
    # Get base DT/DR for the final damage type
    dr = target_armor.get("damage_resistance", {}).get(str(final_damage_type), 0)
    dt = target_armor.get("damage_threshold", {}).get(str(final_damage_type), 0)
    
    if ammo_type != "" and ammo_data and ammo_type in ammo_data:
        ammo_def = ammo_data[ammo_type]
        damage = int(damage * ammo_def.get("damage_modifier", 1.0))
        dt = int(dt * ammo_def.get("dt_modifier", 1.0))
        dr = int(dr * ammo_def.get("dr_modifier", 1.0))
    
    # Apply weapon special effects for DT reduction
    if weapon:
        special_effects = weapon.get("special_effects", [])
        for effect in special_effects:
            if effect.startswith("ignore_"):
                percent_str = effect.split("_")[1]
                if percent_str.isdigit():
                    ignore_percent = int(percent_str)
                    dt = int(dt * (100 - ignore_percent) / 100)
    
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
    "microfusion_cell": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "microfusion_overcharge": {"damage_modifier": 1.3, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
    "small_energy_cell": {"damage_modifier": 1.0, "dt_modifier": 1.0, "dr_modifier": 1.0, "damage_type_override": -1},
}

# Armor data from armor.json (sample) - now with per-damage-type DT/DR
ARMOR_SAMPLES = {
    "leather_armor": {"damage_resistance": {"0": 15, "1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 15}, "damage_threshold": {"0": 2, "1": 2, "2": 2, "3": 2, "4": 2, "5": 2, "6": 2}},
    "combat_armor": {"damage_resistance": {"0": 35, "1": 20, "2": 10, "3": 20, "4": 20, "5": 15, "6": 35}, "damage_threshold": {"0": 10, "1": 10, "2": 10, "3": 10, "4": 10, "5": 10, "6": 10}},
    "power_armor_mk2": {"damage_resistance": {"0": 65, "1": 50, "2": 40, "3": 50, "4": 50, "5": 45, "6": 65}, "damage_threshold": {"0": 25, "1": 25, "2": 25, "3": 25, "4": 25, "5": 25, "6": 25}},
    "enclave_armor": {"damage_resistance": {"0": 75, "1": 60, "2": 50, "3": 60, "4": 60, "5": 55, "6": 75}, "damage_threshold": {"0": 30, "1": 30, "2": 30, "3": 30, "4": 30, "5": 30, "6": 30}},
}

def test_case(name: str, raw_damage: int, ammo_type: str, armor: dict, expected_min: int, expected_max: int, weapon: dict = None, damage_type: int = 0):
    """Run a single test case."""
    result = calculate_damage_test(raw_damage, ammo_type, armor, damage_type, AMMO_DATA, weapon)
    passed = expected_min <= result <= expected_max
    status = "PASS" if passed else "FAIL"
    print(f"  {status}: {name} -> {result} (expected {expected_min}-{expected_max})")
    return passed

def run_tests():
    print("=== Combat System DT/DR & Ammo Tests ===\n")
    
    all_passed = True
    
    # Test 1: Standard ammo vs various armors
    print("Test 1: Standard .38 vs Leather Armor (DT=2, DR=15)")
    all_passed &= test_case("Standard .38, 20 dmg vs Leather", 20, "38_standard", ARMOR_SAMPLES["leather_armor"], 15, 19, None, 0)
    all_passed &= test_case("Standard .38, 20 dmg vs Combat", 20, "38_standard", ARMOR_SAMPLES["combat_armor"], 3, 8, None, 0)
    all_passed &= test_case("Standard .38, 20 dmg vs T-51b", 20, "38_standard", ARMOR_SAMPLES["power_armor_mk2"], 0, 0, None, 0)
    
    # Test 2: JHP ammo (higher damage, higher DT effectiveness)
    print("\nTest 2: JHP .38 vs Armor (1.5x damage, 1.5x DT)")
    all_passed &= test_case("JHP .38, 20 dmg vs Leather", 20, "38_jhp", ARMOR_SAMPLES["leather_armor"], 21, 27, None, 0)
    all_passed &= test_case("JHP .38, 20 dmg vs Combat", 20, "38_jhp", ARMOR_SAMPLES["combat_armor"], 4, 11, None, 0)
    all_passed &= test_case("JHP .38, 20 dmg vs T-51b", 20, "38_jhp", ARMOR_SAMPLES["power_armor_mk2"], 0, 0, None, 0)
    
    # Test 3: AP ammo (lower damage, penetrates DT)
    print("\nTest 3: AP .38 vs Armor (0.7x damage, 0.5x DT)")
    all_passed &= test_case("AP .38, 20 dmg vs Leather", 20, "38_ap", ARMOR_SAMPLES["leather_armor"], 10, 13, None, 0)
    all_passed &= test_case("AP .38, 20 dmg vs Combat", 20, "38_ap", ARMOR_SAMPLES["combat_armor"], 4, 7, None, 0)
    all_passed &= test_case("AP .38, 20 dmg vs T-51b", 20, "38_ap", ARMOR_SAMPLES["power_armor_mk2"], 0, 3, None, 0)
    
    # Test 4: .44 Magnum with different ammo types
    print("\nTest 4: .44 Magnum (40 base dmg) vs Combat Armor")
    all_passed &= test_case("Standard .44, 40 dmg vs Combat", 40, "44_standard", ARMOR_SAMPLES["combat_armor"], 16, 21, None, 0)
    all_passed &= test_case("JHP .44, 40 dmg vs Combat", 40, "44_jhp", ARMOR_SAMPLES["combat_armor"], 24, 33, None, 0)
    all_passed &= test_case("AP .44, 40 dmg vs Combat", 40, "44_ap", ARMOR_SAMPLES["combat_armor"], 16, 21, None, 0)
    
    # Test 5: Energy weapons vs Power Armor (T-51b: DR=50, DT=25 for LASER)
    print("\nTest 5: Energy weapons vs Power Armor (DT ignored)")
    laser_pistol = {"special_effects": ["ignore_50_dt"]}
    plasma_rifle = {"special_effects": ["ignore_70_dt"]}
    gauss_rifle = {"special_effects": ["ignore_80_dt"]}
    # Laser pistol: damage_type=1 (LASER), 50 dmg, ignore_50_dt -> dt=12, dr=50 -> after_dr=25, final=13
    all_passed &= test_case("Microfusion, 50 dmg vs T-51b (laser_pistol)", 50, "microfusion_cell", ARMOR_SAMPLES["power_armor_mk2"], 13, 13, laser_pistol, 1)
    # Overcharge: 50*1.3=65, dt=12, dr=50 -> after_dr=32, final=20
    all_passed &= test_case("Overcharge, 50 dmg vs T-51b (laser_pistol)", 50, "microfusion_overcharge", ARMOR_SAMPLES["power_armor_mk2"], 20, 20, laser_pistol, 1)
    # Small energy: 30 dmg, damage_type=1 (LASER), no ignore, dt=25, dr=50 -> after_dr=15, final=0
    all_passed &= test_case("Small Energy, 30 dmg vs T-51b", 30, "small_energy_cell", ARMOR_SAMPLES["power_armor_mk2"], 0, 0, None, 1)
    
    # Test 5b: Plasma rifle vs Power Armor (PLASMA type 2, T-51b DR=40, DT=25, ignore_70_dt -> dt=7)
    print("\nTest 5b: Plasma Rifle vs Power Armor (ignore 70% DT)")
    # 50 dmg, PLASMA (2), dt=25*0.3=7, dr=40 -> after_dr=30, final=23
    all_passed &= test_case("Plasma 50 dmg vs T-51b (plasma_rifle)", 50, "microfusion_cell", ARMOR_SAMPLES["power_armor_mk2"], 23, 23, plasma_rifle, 2)
    
    # Test 5c: Gauss Rifle vs Power Armor (ELECTRICAL type 6, T-51b DR=65, DT=25, ignore_80_dt -> dt=5)
    print("\nTest 5c: Gauss Rifle vs Power Armor (ignore 80% DT)")
    # 50*1.3=65 dmg, ELECTRICAL (6), dt=25*0.2=5, dr=65 -> after_dr=65*0.35=22, final=17
    all_passed &= test_case("Gauss 50 dmg vs T-51b (gauss_rifle)", 50, "microfusion_overcharge", ARMOR_SAMPLES["power_armor_mk2"], 17, 17, gauss_rifle, 6)
    
# Test 6: 12ga Shotgun variants
    print("\nTest 6: 12ga Shotgun vs Combat Armor")
    all_passed &= test_case("Buckshot, 30 dmg vs Combat", 30, "12ga_buckshot", ARMOR_SAMPLES["combat_armor"], 3, 5, None, 0)
    all_passed &= test_case("Slug, 30 dmg vs Combat", 30, "12ga_slug", ARMOR_SAMPLES["combat_armor"], 9, 13, None, 0)
    # Dragon's Breath changes damage type to FIRE (2), combat_armor has DR=10, DT=10 for FIRE
    # 30 * 0.8 = 24 dmg, DT = 10 * 1.5 = 15, DR = 10
    # after_dr = 24 * 0.9 = 21, final = 21 - 15 = 6
    all_passed &= test_case("Dragon's Breath, 30 dmg vs Combat (FIRE)", 30, "12ga_dragons_breath", ARMOR_SAMPLES["combat_armor"], 6, 6, None, 0)
    
    # Test 7: High damage vs low armor
    print("\nTest 7: High damage weapons vs Light Armor")
    # Gauss Rifle uses ELECTRICAL damage (6) with AP ammo (0.5 DT modifier)
    # Leather: DR=15, DT=2 for ELECTRICAL
    # 85 * 0.85 = 72 dmg, DT = 2 * 0.5 = 1, DR = 15
    # after_dr = 72 * 0.85 = 61, final = 61 - 1 = 60
    all_passed &= test_case("Gauss Rifle 85 dmg vs Leather (AP)", 85, "556_ap", ARMOR_SAMPLES["leather_armor"], 60, 60, None, 6)
    # Plasma Rifle uses PLASMA damage (2), leather has DR=0, DT=2 for PLASMA
    # 65 * 1.0 = 65, DT = 2 * 1.0 = 2, DR = 0
    # after_dr = 65, final = 65 - 2 = 63
    all_passed &= test_case("Plasma Rifle 65 dmg vs Leather", 65, "microfusion_cell", ARMOR_SAMPLES["leather_armor"], 63, 63, None, 2)
    
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