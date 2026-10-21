class_name SaveSystem
extends Node

## Save/Load system using JSON files.
## Stores multiple save slots in user://saves/

const SAVE_DIR = "user://saves/"
const SAVE_EXTENSION = ".save"
const MAX_SLOTS = 10

func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)

func save_game(slot: int, data: Dictionary) -> bool:
	if slot < 0 or slot >= MAX_SLOTS:
		push_error("Invalid save slot: ", slot)
		return false
	
	var file_path = SAVE_DIR + "slot_" + str(slot) + SAVE_EXTENSION
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if not file:
		push_error("Failed to open save file for writing: ", file_path)
		return false
	
	var json_str = JSON.stringify(data, "\t")
	print("SaveSystem.save_game: json_str length = ", json_str.length())
	file.store_string(json_str)
	file.close()
	print("Game saved to slot ", slot)
	return true

func load_game(slot: int):
	if slot < 0 or slot >= MAX_SLOTS:
		push_error("Invalid save slot: ", slot)
		return
	
	var file_path = SAVE_DIR + "slot_" + str(slot) + SAVE_EXTENSION
	if not FileAccess.file_exists(file_path):
		print("Save slot ", slot, " is empty")
		return
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		push_error("Failed to open save file for reading: ", file_path)
		return
	
	var json_str = file.get_as_text()
	file.close()
	
	print("SaveSystem.load_game: json_str length = ", json_str.length())
	if json_str.length() == 0:
		push_error("Save file is empty: ", file_path)
		return
	
	var parse_result = JSON.parse_string(json_str)
	# In Godot 4, JSON.parse_string returns parsed value on success, error dict on failure
	if parse_result is Dictionary and parse_result.has("error"):
		push_error("Failed to parse save file: ", parse_result.get("error_string", "Unknown error"))
		return
	
	# Success - parse_result IS the data
	var data = parse_result
	print("Game loaded from slot ", slot)
	return data

func list_saves():
	var saves = []
	var dir = DirAccess.open(SAVE_DIR)
	if not dir:
		return saves
	
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if file_name.ends_with(SAVE_EXTENSION):
			var slot_str = file_name.trim_prefix("slot_").trim_suffix(SAVE_EXTENSION)
			var slot = slot_str.to_int()
			var file_path = SAVE_DIR + file_name
			var file = FileAccess.open(file_path, FileAccess.READ)
			if file:
				var json_str = file.get_as_text()
				file.close()
				var parse_result = JSON.parse_string(json_str)
				if parse_result.get("error") == OK:
					var data = parse_result.get("result")
					saves.append({
						"slot": slot,
						"player_name": data.get("player", {}).get("name", "Unknown"),
						"level": data.get("player", {}).get("level", 1),
						"map": data.get("map", "unknown"),
						"playtime": data.get("time", 0.0),
						"timestamp": FileAccess.get_modified_time(file_path)
					})
		file_name = dir.get_next()
	dir.list_dir_end()
	
	saves.sort_custom(Callable(self, "_sort_by_timestamp_desc"))
	return saves

func _sort_by_timestamp_desc(a: Dictionary, b: Dictionary) -> int:
	return -1 if a.timestamp > b.timestamp else 1

func delete_save(slot: int) -> bool:
	if slot < 0 or slot >= MAX_SLOTS:
		return false
	var file_path = SAVE_DIR + "slot_" + str(slot) + SAVE_EXTENSION
	if FileAccess.file_exists(file_path):
		return DirAccess.remove_absolute(file_path)
	return false

func quick_save() -> bool:
	var gm = get_node("/root/GameManager")
	return save_game(0, gm.get_save_data())

func quick_load():
	var gm = get_node("/root/GameManager")
	var data = load_game(0)
	if data:
		gm.load_save_data(data)

func has_quick_save() -> bool:
	var file_path = SAVE_DIR + "slot_0" + SAVE_EXTENSION
	return FileAccess.file_exists(file_path)