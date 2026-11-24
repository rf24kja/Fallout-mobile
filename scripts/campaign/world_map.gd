class_name WorldMap
extends Node

## preload() constants keep cross-references working even in headless --script
## mode where the global_script_class_cache has not been rebuilt yet.
const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")

## Travel graph over campaign locations loaded from the importer JSON.
##
## Each normalized location record:
##   { id, name, region, map_file, exits:[String], npcs:[String],
##     items:[String], enemies:[String], is_interior:bool,
##     discovered:bool, visited:bool, travel_hours:float,
##     gates:[String or {key,value}] }
##
## The graph is undirected: an exit declared on A toward B makes A<->B
## traversable unless a world-state gate blocks the edge. This mirrors the
## "bidirectional edge check + world_state gates" contract without requiring
## redundant declarations on both ends.

signal location_traveled(to_id: String)
signal travel_blocked(from_id: String, to_id: String, reason: String)

const ALIASES := {
	"id": ["id", "pid", "proto_id", "location_id"],
	"name": ["name", "title"],
	"region": ["region", "area"],
	"map_file": ["map_file", "map", "source", "scene", "scene_path"],
	"exits": ["exits", "connections", "links"],
	"npcs": ["npcs", "critters", "characters"],
	"items": ["items", "loot"],
	"enemies": ["enemies", "hostiles"],
	"gates": ["gates", "requires", "required_world_state", "unlocks"],
	"travel_hours": ["travel_hours", "hours", "travel_time", "cost_hours"],
	"is_interior": ["is_interior", "interior"],
}

var _locations: Dictionary = {}  # id -> record
var _order: Array[String] = []   # insertion order for stable get_all_locations
var _current_id: String = ""

# Cached autoload references; resolved lazily so this script also works when
# instantiated as a plain Node in a test scene outside the autoload tree.
var _gm: Node = null
var _eb: Node = null


func _ready() -> void:
	_resolve_nodes()


func _resolve_nodes() -> void:
	if _gm == null or not is_instance_valid(_gm):
		_gm = get_node_or_null("/root/GameManager")
	if _eb == null or not is_instance_valid(_eb):
		_eb = get_node_or_null("/root/EventBus")


## Build the graph from loader output plus (optional) map index records.
## `maps` is accepted for forward compatibility: map entries whose id matches
## a location can supply a default map_file / dimensions without duplicating
## data. Neither input is allowed to crash on missing fields.
func build_from_data(locations: Array, maps: Array = []) -> void:
	_resolve_nodes()
	_locations.clear()
	_order.clear()

	var map_by_id: Dictionary = {}
	for m in maps:
		if not (m is Dictionary):
			continue
		var md: Dictionary = m
		var mid := _str(CampaignLoader.normalize_record(md, {"id": ["id", "pid", "proto_id", "map_id"]}).get("id", ""))
		if mid.is_empty():
			continue
		map_by_id[mid] = md

	for raw in locations:
		if not (raw is Dictionary):
			continue
		var rec := CampaignLoader.normalize_record(raw, ALIASES)
		var id := _str(rec.get("id", ""))
		if id.is_empty():
			continue
		if not _locations.has(id):
			_order.append(id)

		var map_file := _str(rec.get("map_file", ""))
		if map_file.is_empty() and map_by_id.has(id):
			var mrec := CampaignLoader.normalize_record(map_by_id[id], ALIASES)
			map_file = _str(mrec.get("map_file", ""))
		rec["map_file"] = map_file
		rec["id"] = id
		rec["exits"] = _string_array(rec.get("exits", []))
		rec["npcs"] = _string_array(rec.get("npcs", []))
		rec["items"] = _string_array(rec.get("items", []))
		rec["enemies"] = _string_array(rec.get("enemies", []))
		rec["gates"] = _as_array(rec.get("gates", []))
		rec["is_interior"] = bool(rec.get("is_interior", false))
		rec["travel_hours"] = _safe_float(rec.get("travel_hours", 2.0), 2.0)
		rec["discovered"] = bool(rec.get("discovered", false))
		rec["visited"] = bool(rec.get("visited", false))
		_locations[id] = rec

	# Re-hydrate persisted visited/discovered state if available.
	load_save_data(_read_world_state())


func get_location(id: String) -> Dictionary:
	if _locations.has(id):
		return _locations[id]
	return {}


func get_all_locations() -> Array:
	var result: Array = []
	for id in _order:
		result.append(_locations[id].duplicate(true))
	return result


func get_all_ids() -> Array:
	return _order.duplicate()


func get_exits(id: String) -> Array:
	if not _locations.has(id):
		return []
	return _string_array(_locations[id].get("exits", []))


func get_current_id() -> String:
	return _current_id


## Undirected reachability. A declared exit either direction is enough.
## World-state gates on the *destination* can veto travel.
func can_travel(from_id: String, to_id: String) -> bool:
	if from_id == to_id:
		return true  # staying put is always possible
	if not _locations.has(from_id) or not _locations.has(to_id):
		return false

	var forward := _string_array(_locations[from_id].get("exits", []))
	var reverse := _string_array(_locations[to_id].get("exits", []))
	var linked: bool = forward.has(to_id) or reverse.has(from_id)
	if not linked:
		return false

	var blocked := _gate_reason(to_id)
	if not blocked.is_empty():
		travel_blocked.emit(from_id, to_id, blocked)
		return false
	return true


