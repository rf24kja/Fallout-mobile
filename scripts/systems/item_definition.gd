class_name ItemDefinition
extends Resource

## Data definition for an item type.
## Separates static item properties from runtime instances.

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

enum ItemCategory {
	WEAPON,
	ARMOR,
	CONSUMABLE,
	AMMO,
	QUEST,
	MISC,
	KEY
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