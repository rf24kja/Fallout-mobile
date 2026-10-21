class_name ArmorDefinition
extends ItemDefinition

## Specialized definition for armor.
## All properties inherited from ItemDefinition.

func get_total_dr() -> int:
	return damage_resistance

func get_total_dt() -> int:
	return damage_threshold

func get_elemental_resistances() -> Dictionary:
	return {
		"radiation": radiation_resistance,
		"poison": poison_resistance,
		"energy": energy_resistance,
		"fire": fire_resistance,
		"explosive": explosive_resistance
	}

func get_resistance_string() -> String:
	var res = get_elemental_resistances()
	var parts = []
	for key in res:
		if res[key] > 0:
			parts.append(key.capitalize() + " " + str(res[key]) + "%")
	if parts.is_empty():
		return "None"
	return ", ".join(parts)

func get_armor_type_name() -> String:
	match armor_type:
		ArmorType.BODY: return "Body"
		ArmorType.HELMET: return "Helmet"
	return "Unknown"

func get_special_properties_string() -> String:
	if special_properties.is_empty():
		return "None"
	return ", ".join(special_properties)

func provides_full_body_protection() -> bool:
	return armor_type == ArmorType.BODY and "sealed" in special_properties

func get_stealth_impact() -> int:
	return stealth_modifier

func _validate_property(property: Dictionary) -> void:
	super._validate_property(property)
	if category != ItemCategory.ARMOR:
		push_error("ArmorDefinition must have category ARMOR")
	if armor_type == ArmorType.HELMET and equipment_slot != EquipmentSlot.ARMOR_HEAD:
		push_error("Helmet must have ARMOR_HEAD equipment slot")
	if armor_type == ArmorType.BODY and equipment_slot != EquipmentSlot.ARMOR_BODY:
		push_error("Body armor must have ARMOR_BODY equipment slot")
	if damage_threshold < 0:
		push_error("Damage threshold cannot be negative")
	if damage_resistance < 0 or damage_resistance > 100:
		push_error("Damage resistance must be 0-100")

func create_instance(amount: int = 1) -> Dictionary:
	var inst = super.create_instance(amount)
	inst.condition = 100
	return inst