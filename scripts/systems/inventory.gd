class_name Inventory
extends Node

## Player inventory management.
## Handles adding, removing, stacking, and querying items.

signal inventory_changed
signal item_added(item_instance: Dictionary)
signal item_removed(item_id: String, amount: int)
signal capacity_exceeded(item_instance: Dictionary)

@export var max_weight: float = 200.0
@export var max_slots: int = 30

var items: Array[Dictionary] = []  # Array of item instances
var _item_database

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

func get_save_data() -> Array[Dictionary]:
	return items.duplicate(true)

func load_save_data(data: Array) -> void:
	items.clear()
	for instance in data:
		if _validate_instance(instance):
			items.append(instance)
	inventory_changed.emit()

func _validate_instance(instance: Dictionary) -> bool:
	return instance.has("item_id") and instance.has("amount") and instance.item_id != ""