class_name Inventory
extends Node

## Player inventory management.
## Handles adding, removing, stacking, and querying items.

signal inventory_changed
signal item_added(item_instance: Dictionary)
signal item_removed(item_id: String, amount: int)
signal capacity_exceeded(item_instance: Dictionary)
signal item_equipped(slot: String, item_instance: Dictionary)
signal item_unequipped(slot: String, item_instance: Dictionary)

@export var max_weight: float = 200.0
@export var max_slots: int = 30

var items: Array[Dictionary] = []  # Array of item instances
var _item_database

# Equipment slots (Fallout-style)
var equipment: Dictionary = {
	"weapon_primary": null,
	"weapon_secondary": null,
	"body": null,
	"head": null,
	"eyes": null,
	"hands": null,
	"feet": null,
	"accessory_1": null,
	"accessory_2": null,
}

# Slot-to-equipment-type mapping for validation
const EQUIPMENT_SLOT_TYPES: Dictionary = {
	"weapon_primary": ["WEAPON_PRIMARY", "WEAPON_TWO_HANDED"],
	"weapon_secondary": ["WEAPON_PRIMARY", "WEAPON_MELEE"],
	"body": ["ARMOR_BODY"],
	"head": ["ARMOR_HEAD"],
	"eyes": ["ARMOR_HEAD"],  # Glasses, goggles, gas mask
	"hands": ["ARMOR_BODY"],  # Gloves
	"feet": ["ARMOR_BODY"],   # Boots
	"accessory_1": ["ARMOR_BODY", "ARMOR_HEAD"],
	"accessory_2": ["ARMOR_BODY", "ARMOR_HEAD"],
}

func _ready() -> void:
	_item_database = get_node_or_null("/root/ItemDatabase")

func add_item(item_instance: Dictionary) -> bool:
	if not _validate_instance(item_instance):
		push_error("Invalid item instance")
		return false
	
	var def = _item_database.get_item(item_instance.item_id)
	if not def:
		push_error("Unknown item: ", item_instance.item_id)
		return false
	
	# Check weight capacity
	var current_weight = get_total_weight()
	var added_weight = def.weight * item_instance.amount
	if current_weight + added_weight > max_weight:
		capacity_exceeded.emit(item_instance)
		return false
	
	# Try to stack
	if def.is_stackable:
		for existing in items:
			if existing.item_id == item_instance.item_id:
				var space = def.max_stack_size - existing.amount
				if space > 0:
					var add_amount = min(space, item_instance.amount)
					existing.amount += add_amount
					item_instance.amount -= add_amount
					inventory_changed.emit()
					item_added.emit(existing)
					if item_instance.amount <= 0:
						return true
	
	# Add as new stack
	if items.size() >= max_slots:
		capacity_exceeded.emit(item_instance)
		return false
	
	items.append(item_instance)
	inventory_changed.emit()
	item_added.emit(item_instance)
	return true

func remove_item(item_id: String, amount: int = 1) -> int:
	var removed = 0
	for i in range(items.size() - 1, -1, -1):
		var instance = items[i]
		if instance.item_id == item_id:
			var take = min(amount - removed, instance.amount)
			instance.amount -= take
			removed += take
			
			if instance.amount <= 0:
				items.remove_at(i)
			
			if removed >= amount:
				break
	
	if removed > 0:
		inventory_changed.emit()
		item_removed.emit(item_id, removed)
	
	return removed

func has_item(item_id: String, amount: int = 1) -> bool:
	var total = 0
	for instance in items:
		if instance.item_id == item_id:
			total += instance.amount
			if total >= amount:
				return true
	return false

func get_item_count(item_id: String) -> int:
	var total = 0
	for instance in items:
		if instance.item_id == item_id:
			total += instance.amount
	return total

func get_item_instance(item_id: String) -> Variant:
	for instance in items:
		if instance.item_id == item_id:
			return instance
	return null

func get_items() -> Array[Dictionary]:
	return items.duplicate(true)

func get_total_weight() -> float:
	var total = 0.0
	for instance in items:
		var def = _item_database.get_item(instance.item_id)
		if def:
			total += def.weight * instance.amount
	# Add equipped items weight
	for slot in equipment:
		var equipped = equipment[slot]
		if equipped:
			var def = _item_database.get_item(equipped.item_id)
			if def:
				total += def.weight * equipped.amount
	return total

func get_used_slots() -> int:
	return items.size()

func get_available_weight() -> float:
	return max_weight - get_total_weight()

func get_available_slots() -> int:
	return max_slots - items.size()

