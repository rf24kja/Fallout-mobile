class_name AmmoDefinition
extends ItemDefinition

## Specialized definition for ammunition.
## All properties inherited from ItemDefinition.

func get_damage_type() -> int:
	if damage_type_override >= 0:
		return damage_type_override
	return ItemDefinition.DamageType.NORMAL

func get_effective_dt_mod(weapon: ItemDefinition = null) -> float:
	var base = dt_modifier
	if weapon and weapon.is_energy_weapon():
		if ammo_class == AmmoClass.MICROFUSION:
			return 0.0  # Energy weapons ignore DT with microfusion
		if ammo_class == AmmoClass.SMALL_ENERGY:
			return 0.5
	return base

func get_effective_dr_mod(weapon: ItemDefinition = null) -> float:
	return dr_modifier

func get_ammo_class_name() -> String:
	match ammo_class:
		AmmoClass.STANDARD: return "Standard"
		AmmoClass.JHP: return "JHP (Hollow Point)"
		AmmoClass.AP: return "AP (Armor Piercing)"
		AmmoClass.INCENDIARY: return "Incendiary"
		AmmoClass.MICROFUSION: return "Microfusion Cell"
		AmmoClass.SMALL_ENERGY: return "Small Energy Cell"
	return "Unknown"

func is_energy_ammo() -> bool:
	return ammo_class in [AmmoClass.MICROFUSION, AmmoClass.SMALL_ENERGY]

func is_conventional() -> bool:
	return not is_energy_ammo()

func get_special_effect_string() -> String:
	match special_effect:
		"NONE": return "None"
		"BLEED": return "Bleed (" + str(effect_magnitude) + "/turn)"
		"IGNITE": return "Ignite (" + str(effect_magnitude) + "% chance)"
		"EMP": return "EMP (" + str(effect_magnitude) + " duration)"
		"EXPLOSIVE": return "Explosive (" + str(effect_magnitude) + " radius)"
		"OVERCHARGE": return "Overcharge (+ " + str(int(effect_magnitude * 100)) + "% dmg)"
	return special_effect

func can_use_in(weapon: ItemDefinition) -> bool:
	if not weapon:
		return false
	return weapon.can_use_ammo(item_id) or weapon.compatible_ammo.size() == 0

func get_pellet_info() -> String:
	if pellet_count > 1:
		return str(pellet_count) + " pellets, " + str(spread_angle) + "° spread"
	return "Single projectile"

func _validate_property(property: Dictionary) -> void:
	super._validate_property(property)
	if category != ItemCategory.AMMO:
		push_error("AmmoDefinition must have category AMMO")
	if caliber == "":
		push_error("AmmoDefinition requires caliber")
	if compatible_weapons.is_empty():
		push_warning("Ammo " + item_id + " has no compatible_weapons")
	if damage_modifier <= 0:
		push_error("Damage modifier must be positive")
	if dt_modifier < 0 or dr_modifier < 0:
		push_error("DT/DR modifiers cannot be negative")

func create_instance(amount: int = 1) -> Dictionary:
	var inst = super.create_instance(amount)
	inst.current_capacity = capacity if rechargeable else 0
	return inst