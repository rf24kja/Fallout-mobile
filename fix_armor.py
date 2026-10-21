import json

# Load the armor.json file
with open(r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\data\armor.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# DamageType enum mapping:
# NORMAL = 0, LASER = 1, FIRE = 2, PLASMA = 3, ELECTRICAL = 4, EXPLOSIVE = 5, MELEE = 6

def convert_armor(armor):
    """Convert flat damage_threshold/damage_resistance to per-damage-type dictionaries."""
    dt = armor.get("damage_threshold", 0)
    dr = armor.get("damage_resistance", 0)
    
    # Get special resistances
    energy_res = armor.get("energy_resistance", 0)
    fire_res = armor.get("fire_resistance", 0)
    explosive_res = armor.get("explosive_resistance", 0)
    
    # Create per-damage-type dictionaries
    # NORMAL (0): base DT/DR
    # LASER (1): energy resistance for DR, base DT
    # FIRE (2): fire resistance for DR, base DT
    # PLASMA (3): energy resistance for DR, base DT
    # ELECTRICAL (4): energy resistance for DR, base DT
    # EXPLOSIVE (5): explosive resistance for DR, base DT
    # MELEE (6): base DT/DR (melee uses normal DR)
    
    dt_dict = {
        "0": dt,
        "1": dt,
        "2": dt,
        "3": dt,
        "4": dt,
        "5": dt,
        "6": dt
    }
    
    dr_dict = {
        "0": dr,
        "1": energy_res,  # LASER
        "2": fire_res,    # FIRE
        "3": energy_res,  # PLASMA
        "4": energy_res,  # ELECTRICAL
        "5": explosive_res,  # EXPLOSIVE
        "6": dr  # MELEE uses normal DR
    }
    
    armor["damage_threshold"] = dt_dict
    armor["damage_resistance"] = dr_dict
    return armor

# Convert all armor entries
for armor in data["armor"]:
    convert_armor(armor)

# Save back
with open(r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\data\armor.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=2)

print("Armor.json converted successfully!")