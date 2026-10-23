class_name ItemDatabase
extends Node

## Central registry for all item definitions.
## Loads from JSON data files for data-driven design.

const ItemDefinition = preload("res://scripts/systems/item_definition.gd")

var _items: Dictionary = {}
var _data_loaded: bool = false

## Helper to convert string enum names from JSON to integer values
func _enum_from_string(value, mapping: Dictionary) -> int:
	if value is String:
		return mapping.get(value, mapping.values()[0])
	elif value is int:
		return value
	return mapping.values()[0]

## Helper to convert array to Array[String] for Godot 4 type safety
func _to_string_array(arr: Array) -> Array[String]:
	var result: Array[String] = []
	for item in arr:
		result.append(str(item))
	return result

func _ready() -> void:
	_load_all_data()

func _load_all_data() -> void:
	if _data_loaded:
		return
	
	_load_items_from_json("res://data/weapons.json")
	_load_items_from_json("res://data/armor.json")
	_load_items_from_json("res://data/ammo.json")
	_load_items_from_json("res://data/healing.json")
	_load_items_from_json("res://data/chems.json")
	_load_items_from_json("res://data/utility.json")
	_load_default_items()
	
	_data_loaded = true
	print("ItemDatabase: Loaded " + str(_items.size()) + " items")

