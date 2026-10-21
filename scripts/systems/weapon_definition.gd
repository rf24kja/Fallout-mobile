class_name WeaponDefinition
extends ItemDefinition

## Specialized definition for weapons.
## All properties inherited from ItemDefinition.

## Weapon-specific computed properties (not exported, calculated at runtime)

var _effective_damage_cache: Vector2i = Vector2i.ZERO
var _effective_damage_dirty: bool = true

func get_effective_damage_with_ammo(ammo: ItemDefinition = null) -> Vector2i:
	if not _effective_damage_dirty and _effective_damage_cache != Vector2i.ZERO:
		return _effective_damage_cache
	
	_effective_damage_cache = get_effective_damage(ammo)
	_effective_damage_dirty = false
	return _effective_damage_cache

func get_damage_range_string(ammo: ItemDefinition = null) -> String:
	var dmg = get_effective_damage_with_ammo(ammo)
	return str(dmg.x) + "-" + str(dmg.y)

func get_damage_type_name() -> String:
	match damage_type:
		DamageType.NORMAL: return "Normal"
		DamageType.LASER: return "Laser"
		DamageType.PLASMA: return "Plasma"
		DamageType.ELECTRICAL: return "Electrical"
		DamageType.FIRE: return "Fire"
		DamageType.EXPLOSIVE: return "Explosive"
		DamageType.MELEE: return "Melee"
	return "Unknown"

func get_weapon_class_name() -> String:
	match weapon_class:
		WeaponClass.MELEE: return "Melee"
		WeaponClass.PISTOL: return "Pistol"
		WeaponClass.SMG: return "SMG"
		WeaponClass.SHOTGUN: return "Shotgun"
		WeaponClass.RIFLE: return "Rifle"
		WeaponClass.HEAVY: return "Heavy"
		WeaponClass.ENERGY: return "Energy"
	return "Unknown"

func get_ap_cost_string() -> String:
	var modes = get_attack_modes()
	var result = str(ap_cost) + " AP"
	if "AIMED" in modes:
		result += " / " + str(int(ap_cost * aimed_ap_multiplier)) + " AP (Aimed)"
	if "BURST" in modes:
		result += " / " + str(ap_cost + burst_shots) + " AP (Burst)"
	return result

func get_range_string() -> String:
	if is_ranged():
		return str(range) + "m"
	return "Melee"

func can_burst() -> bool:
	return burst_shots > 0 and "BURST" in attack_modes

func can_aim() -> bool:
	return "AIMED" in attack_modes

func is_two_handed() -> bool:
	return equipment_slot == EquipmentSlot.WEAPON_TWO_HANDED

func get_skill_requirement_string() -> String:
	if skill_required == "":
		return "None"
	return skill_required + " " + str(skill_min_level) + "%"

func _validate_property(property: Dictionary) -> void:
	super._validate_property(property)
	if category != ItemCategory.WEAPON:
		push_error("WeaponDefinition must have category WEAPON")
	if weapon_class == WeaponClass.MELEE and magazine_capacity > 0:
		push_warning("Melee weapon has magazine_capacity > 0: " + item_id)
	if magazine_capacity > 0 and compatible_ammo.size() == 0:
		push_warning("Ranged weapon " + item_id + " has no compatible_ammo")

func create_instance(amount: int = 1) -> Dictionary:
	var inst = super.create_instance(amount)
	inst.current_ammo = default_ammo
	inst.current_magazine = magazine_capacity
	inst.condition = 100
	return inst