func clear() -> void:
	items.clear()
	inventory_changed.emit()

# Equipment System
func can_equip(slot: String, item_instance: Dictionary) -> bool:
	if not equipment.has(slot):
		push_error("Invalid equipment slot: ", slot)
		return false
	
	if not item_instance:
		return true  # Can always unequip
	
	var def = _item_database.get_item(item_instance.item_id)
	if not def:
		return false
	
	# Check slot compatibility
	var allowed_types = EQUIPMENT_SLOT_TYPES.get(slot, [])
	if allowed_types:
		var item_slot = str(def.equipment_slot)
		if item_slot not in allowed_types:
			return false
	
	# Check if slot is already occupied
	if equipment[slot] and equipment[slot].item_id == item_instance.item_id:
		return false  # Already equipped this exact instance
	
	return true

func equip_item(slot: String, item_instance: Dictionary) -> bool:
	if not can_equip(slot, item_instance):
		return false
	
	# Remove from inventory first
	if item_instance:
		if not has_item(item_instance.item_id, item_instance.amount):
			return false
		remove_item(item_instance.item_id, item_instance.amount)
	
	# Unequip current item if any
	var old_item = equipment[slot]
	if old_item:
		# Add old item back to inventory
		add_item(old_item)
	
	# Equip new item
	equipment[slot] = item_instance.duplicate(true) if item_instance else null
	inventory_changed.emit()
	
	if item_instance:
		item_equipped.emit(slot, item_instance)
	else:
		item_unequipped.emit(slot, old_item)
	
	return true

func unequip_item(slot: String) -> Dictionary:
	if not equipment.has(slot):
		push_error("Invalid equipment slot: ", slot)
		return null
	
	var old_item = equipment[slot]
	if not old_item:
		return null
	
	# Try to add back to inventory
	if add_item(old_item):
		equipment[slot] = null
		inventory_changed.emit()
		item_unequipped.emit(slot, old_item)
		return old_item
	else:
		push_error("Cannot unequip: inventory full")
		return null

func get_equipped(slot: String) -> Dictionary:
	return equipment.get(slot, null)

func get_all_equipped() -> Dictionary:
	return equipment.duplicate(true)

func get_equipped_bonuses() -> Dictionary:
	"""Calculate total stat bonuses from equipped items"""
	var bonuses = {
		"damage_threshold": 0,
		"damage_resistance": 0,
		"stealth_modifier": 0,
		"radiation_resistance": 0,
		"poison_resistance": 0,
		"energy_resistance": 0,
		"fire_resistance": 0,
		"explosive_resistance": 0,
		"strength": 0,
		"perception": 0,
		"endurance": 0,
		"charisma": 0,
		"intelligence": 0,
		"agility": 0,
		"luck": 0,
		"action_points": 0,
		"carry_weight": 0,
		"special_properties": [],
	}
	
	for slot in equipment:
		var item_instance = equipment[slot]
		if item_instance:
			var def = _item_database.get_item(item_instance.item_id)
			if def:
				# Armor resistances
				bonuses.damage_threshold += def.damage_threshold
				bonuses.damage_resistance += def.damage_resistance
				bonuses.stealth_modifier += def.stealth_modifier
				bonuses.radiation_resistance += def.radiation_resistance
				bonuses.poison_resistance += def.poison_resistance
				bonuses.energy_resistance += def.energy_resistance
				bonuses.fire_resistance += def.fire_resistance
				bonuses.explosive_resistance += def.explosive_resistance
				
				# Special properties
				for prop in def.special_properties:
					if prop not in bonuses.special_properties:
						bonuses.special_properties.append(prop)
	
	return bonuses

func get_save_data() -> Array[Dictionary]:
	var data = {
		"inventory": items.duplicate(true),
		"equipment": {},
	}
	for slot in equipment:
		if equipment[slot]:
			data.equipment[slot] = equipment[slot].duplicate(true)
	return data

func load_save_data(data: Array) -> void:
	items.clear()
	if typeof(data) == TYPE_DICTIONARY:
		# New format with equipment
		for instance in data.get("inventory", []):
			if _validate_instance(instance):
				items.append(instance)
		for slot in data.get("equipment", {}):
			if equipment.has(slot) and data.equipment[slot]:
				equipment[slot] = data.equipment[slot].duplicate(true)
	else:
		# Old format - just inventory array
		for instance in data:
			if _validate_instance(instance):
				items.append(instance)
	inventory_changed.emit()

func _validate_instance(instance: Dictionary) -> bool:
	return instance.has("item_id") and instance.has("amount") and instance.item_id != ""