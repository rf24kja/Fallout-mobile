class_name EventBus
extends Node

## Global event bus for decoupled communication between systems.
## Usage: EventBus.emit("event_name", args) | EventBus.connect("event_name", callable)

signal game_paused
signal game_resumed
signal player_moved(position: Vector2)
signal player_interacted(target: Node)
signal combat_started(enemies: Array[Node])
signal combat_ended(victory: bool)
signal dialogue_started(dialogue_id: String)
signal dialogue_ended
signal inventory_opened
signal inventory_closed
signal item_picked_up(item_id: String, amount: int)
signal item_dropped(item_id: String, amount: int)
signal stats_changed(stat_name: String, new_value: int)
signal level_up(new_level: int, skill_points: int, perk_available: bool)
signal xp_gained(amount: int, total_xp: int)
signal inventory_full
signal quest_updated(quest_id: String, state: String)
signal save_requested(slot: int)
signal load_requested(slot: int)
signal scene_change_requested(scene_path: String)

func emit(event_name: StringName, args: Array = []) -> void:
	var args_array: Array = args
	
	# Emit with individual arguments based on array size
	match args_array.size():
		0: emit_signal(event_name)
		1: emit_signal(event_name, args_array[0])
		2: emit_signal(event_name, args_array[0], args_array[1])
		3: emit_signal(event_name, args_array[0], args_array[1], args_array[2])
		4: emit_signal(event_name, args_array[0], args_array[1], args_array[2], args_array[3])
		5: emit_signal(event_name, args_array[0], args_array[1], args_array[2], args_array[3], args_array[4])
		_: emit_signal(event_name, args_array)  # fallback for many args

func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE:
		# Clean up connections on shutdown
		pass