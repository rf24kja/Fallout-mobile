#!/usr/bin/env python3
"""Test script for CombatSystem DT/DR and ammo calculations - VANILLA FALLOUT 2 ALGORITHM.
Reference: fallout2-ce combat.cc attackComputeDamage() with DAMAGE_CALCULATION_TYPE_VANILLA"""
import sys
import os
import json

# Add the project root to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

def calculate_damage_test_vanilla(raw_damage: int, ammo_type: str, target_armor: dict, damage_type: int = 0, ammo_data: dict = None, weapon: dict = None) -> int:
    """Replicate the vanilla Fallout 2 CombatSystem.calculate_damage_test logic in Python.
    
    Vanilla algorithm (DAMAGE_CALCULATION_TYPE_VANILLA):
    damage = weaponDamage + damageBonus
    damage *= damageMultiplier
    if damageDivisor != 0: damage /= damageDivisor
    damage /= 2
    damage *= combatDifficultyDamageModifier / 100
    damage -= damageThreshold
    if damage > 0: damage -= damage * damageResistance / 100
    NO minimum 1 damage clamp
    """
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
        
        # Vanilla: damageResistance += ammo.damageResistanceModifier (ADDS to target DR)
        dr += ammo_def.get("damage_resistance_modifier", 0)
        # Clamp DR to 0-100
        dr = max(0, min(100, dr))
        
        # Vanilla: damage *= damageMultiplier, then if damageDivisor != 0: damage /= damageDivisor
        damage = int(damage * ammo_def.get("damage_multiplier", 1.0))
        if ammo_def.get("damage_divisor", 1.0) != 0:
            damage = int(damage / ammo_def.get("damage_divisor", 1.0))
        
        # Vanilla mystery halving
        damage = int(damage / 2)
    
    # Apply weapon special effects for DT reduction (critical armor bypass: leaves 20% DT/DR)
    if weapon:
        special_effects = weapon.get("special_effects", [])
        for effect in special_effects:
            if effect.startswith("ignore_"):
                percent_str = effect.split("_")[1]
                if percent_str.isdigit():
                    ignore_percent = int(percent_str)
                    dt = int(dt * (100 - ignore_percent) / 100)
    
    # Vanilla formula: Apply DT first, then DR
    # NO minimum 1 damage clamp in vanilla
    after_dt = damage - dt
    final_damage = 0
    if after_dt > 0:
        final_damage = int(after_dt * (100 - dr) / 100)
    else:
        final_damage = 0
    
    return final_damage

# Load ammo data from actual JSON
def load_ammo_data():
    json_path = os.path.join(os.path.dirname(__file__), '..', 'data', 'ammo.json')
    with open(json_path, 'r') as f:
        data = json.load(f)
    
    ammo_dict = {}
    for item in data.get("ammo", []):
        ammo_dict[item["item_id"]] = {
            "damage_multiplier": item.get("damage_multiplier", 1.0),
            "damage_divisor": item.get("damage_divisor", 1.0),
            "damage_resistance_modifier": item.get("damage_resistance_modifier", 0),
            "armor_class_modifier": item.get("armor_class_modifier", 0),
            "damage_type_override": item.get("damage_type_override", -1),
        }
    return ammo_dict

AMMO_DATA = load_ammo_data()

