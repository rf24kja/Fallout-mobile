class_name ItemDefinition
extends Resource

## Data definition for an item type.
## Separates static item properties from runtime instances.

## Common properties
@export var item_id: String = ""
@export var display_name: String = "Item"
@export var description: String = ""
@export var category: ItemCategory = ItemCategory.MISC
@export var icon_path: String = ""
@export var weight: float = 0.1
@export var value: int = 1
@export var is_stackable: bool = true
@export var max_stack_size: int = 99
@export var is_quest_item: bool = false
@export var is_usable: bool = false
@export var use_effect: String = ""

## Weapon properties
@export var weapon_class: WeaponClass = WeaponClass.MELEE
@export var damage_type: DamageType = DamageType.NORMAL
@export var damage_min: int = 0
@export var damage_max: int = 0
@export var attack_modes: Array[String] = ["NORMAL"]
@export var ap_cost: int = 4
@export var range: float = 1.5
@export var magazine_capacity: int = 0
@export var compatible_ammo: Array[String] = []
@export var default_ammo: String = ""
@export var reload_ap_cost: int = 2
@export var skill_required: String = ""
@export var skill_min_level: int = 0
@export var accuracy_modifier: float = 0.0
@export var crit_chance_bonus: int = 0
@export var crit_multiplier: float = 2.0
@export var burst_shots: int = 0
@export var burst_accuracy_penalty: float = 0.0
@export var aimed_ap_multiplier: float = 1.5
@export var equipment_slot: EquipmentSlot = EquipmentSlot.WEAPON_MELEE
@export var visual_asset: String = ""
@export var animation_set: String = ""
@export var special_effects: Array[String] = []

## Armor properties
@export var armor_type: ArmorType = ArmorType.BODY
@export var damage_threshold: Dictionary = {}
@export var damage_resistance: Dictionary = {}
@export var stealth_modifier: int = 0
@export var radiation_resistance: int = 0
@export var poison_resistance: int = 0
@export var energy_resistance: int = 0
@export var fire_resistance: int = 0
@export var explosive_resistance: int = 0
@export var special_properties: Array[String] = []
@export var required_might: int = 1
@export var overlay_asset: String = ""

## Ammo properties
@export var caliber: String = ""
@export var ammo_class: AmmoClass = AmmoClass.STANDARD
@export var compatible_weapons: Array[String] = []
@export var damage_modifier: float = 1.0
@export var dt_modifier: float = 1.0
@export var dr_modifier: float = 1.0
@export var damage_type_override: int = -1
@export var special_effect: String = "NONE"
@export var effect_magnitude: float = 0.0
@export var pellet_count: int = 1
@export var spread_angle: float = 0.0
@export var rechargeable: bool = false
@export var capacity: int = 0
@export var weapon_damage_chance: float = 0.0

enum ItemCategory {
	WEAPON,
	ARMOR,
	CONSUMABLE,
	AMMO,
	QUEST,
	MISC,
	KEY
}

enum WeaponClass {
	MELEE,
	PISTOL,
	SMG,
	SHOTGUN,
	RIFLE,
	HEAVY,
	ENERGY
}

enum DamageType {
	NORMAL,
	LASER,
	PLASMA,
	ELECTRICAL,
	FIRE,
	EXPLOSIVE,
	MELEE
}

enum ArmorType {
	BODY,
	HELMET
}

enum EquipmentSlot {
	WEAPON_MELEE,
	WEAPON_PRIMARY,
	WEAPON_TWO_HANDED,
	ARMOR_BODY,
	ARMOR_HEAD
}

enum AmmoClass {
	STANDARD,
	JHP,
	AP,
	INCENDIARY,
	MICROFUSION,
	SMALL_ENERGY
}

func _validate_property(property: Dictionary) -> void:
	if item_id == "":
		push_error("ItemDefinition requires non-empty item_id")

func create_instance(amount: int = 1) -> Dictionary:
	return {
		"item_id": item_id,
		"amount": clamp(amount, 1, max_stack_size if is_stackable else 1),
		"instance_id": _generate_instance_id()
	}

func _generate_instance_id() -> String:
	return item_id + "_" + str(Time.get_unix_time_from_system()) + "_" + str(randi())

func get_effective_damage(ammo: ItemDefinition = null) -> Vector2i:
	var min_dmg = damage_min
	var max_dmg = damage_max
	if ammo:
		min_dmg = int(min_dmg * ammo.damage_modifier)
		max_dmg = int(max_dmg * ammo.damage_modifier)
	return Vector2i(min_dmg, max_dmg)

func get_effective_dt(ammo: ItemDefinition = null) -> float:
	if ammo:
		return dt_modifier * ammo.dt_modifier
	return 1.0

func get_effective_dr(ammo: ItemDefinition = null) -> float:
	if ammo:
		return dr_modifier * ammo.dr_modifier
	return 1.0

func is_energy_weapon() -> bool:
	return weapon_class == WeaponClass.ENERGY

func is_ranged() -> bool:
	return weapon_class != WeaponClass.MELEE

func can_use_ammo(ammo_id: String) -> bool:
	return compatible_ammo.has(ammo_id) or compatible_ammo.size() == 0

func get_attack_modes() -> Array[String]:
	return attack_modes.duplicate()