func _load_items_from_json(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	if not file:
		push_error("Failed to load item data: " + path)
		return
	
	var json_text = file.get_as_text()
	file.close()
	
	# JSON.parse_string returns parsed data directly on success
	var data = JSON.parse_string(json_text)
	
	# Determine which key holds the items array
	var key = ""
	if data.has("weapons"):
		key = "weapons"
	elif data.has("armor"):
		key = "armor"
	elif data.has("ammo"):
		key = "ammo"
	elif data.has("healing"):
		key = "healing"
	elif data.has("chems"):
		key = "chems"
	elif data.has("utility"):
		key = "utility"
	else:
		push_error("Invalid JSON structure in " + path)
		return
	
	var items_array = data[key]
	for item_data in items_array:
		var item = _make_item_from_dict(item_data)
		if item:
			register_item(item)

func _make_item_from_dict(data: Dictionary) -> ItemDefinition:
	var item = ItemDefinition.new()
	
	## Common properties
	item.item_id = data.get("item_id", "")
	item.display_name = data.get("display_name", "Item")
	item.description = data.get("description", "")
	item.category = _enum_from_string(data.get("category", "MISC"), {
		"WEAPON": 0, "ARMOR": 1, "CONSUMABLE": 2, "AMMO": 3, "QUEST": 4, "MISC": 5
	})
	item.icon_path = data.get("icon_path", "")
	item.weight = float(data.get("weight", 0.1))
	item.value = int(data.get("value", 1))
	item.is_stackable = data.get("is_stackable", true)
	item.max_stack_size = int(data.get("max_stack_size", 99))
	item.is_quest_item = data.get("is_quest_item", false)
	item.is_usable = data.get("is_usable", false)
	item.use_effect = data.get("use_effect", "")
	
	## Weapon properties
	item.weapon_class = _enum_from_string(data.get("weapon_class", "MELEE"), {
		"MELEE": 0, "SMALL_GUNS": 1, "BIG_GUNS": 2, "ENERGY_WEAPONS": 3, "THROWN": 4, "UNARMED": 5
	})
	item.damage_type = _enum_from_string(data.get("damage_type", "NORMAL"), {
		"NORMAL": 0, "LASER": 1, "PLASMA": 2, "ELECTRICAL": 3, "FIRE": 4, "EXPLOSIVE": 5, "MELEE": 6
	})
	item.damage_min = int(data.get("damage_min", 0))
	item.damage_max = int(data.get("damage_max", 0))
	item.attack_modes = _to_string_array(data.get("attack_modes", ["NORMAL"]))
	item.ap_cost = int(data.get("ap_cost", 4))
	item.range = float(data.get("range", 1.5))
	item.magazine_capacity = int(data.get("magazine_capacity", 0))
	item.compatible_ammo = _to_string_array(data.get("compatible_ammo", []))
	item.default_ammo = data.get("default_ammo", "")
	item.reload_ap_cost = int(data.get("reload_ap_cost", 2))
	item.skill_required = data.get("skill_required", "")
	item.skill_min_level = int(data.get("skill_min_level", 0))
	item.accuracy_modifier = float(data.get("accuracy_modifier", 0.0))
	item.crit_chance_bonus = int(data.get("crit_chance_bonus", 0))
	item.crit_multiplier = float(data.get("crit_multiplier", 2.0))
	item.burst_shots = int(data.get("burst_shots", 0))
	item.burst_accuracy_penalty = float(data.get("burst_accuracy_penalty", 0.0))
	item.aimed_ap_multiplier = float(data.get("aimed_ap_multiplier", 1.5))
	item.equipment_slot = _enum_from_string(data.get("equipment_slot", "WEAPON_MELEE"), {
		"WEAPON_MELEE": 0, "WEAPON_RANGED_TWO_HAND": 1, "WEAPON_RANGED_ONE_HAND": 2, "ARMOR_BODY": 3, "ARMOR_HELMET": 4, "ACCESSORY": 5, "QUICK_ITEM": 6
	})
	item.visual_asset = data.get("visual_asset", "")
	item.animation_set = data.get("animation_set", "")
	item.special_effects = _to_string_array(data.get("special_effects", []))
	
	## Armor properties
	item.armor_type = _enum_from_string(data.get("armor_type", "BODY"), {
		"BODY": 0, "HELMET": 1, "POWER_ARMOR": 2
	})
	
	# Per-damage-type DT/DR dictionaries (keys are string damage type enums "0"-"6")
	var dt_dict = data.get("damage_threshold", {})
	item.damage_threshold = {}
	for key in dt_dict:
		item.damage_threshold[int(key)] = int(dt_dict[key])
	
	var dr_dict = data.get("damage_resistance", {})
	item.damage_resistance = {}
	for key in dr_dict:
		item.damage_resistance[int(key)] = int(dr_dict[key])
	
	item.stealth_modifier = int(data.get("stealth_modifier", 0))
	item.radiation_resistance = int(data.get("radiation_resistance", 0))
	item.poison_resistance = int(data.get("poison_resistance", 0))
	item.energy_resistance = int(data.get("energy_resistance", 0))
	item.fire_resistance = int(data.get("fire_resistance", 0))
	item.explosive_resistance = int(data.get("explosive_resistance", 0))
	item.special_properties = _to_string_array(data.get("special_properties", []))
	item.required_might = int(data.get("required_might", 1))
	item.overlay_asset = data.get("overlay_asset", "")
	
	## Ammo properties
	item.caliber = data.get("caliber", "")
	item.ammo_class = _enum_from_string(data.get("ammo_class", "STANDARD"), {
		"STANDARD": 0, "JHP": 1, "AP": 2, "ENERGY_CELL": 3, "MICROFUSION": 4, "SHOTGUN": 5, "ROCKET": 6, "GRENADE": 7, "FLAME_FUEL": 8
	})
	item.compatible_weapons = _to_string_array(data.get("compatible_weapons", []))
	item.damage_modifier = float(data.get("damage_modifier", 1.0))
	item.dt_modifier = float(data.get("dt_modifier", 1.0))
	item.dr_modifier = float(data.get("dr_modifier", 1.0))
	item.damage_type_override = _enum_from_string(data.get("damage_type_override", "NONE"), {
		"NONE": -1, "NORMAL": 0, "LASER": 1, "PLASMA": 2, "ELECTRICAL": 3, "FIRE": 4, "EXPLOSIVE": 5, "MELEE": 6
	})
	item.special_effect = data.get("special_effect", "NONE")
	item.effect_magnitude = float(data.get("effect_magnitude", 0.0))
	item.pellet_count = int(data.get("pellet_count", 1))
	item.spread_angle = float(data.get("spread_angle", 0.0))
	item.rechargeable = data.get("rechargeable", false)
	item.capacity = int(data.get("capacity", 0))
	item.weapon_damage_chance = float(data.get("weapon_damage_chance", 0.0))
	
	return item

func _load_default_items() -> void:
	## Quest Items
	register_item(_make_item({
		"item_id": "power_cell",
		"display_name": "Power Cell",
		"description": "A compact fusion power cell. Still has charge.",
		"category": 4,  # QUEST
		"icon_path": "res://assets/ui/icons/power_cell.png",
		"weight": 0.5,
		"value": 500,
		"is_stackable": false,
		"is_quest_item": true
	}))
	
	register_item(_make_item({
		"item_id": "vault13_water_chip",
		"display_name": "Water Chip",
		"description": "A water purification controller chip for Vault 13.",
		"category": 4,  # QUEST
		"icon_path": "res://assets/ui/icons/water_chip.png",
		"weight": 0.2,
		"value": 1000,
		"is_stackable": false,
		"is_quest_item": true
	}))

func _make_item(props: Dictionary) -> ItemDefinition:
	var item = ItemDefinition.new()
	for key in props:
		item.set(key, props[key])
	return item

func register_item(item: ItemDefinition) -> void:
	if item.item_id != "":
		if _items.has(item.item_id):
			push_warning("Duplicate item_id: " + item.item_id + " - overwriting")
		_items[item.item_id] = item
	else:
		push_error("Attempted to register item with empty ID")

func get_item(item_id: String) -> ItemDefinition:
	return _items.get(item_id)

func has_item(item_id: String) -> bool:
	return _items.has(item_id)

func get_all_items() -> Array:
	return _items.values()

func get_items_by_category(category: int) -> Array:
	var result = []
	for item in _items.values():
		if item.category == category:
			result.append(item)
	return result

func get_weapons() -> Array:
	return get_items_by_category(0)  # WEAPON

func get_armor() -> Array:
	return get_items_by_category(1)  # ARMOR

func get_ammo() -> Array:
	return get_items_by_category(3)  # AMMO

func get_compatible_ammo(weapon: ItemDefinition) -> Array:
	var result = []
	for ammo in get_ammo():
		if weapon.can_use_ammo(ammo.item_id):
			result.append(ammo)
	return result

func reload_data() -> void:
	_items.clear()
	_data_loaded = false
	_load_all_data()