# Armor data from armor.json (sample) - now with per-damage-type DT/DR
ARMOR_SAMPLES = {
    "leather_armor": {"damage_resistance": {"0": 15, "1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 15}, "damage_threshold": {"0": 2, "1": 2, "2": 2, "3": 2, "4": 2, "5": 2, "6": 2}},
    "combat_armor": {"damage_resistance": {"0": 35, "1": 20, "2": 10, "3": 20, "4": 20, "5": 15, "6": 35}, "damage_threshold": {"0": 10, "1": 10, "2": 10, "3": 10, "4": 10, "5": 10, "6": 10}},
    "power_armor_mk2": {"damage_resistance": {"0": 65, "1": 50, "2": 40, "3": 50, "4": 50, "5": 45, "6": 65}, "damage_threshold": {"0": 25, "1": 25, "2": 25, "3": 25, "4": 25, "5": 25, "6": 25}},
    "enclave_armor": {"damage_resistance": {"0": 75, "1": 60, "2": 50, "3": 60, "4": 60, "5": 55, "6": 75}, "damage_threshold": {"0": 30, "1": 30, "2": 30, "3": 30, "4": 30, "5": 30, "6": 30}},
}

def test_case(name: str, raw_damage: int, ammo_type: str, armor: dict, expected: int, weapon: dict = None, damage_type: int = 0):
    """Run a single test case."""
    result = calculate_damage_test_vanilla(raw_damage, ammo_type, armor, damage_type, AMMO_DATA, weapon)
    passed = result == expected
    status = "PASS" if passed else "FAIL"
    print(f"  {status}: {name} -> {result} (expected {expected})")
    return passed

def run_tests():
    print("=== Combat System DT/DR & Ammo Tests (VANILLA FALLOUT 2 ALGORITHM) ===\n")
    
    all_passed = True
    
    # Test 1: Standard ammo vs various armors
    # 10mm Standard: mult=1, div=1, dr_mod=0
    # raw=20 -> *1/1=20 -> /2=10
    print("Test 1: Standard 10mm vs Armors (vanilla: mult=1, div=1, dr_mod=0)")
    all_passed &= test_case("Standard 10mm, 20 dmg vs Leather (DT=2, DR=15)", 20, "10mm_standard", ARMOR_SAMPLES["leather_armor"], 6)  # 10-2=8, 8*0.85=6.8->6
    all_passed &= test_case("Standard 10mm, 20 dmg vs Combat (DT=10, DR=35)", 20, "10mm_standard", ARMOR_SAMPLES["combat_armor"], 0)  # 10-10=0 -> 0
    all_passed &= test_case("Standard 10mm, 20 dmg vs T-51b (DT=25, DR=65)", 20, "10mm_standard", ARMOR_SAMPLES["power_armor_mk2"], 0)  # 10-25<0 -> 0
    
    # Test 2: 10mm JHP (vanilla: mult=2, div=1, dr_mod=+25)
    # raw=20 -> *2/1=40 -> /2=20
    print("\nTest 2: 10mm JHP vs Armors (vanilla: mult=2, div=1, dr_mod=+25)")
    all_passed &= test_case("10mm JHP, 20 dmg vs Leather (DT=2, DR=15->40)", 20, "10mm_jhp", ARMOR_SAMPLES["leather_armor"], 10)  # 20-2=18, 18*0.6=10.8->10
    all_passed &= test_case("10mm JHP, 20 dmg vs Combat (DT=10, DR=35->60)", 20, "10mm_jhp", ARMOR_SAMPLES["combat_armor"], 4)  # 20-10=10, 10*0.4=4
    all_passed &= test_case("10mm JHP, 20 dmg vs T-51b (DT=25, DR=65->90)", 20, "10mm_jhp", ARMOR_SAMPLES["power_armor_mk2"], 0)  # 20-25<0 -> 0
    
    # Test 3: 10mm AP (vanilla: mult=1, div=2, dr_mod=-25)
    # raw=20 -> *1/2=10 -> /2=5
    print("\nTest 3: 10mm AP vs Armors (vanilla: mult=1, div=2, dr_mod=-25)")
    all_passed &= test_case("10mm AP, 20 dmg vs Leather (DT=2, DR=15->0)", 20, "10mm_ap", ARMOR_SAMPLES["leather_armor"], 3)  # 5-2=3, 3*1=3
    all_passed &= test_case("10mm AP, 20 dmg vs Combat (DT=10, DR=35->10)", 20, "10mm_ap", ARMOR_SAMPLES["combat_armor"], 0)  # 5-10<0 -> 0
    all_passed &= test_case("10mm AP, 20 dmg vs T-51b (DT=25, DR=65->40)", 20, "10mm_ap", ARMOR_SAMPLES["power_armor_mk2"], 0)  # 5-25<0 -> 0
    
    # Test 4: Higher raw damage with AP
    # raw=40 -> *1/2=20 -> /2=10
    print("\nTest 4: 10mm AP with higher raw damage")
    all_passed &= test_case("10mm AP, 40 dmg vs Combat (DT=10, DR=35->10)", 40, "10mm_ap", ARMOR_SAMPLES["combat_armor"], 0)  # 10-10=0 -> 0
    all_passed &= test_case("10mm AP, 40 dmg vs Leather (DT=2, DR=15->0)", 40, "10mm_ap", ARMOR_SAMPLES["leather_armor"], 8)  # 10-2=8, 8*1=8
    
    # Test 5: .308 AP (vanilla: mult=1, div=2, dr_mod=-25)
    # raw=40 -> *1/2=20 -> /2=10
    print("\nTest 5: .308 AP vs Armors (vanilla: mult=1, div=2, dr_mod=-25)")
    all_passed &= test_case(".308 AP, 40 dmg vs Combat (DT=10, DR=35->10)", 40, "308_ap", ARMOR_SAMPLES["combat_armor"], 0)  # 10-10=0 -> 0
    all_passed &= test_case(".308 AP, 40 dmg vs T-51b (DT=25, DR=65->40)", 40, "308_ap", ARMOR_SAMPLES["power_armor_mk2"], 0)  # 10-25<0 -> 0
    all_passed &= test_case(".308 AP, 40 dmg vs Leather (DT=2, DR=15->0)", 40, "308_ap", ARMOR_SAMPLES["leather_armor"], 8)  # 10-2=8, 8*1=8
    
    # Test 6: 5.56 AP (vanilla: mult=1, div=2, dr_mod=-25)
    # raw=30 -> *1/2=15 -> /2=7
    print("\nTest 6: 5.56 AP vs Armors (vanilla: mult=1, div=2, dr_mod=-25)")
    all_passed &= test_case("5.56 AP, 30 dmg vs Combat (DT=10, DR=35->10)", 30, "556_ap", ARMOR_SAMPLES["combat_armor"], 0)  # 7-10<0 -> 0
    all_passed &= test_case("5.56 AP, 30 dmg vs Leather (DT=2, DR=15->0)", 30, "556_ap", ARMOR_SAMPLES["leather_armor"], 5)  # 7-2=5, 5*1=5
    
    # Test 7: Energy weapons
    # microfusion_cell: mult=1, div=1, dr_mod=0
    # raw=50 -> *1/1=50 -> /2=25
    print("\nTest 7: Microfusion Cell (energy weapons)")
    laser_pistol = {"special_effects": ["ignore_50"]}  # ignore 50% DT
    all_passed &= test_case("Microfusion, 50 dmg vs T-51b (laser_pistol, ignore_50)", 50, "microfusion_cell", ARMOR_SAMPLES["power_armor_mk2"], 6, laser_pistol, 1)  # LASER type=1: DR=50, DT=25->12, dmg=25 -> 25-12=13, 13*0.5=6.5->6
    
    # Test 8: Microfusion overcharge (mult=1.3, div=1, dr_mod=0)
    # raw=50 -> *1.3/1=65 -> /2=32
    all_passed &= test_case("Overcharge, 50 dmg vs T-51b (laser_pistol, ignore_50)", 50, "microfusion_overcharge", ARMOR_SAMPLES["power_armor_mk2"], 10, laser_pistol, 1)  # 32-12=20, 20*0.5=10
    
    # Test 9: Small energy cell
    # raw=30 -> *1/1=30 -> /2=15
    # T-51b LASER: DR=50, DT=25
    # 15-25<0 -> 0
    all_passed &= test_case("Small Energy, 30 dmg vs T-51b", 30, "small_energy_cell", ARMOR_SAMPLES["power_armor_mk2"], 0, None, 1)
    
    # Test 10: Plasma rifle (PLASMA type=2)
    # T-51b PLASMA: DR=40, DT=25
    # microfusion_cell: raw=50 -> 25
    # plasma_rifle: ignore_70 -> DT=25*0.3=7
    # 25-7=18, 18*0.6=10.8->10
    plasma_rifle = {"special_effects": ["ignore_70"]}
    all_passed &= test_case("Plasma 50 dmg vs T-51b (plasma_rifle, ignore_70)", 50, "microfusion_cell", ARMOR_SAMPLES["power_armor_mk2"], 10, plasma_rifle, 2)
    
    # Test 11: Gauss Rifle (ELECTRICAL type=6)
    # T-51b ELECTRICAL: DR=65, DT=25
    # microfusion_overcharge: raw=50 -> 32
    # gauss_rifle: ignore_80 -> DT=25*0.2=5
    # 32-5=27, 27*0.35=9.45->9
    gauss_rifle = {"special_effects": ["ignore_80"]}
    all_passed &= test_case("Gauss 50 dmg vs T-51b (gauss_rifle, ignore_80)", 50, "microfusion_overcharge", ARMOR_SAMPLES["power_armor_mk2"], 9, gauss_rifle, 6)
    
    # Test 12: 12ga Shotgun variants
    print("\nTest 12: 12ga Shotgun vs Combat Armor")
    # 12ga_buckshot: mult=1, div=1, dr_mod=0 -> raw=30 -> 15
    # Combat NORMAL: DR=35, DT=10
    # 15-10=5, 5*0.65=3.25->3
    all_passed &= test_case("Buckshot, 30 dmg vs Combat", 30, "12ga_buckshot", ARMOR_SAMPLES["combat_armor"], 3)
    # 12ga_slug: mult=1, div=1, dr_mod=0 -> raw=30 -> 15
    # 15-10=5, 5*0.65=3.25->3
    all_passed &= test_case("Slug, 30 dmg vs Combat", 30, "12ga_slug", ARMOR_SAMPLES["combat_armor"], 3)
    # 12ga_dragons_breath: mult=1, div=1, dr_mod=0, damage_type_override=2 (FIRE)
    # raw=30 -> 15
    # Combat FIRE (type 2): DR=10, DT=10
    # 15-10=5, 5*0.9=4.5->4
    all_passed &= test_case("Dragon's Breath, 30 dmg vs Combat (FIRE)", 30, "12ga_dragons_breath", ARMOR_SAMPLES["combat_armor"], 4)
    
    # Test 13: Zero damage allowed (key vanilla behavior)
    print("\nTest 13: Zero Damage Allowed (Vanilla Behavior)")
    all_passed &= test_case("Zero raw damage", 0, "10mm_standard", ARMOR_SAMPLES["leather_armor"], 0)
    all_passed &= test_case("Armor DR=100%", 20, "10mm_standard", {"damage_resistance": {"0": 100}, "damage_threshold": {"0": 0}}, 0)
    all_passed &= test_case("Armor DT > damage after vanilla calc", 20, "10mm_standard", {"damage_resistance": {"0": 0}, "damage_threshold": {"0": 15}}, 0)  # 20*1/1/2=10, 10-15<0 -> 0
    
    # Test 14: Critical bypass (ignore_80 leaves 20%)
    print("\nTest 14: Critical Bypass (leaves 20% DT/DR)")
    armor = {"damage_threshold": {"0": 20}, "damage_resistance": {"0": 50}}
    weapon_crit = {"special_effects": ["ignore_80"]}
    # raw=30 -> 15, DT=20*0.2=4, DR=50
    # 15-4=11, 11*0.5=5.5->5
    all_passed &= test_case("Critical bypass (ignore_80) DT=20, DR=50", 30, "10mm_standard", armor, 5, weapon_crit)
    
    print(f"\n=== {'ALL TESTS PASSED' if all_passed else 'SOME TESTS FAILED'} ===")
    return all_passed

if __name__ == "__main__":
    success = run_tests()
    sys.exit(0 if success else 1)