class_name CampaignLoader
extends RefCounted

## Defensive adapter for the JSON emitted by tools/fallout2_import/.
##
## The importer is a separate component and may be mid-write while this engine
## is used. This loader therefore NEVER assumes a file exists, NEVER assumes a
## particular record shape and NEVER pushes an error for a missing optional file.
## It reads only GITIGNORED data (<project>/.local/generated/ or
## user://fallout2_data/); no licensed original text is ever stored in a
## tracked file by this layer.
##
## Files consumed (all optional):
##   items.json, critters.json, quests.json, locations.json,
##   maps_index.json, dialog_index.json, manifest.json
##
## JSON may be either a top-level Array, or { "records": [ ... ] } / { "data":
## [ ... ] } / { "items": [ ... ] } (any array-valued key is accepted as a
## fallback). Individual field names are normalized via `normalize_record`.

const DEFAULT_GENERATED_PATH := "res://.local/generated/"
const FALLBACK_USER_PATH := "user://fallout2_data/"

const FILE_KEYS := {
	"items": "items.json",
	"critters": "critters.json",
	"quests": "quests.json",
	"locations": "locations.json",
	"maps": "maps_index.json",
	"dialogues": "dialog_index.json",
	"manifest": "manifest.json",
}

## Where the last successful load actually read from ("" when unavailable).
var _source: String = ""
## Last loaded data, kept so has_original_data()/get_summary() can be queried
## after load_all() without re-reading the disk.
var _data: Dictionary = {}


## Try, in order: res://.local/generated/, user://fallout2_data/, then the
## caller-supplied absolute base_path. The first directory that yields at least
## one recognized input file wins; sources are merged otherwise empty.
##
## `only_explicit` restricts loading to just `base_path` (used by the synthetic
## fixture test so it is deterministic even when real importer data exists).
func load_all(base_path: String = "", only_explicit: bool = false) -> Dictionary:
	var candidates: Array[String] = []
	if not only_explicit:
		candidates = [DEFAULT_GENERATED_PATH, FALLBACK_USER_PATH]
	if not base_path.strip_edges().is_empty():
		var normalized := base_path
		if not normalized.ends_with("/"):
			normalized += "/"
		candidates.append(normalized)

	var errors: Array = []
	var best: Dictionary = {}
	var best_source: String = ""
	var best_count := 0

	for base in candidates:
		var result := _load_from(base)
		var count: int = result.get("_file_count", 0)
		if count > best_count:
			best = result
			best_source = base
			best_count = count
			# A complete set means there is no reason to check other paths.
			if count >= FILE_KEYS.size():
				break
		for e in result.get("errors", []):
			errors.append(str(e))

	var records: Dictionary = best.get("data", {})
	if not (records is Dictionary):
		records = {}
	var available: bool = best_count > 0
	_source = best_source if available else ""
	_data = {
		"available": available,
		"source": _source,
		"items": _array_of(records.get("items", [])),
		"critters": _array_of(records.get("critters", [])),
		"quests": _array_of(records.get("quests", [])),
		"locations": _array_of(records.get("locations", [])),
		"maps": _array_of(records.get("maps", [])),
		"dialogues": _array_of(records.get("dialogues", [])),
		"manifest": records.get("manifest", {}) if records.get("manifest", {}) is Dictionary else {},
		"errors": errors,
	}
	return _data.duplicate(true)


func _load_from(base: String) -> Dictionary:
	var out: Dictionary = {}
	var errors: Array = []
	var count := 0
	for key in FILE_KEYS:
		var filename: String = FILE_KEYS[key]
		var path := base + filename
		if not FileAccess.file_exists(path):
			continue  # Missing optional input is normal — stay silent.
		var text := FileAccess.get_file_as_string(path)
		if text.is_empty():
			errors.append("Empty JSON file: " + path)
			continue
		var parsed: Variant = JSON.parse_string(text)
		if parsed == null:
			errors.append("Malformed JSON: " + path)
			continue
		count += 1
		if key == "manifest":
			out[key] = parsed if parsed is Dictionary else {}
		else:
			out[key] = _extract_records(parsed)
	return {"_file_count": count, "errors": errors, "data": out}


## unwrap an array, or find the first array value in an object wrapper.
static func _extract_records(parsed: Variant) -> Array:
	if parsed is Array:
		return parsed
	if parsed is Dictionary:
		for key in ["records", "data", "items", "entries", "results"]:
			if parsed.has(key) and parsed[key] is Array:
				return parsed[key]
		for v in parsed.values():
			if v is Array:
				return v
	return []


func _array_of(value: Variant) -> Array:
	if value is Array:
		return value
	return []


## Copy `d` to a new Dictionary in which every output key listed in `aliases`
## (out_key -> [accepted input keys]) is populated from the first matching input
## key. The output always contains all out_keys, with an empty/neutral default,
## so callers can index freely. Unknown fields from `d` are preserved.
static func normalize_record(d: Dictionary, aliases: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in d.keys():
		out[k] = d[k]
	for out_key in aliases:
		var candidates: Array = aliases[out_key]
		if not (candidates is Array):
			candidates = [candidates]
		var found := false
		for candidate in candidates:
			if d.has(candidate) and d[candidate] != null:
				out[out_key] = d[candidate]
				found = true
				break
		if not found and not out.has(out_key):
			var key := str(out_key)
			var array_keys := ["exits", "connections", "npcs", "critters", "items",
				"enemies", "objectives", "choices", "lines", "nodes", "options", "consequences"]
			var bool_keys := ["is_interior", "discovered", "visited", "hidden"]
			var string_keys := ["id", "pid", "proto_id", "name", "title",
				"description", "desc", "text", "message", "map", "map_file",
				"source", "region", "speaker_id", "node_id", "next_node",
				"target", "type", "condition_type", "consequence_type",
				"quest_id", "quest_flag", "stat_name", "item_id", "world_state_key"]
			if array_keys.has(key):
				out[out_key] = []
			elif bool_keys.has(key):
				out[out_key] = false
			elif string_keys.has(key):
				out[out_key] = ""
			else:
				out[out_key] = 0 if key.ends_with("_id") else null
	return out


## True when at least one recognized JSON input file was found on the last
## load_all() call. Loading synthetic fixtures set this to true as well —
## callers that must distinguish "real" data can check `source`.
func has_original_data() -> bool:
	return bool(_data.get("available", false))


func get_summary() -> Dictionary:
	return {
		"available": bool(_data.get("available", false)),
		"source": _source,
		"items": _array_of(_data.get("items", [])).size(),
		"critters": _array_of(_data.get("critters", [])).size(),
		"quests": _array_of(_data.get("quests", [])).size(),
		"locations": _array_of(_data.get("locations", [])).size(),
		"maps": _array_of(_data.get("maps", [])).size(),
		"dialogues": _array_of(_data.get("dialogues", [])).size(),
		"errors": _array_of(_data.get("errors", [])).size(),
	}