## Move the player to `to_id`. Updates GameManager, world state, save blob and
## emits the location_reached event that QuestManager listens for.
func travel_to(to_id: String) -> bool:
	_resolve_nodes()
	if not _locations.has(to_id):
		return false
	var from_id := _current_id
	if not from_id.is_empty() and not can_travel(from_id, to_id):
		return false

	var rec: Dictionary = _locations[to_id]
	rec["visited"] = true
	rec["discovered"] = true
	_current_id = to_id

	if _gm != null:
		_gm.current_map = _scene_path_for(rec)
		_gm.set_world_state("location_" + to_id, true)
		var hours := float(rec.get("travel_hours", 2.0))
		if hours > 0.0:
			_gm.advance_time(hours)
		_write_world_state()

	_emit_location_reached(to_id)
	location_traveled.emit(to_id)
	return true


func _scene_path_for(rec: Dictionary) -> String:
	var path := _str(rec.get("map_file", ""))
	if path.is_empty():
		return ""
	if path.begins_with("res://") or path.begins_with("user://"):
		return path
	# `current_map` is a string identifier used by GameManager.scene changes.
	# Keep a bare identifier bare; consumers resolve it to a scene path.
	return path


## Emit defensively: EventBus in this project does not declare
## `location_reached` at compile time (checked 2026-11-24), so register it as a
## user signal once before emitting. No SCRIPT ERROR for an unknown signal.
func _emit_location_reached(id: String) -> void:
	if _eb == null:
		return
	if not _eb.has_signal("location_reached"):
		if not _eb.has_method("add_user_signal"):
			return
		_eb.add_user_signal("location_reached")
	# QuestManager's REACH handler emits reward signals on completion; the
	# current EventBus does not declare them, so register defensively here too.
	for _sig in ["money_gained", "item_gained", "reputation_changed", "perk_granted"]:
		if not _eb.has_signal(_sig):
			_eb.add_user_signal(_sig)
	if _eb.has_method("emit"):
		_eb.emit("location_reached", [id])
	elif _eb.has_method("emit_signal"):
		_eb.emit_signal("location_reached", id)


func _gate_reason(to_id: String) -> String:
	var rec: Dictionary = _locations.get(to_id, {})
	var gates: Array = _as_array(rec.get("gates", rec.get("requires", [])))
	for gate in gates:
		if gate is Dictionary:
			var key := _str(gate.get("key", gate.get("id", "")))
			if key.is_empty():
				continue
			var expected: Variant = gate.get("value", true)
			if _world_state_value(key) != expected:
				return key
		else:
			var key := _str(gate)
			if key.is_empty():
				continue
			if not _world_state_true(key):
				return key
	return ""


func _world_state_true(key: String) -> bool:
	if _gm == null:
		return false
	return bool(_gm.get_world_state(key, false))


func _world_state_value(key: String) -> Variant:
	if _gm == null:
		return null
	return _gm.get_world_state(key, null)


func get_save_data() -> Dictionary:
	var visited: Array = []
	var discovered: Array = []
	for id in _order:
		if bool(_locations[id].get("visited", false)):
			visited.append(id)
		if bool(_locations[id].get("discovered", false)):
			discovered.append(id)
	return {
		"current": _current_id,
		"visited": visited,
		"discovered": discovered,
	}


func load_save_data(d: Dictionary) -> void:
	if not (d is Dictionary) or d.is_empty():
		return
	var visited: Array = _string_array(d.get("visited", []))
	var discovered: Array = _string_array(d.get("discovered", []))
	for id in visited:
		if _locations.has(id):
			_locations[id]["visited"] = true
			_locations[id]["discovered"] = true
	for id in discovered:
		if _locations.has(id):
			_locations[id]["discovered"] = true
	var current := _str(d.get("current", ""))
	if _locations.has(current):
		_current_id = current


func _read_world_state() -> Dictionary:
	if _gm == null:
		return {}
	var v: Variant = _gm.get_world_state("campaign_locations", {})
	return v if v is Dictionary else {}


func _write_world_state() -> void:
	if _gm == null:
		return
	var blob := get_save_data()
	# `visited` / `discovered` live inside campaign_locations as arrays plus a
	# per-location flag for save/load roundtrip.
	for id in _string_array(blob.get("visited", [])):
		_gm.set_world_state("location_" + id, true)
	_gm.set_world_state("campaign_locations", blob)


static func _str(v: Variant) -> String:
	if v == null:
		return ""
	if v is String:
		return v
	return str(v)


## Numeric conversion that never throws on importer fields that may be arrays,
## dictionaries, or otherwise non-numeric (real data is still being iterated on).
static func _safe_float(v: Variant, default: float) -> float:
	if v is float or v is int:
		return float(v)
	if v is String:
		var f: float = v.to_float()
		return f if not is_nan(f) else default
	return default


static func _as_array(v: Variant) -> Array:
	if v is Array:
		return v
	if v == null:
		return []
	return [v]


static func _string_array(v: Variant) -> Array:
	var result: Array = []
	for item in _as_array(v):
		var s := _str(item)
		if not s.is_empty():
			result.append(s)
	return result
