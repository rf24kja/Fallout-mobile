class_name ItemDatabase
extends Node

## Central registry for all item definitions.

const ItemDefinition = preload("res://scripts/systems/item_definition.gd")

var _items: Dictionary = {}

func _ready() -> void:
	_load_default_items()

func _make_item(props: Dictionary) -> ItemDefinition:
	var item = ItemDefinition.new()
	for key in props:
		item.set(key, props[key])
	return item

func _load_default_items() -> void:
	## Quest Items
	register_item(_make_item({
		"item_id": "power_cell",
		"display_name": "Power Cell",
		"description": "A compact fusion power cell. Still has charge.",
		"category": ItemDefinition.ItemCategory.QUEST,
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
		"category": ItemDefinition.ItemCategory.QUEST,
		"icon_path": "res://assets/ui/icons/water_chip.png",
		"weight": 0.2,
		"value": 1000,
		"is_stackable": false,
		"is_quest_item": true
	}))
	
	## Consumables
	register_item(_make_item({
		"item_id": "stimpak",
		"display_name": "Stimpak",
		"description": "Heals 20-40 HP. Standard wasteland medical supply.",
		"category": ItemDefinition.ItemCategory.CONSUMABLE,
		"icon_path": "res://assets/ui/icons/stimpak.png",
		"weight": 0.5,
		"value": 40,
		"is_stackable": true,
		"max_stack_size": 10,
		"is_usable": true,
		"use_effect": "heal_hp:25"
	}))
	
	register_item(_make_item({
		"item_id": "rad_away",
		"display_name": "RadAway",
		"description": "Reduces radiation level by 50 points.",
		"category": ItemDefinition.ItemCategory.CONSUMABLE,
		"icon_path": "res://assets/ui/icons/rad_away.png",
		"weight": 0.5,
		"value": 60,
		"is_stackable": true,
		"max_stack_size": 10,
		"is_usable": true,
		"use_effect": "reduce_rad:50"
	}))
	
	## Weapons
	register_item(_make_item({
		"item_id": "10mm_pistol",
		"display_name": "10mm Pistol",
		"description": "Standard issue vault security sidearm.",
		"category": ItemDefinition.ItemCategory.WEAPON,
		"icon_path": "res://assets/ui/icons/10mm_pistol.png",
		"weight": 3.0,
		"value": 250,
		"is_stackable": false
	}))
	
	## Misc
	register_item(_make_item({
		"item_id": "scrap_metal",
		"display_name": "Scrap Metal",
		"description": "Useful for repairs and crafting.",
		"category": ItemDefinition.ItemCategory.MISC,
		"icon_path": "res://assets/ui/icons/scrap_metal.png",
		"weight": 2.0,
		"value": 10,
		"is_stackable": true,
		"max_stack_size": 20
	}))

func register_item(item: ItemDefinition) -> void:
	if item.item_id != "":
		_items[item.item_id] = item
	else:
		push_error("Attempted to register item with empty ID")

func get_item(item_id: String) -> ItemDefinition:
	return _items.get(item_id)

func has_item(item_id: String) -> bool:
	return _items.has(item_id)

func get_all_items() -> Array:
	return _items.values()