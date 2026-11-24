class_name CampaignQuests
extends RefCounted

const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")

## Converts imported original quest records into the live QuestManager
## definitions. Nothing is invented: with no imported quests this registers
## zero entries. Original msg text is supplied by the importer, never typed
## into this tracked file.
##
## Documented real patterns from quests.msg (for reference ONLY — registered
## only when the importer provides matching records):
##   - Arroyo GECK: multi-stage retrieval with a CHOICE branch and item reward.
##   - Den Vic debt: TALK/COLLECT chain with a failure condition (Vic dies).
##   - Klamath Torr rescue: REACH + KILL + INVESTIGATE + DELIVER chain.

const ALIASES := {
	"id": ["id", "pid", "proto_id", "quest_id"],
	"title": ["title", "name"],
	"description": ["description", "desc", "text", "message"],
	"stages": ["stages", "objectives", "lines", "steps"],
	"choices": ["choices", "branches", "options"],
	"rewards": ["rewards", "reward"],
	"failure": ["failure_conditions", "failure", "fail_conditions"],
}

var _registered: Array[String] = []

# ObjectiveType values from QuestManager (stable enum order, verified 2026-11-24):
# KILL=0, COLLECT=1, TALK=2, REACH=3, CRAFT=4, DELIVER=5, INVESTIGATE=6, CHOICE=7
const TYPE_KILL := 0
const TYPE_COLLECT := 1
const TYPE_TALK := 2
const TYPE_REACH := 3
const TYPE_CRAFT := 4
const TYPE_DELIVER := 5
const TYPE_INVESTIGATE := 6
const TYPE_CHOICE := 7

const TYPE_BY_NAME := {
	"kill": TYPE_KILL, "collect": TYPE_COLLECT, "talk": TYPE_TALK,
	"reach": TYPE_REACH, "craft": TYPE_CRAFT, "deliver": TYPE_DELIVER,
	"investigate": TYPE_INVESTIGATE, "choice": TYPE_CHOICE,
}

# make_choice() in QuestManager only accepts these hard-coded choice objective
# ids, so imported choice stages must be mapped onto one of them.
const CHOICE_IDS := ["obj_choose_path", "obj_deal_with_raiders", "obj_caravan_fate"]


## QuestManager emits reward signals that the current EventBus does not
## declare. Register them defensively so quest completion never SCRIPT ERRORs.
const EXTRA_EVENTBUS_SIGNALS := [
	"money_gained", "item_gained", "reputation_changed", "perk_granted",
	"location_reached",
]

static func ensure_eventbus_signals(eb) -> void:
	if eb == null or not eb.has_method("add_user_signal"):
		return
	for sig in EXTRA_EVENTBUS_SIGNALS:
		if not eb.has_signal(sig):
			eb.add_user_signal(sig)


func register_original_quests(quests: Array, quest_manager) -> int:
	_registered.clear()
	if quest_manager == null:
		return 0
	if quest_manager is Node:
		ensure_eventbus_signals(quest_manager.get_node_or_null("/root/EventBus"))
	# Guard for the internal dictionary this adapter deliberately extends.
	if not (quest_manager is Node):
		return 0
	if not (quest_manager.has_method("start_quest") and quest_manager.has_method("get_quest_list")):
		return 0
	if not (quest_manager.get("_quests") is Dictionary):
		return 0

	var count := 0
	for raw in quests:
		if not (raw is Dictionary):
			continue
		var rec := CampaignLoader.normalize_record(raw, ALIASES)
		var id := _str(rec.get("id", ""))
		if id.is_empty():
			continue
		var def := _build_definition(id, rec)
		quest_manager._quests[id] = def
		_registered.append(id)
		count += 1
	return count


func get_registered_ids() -> Array:
	return _registered.duplicate()


func _build_definition(id: String, rec: Dictionary) -> Dictionary:
	var objectives: Array = []
	var stages: Variant = rec.get("stages", [])
	if not (stages is Array):
		stages = []
	for i in range(stages.size()):
		var stage: Variant = stages[i]
		var obj := _build_objective(id, stage, i)
		if not obj.is_empty():
			objectives.append(obj)

	# Ensure any imported choices are reachable through a CHOICE objective with
	# one of the ids make_choice() recognizes.
	var choices: Variant = rec.get("choices", [])
	if choices is Array and not choices.is_empty():
		var choice_obj := _build_choice_objective(id, choices, objectives.size())
		if not choice_obj.is_empty():
			objectives.append(choice_obj)

	if objectives.is_empty():
		# Still a real quest from original data — a REACH objective on the
		# location named by the record is a truthful minimal representation.
		objectives.append({
			"id": "obj_reach_" + id, "type": TYPE_REACH,
			"description": _str(rec.get("description", rec.get("title", id))),
			"target": id, "count": 1, "progress": 0, "hidden": false,
		})

	return {
		"id": id,
		"title": _str(rec.get("title", id)),
		"description": _str(rec.get("description", "")),
		"state": 0,  # QuestState.HIDDEN
		"recommended_level": int(_num(rec.get("recommended_level", 1))),
		"objectives": objectives,
		"rewards": _build_rewards(rec.get("rewards", {})),
		"failure_conditions": _as_array(rec.get("failure", [])),
		"giver": _str(rec.get("giver", "")),
		"source": "fallout2_import",
	}


func _build_objective(quest_id: String, stage: Variant, index: int) -> Dictionary:
	var s: Dictionary = {}
	if stage is Dictionary:
		s = stage
	elif stage is String:
		s = {"text": stage}
	else:
		return {}

	var id := _str(s.get("id", s.get("objective_id", "")))
	if id.is_empty():
		id = "obj_%s_%d" % [quest_id, index]

	var type_name := _str(s.get("type", s.get("objective_type", ""))).to_lower()
	var type_id: int = TYPE_BY_NAME.get(type_name, TYPE_INVESTIGATE)
	if type_name.is_empty():
		# Infer from importer-provided target fields when type is absent.
		if s.has("npc") or s.has("npc_id"):
			type_id = TYPE_TALK
		elif s.has("item") or s.has("item_id"):
			type_id = TYPE_COLLECT
		elif s.has("location") or s.has("location_id"):
			type_id = TYPE_REACH
		elif s.has("enemy") or s.has("enemy_id"):
			type_id = TYPE_KILL

	var target := _str(s.get("target", s.get("npc", s.get("npc_id",
		s.get("item", s.get("item_id", s.get("location", s.get("location_id",
		s.get("enemy", s.get("enemy_id", ""))))))))))
	var desc := _str(s.get("description", s.get("desc", s.get("text", s.get("message", id)))))
	var count := maxi(1, int(_num(s.get("count", s.get("amount", 1)), 1.0)))
	var hidden: bool = bool(s.get("hidden", index > 0 and type_id == TYPE_CHOICE))

	return {
		"id": id, "type": type_id, "description": desc,
		"target": target, "count": count, "progress": 0, "hidden": hidden,
	}


func _build_choice_objective(quest_id: String, choices: Array, index: int) -> Dictionary:
	var cid: String = CHOICE_IDS[index % CHOICE_IDS.size()]
	var options: Array = []
	for i in range(choices.size()):
		var raw: Variant = choices[i]
		var c: Dictionary = raw if raw is Dictionary else {"text": str(raw)}
		options.append({
			"id": _str(c.get("id", "choice_%d" % i)),
			"text": _str(c.get("text", c.get("description", c.get("name", str(i))))),
			"requirements": c.get("requirements", {}) if c.get("requirements", {}) is Dictionary else {},
			"next_objective": _str(c.get("next_objective", "")),
			"reputation_change": c.get("reputation_change", {}) if c.get("reputation_change", {}) is Dictionary else {},
		})
	return {
		"id": cid, "type": TYPE_CHOICE,
		"description": "Choice", "target": quest_id,
		"count": 1, "progress": 0, "hidden": false, "choices": options,
	}


func _build_rewards(raw: Variant) -> Dictionary:
	var result := {"xp": 0, "money": 0, "items": {}, "reputation": {}}
	if not (raw is Dictionary):
		return result
	var r: Dictionary = raw
	result["xp"] = int(_num(r.get("xp", r.get("experience", 0))))
	result["money"] = int(_num(r.get("money", r.get("caps", 0))))
	var items: Variant = r.get("items", {})
	if items is Dictionary:
		for k in items:
			result["items"][str(k)] = int(_num(items[k]))
	elif items is Array:
		for entry in items:
			if entry is Dictionary:
				var k := _str(entry.get("id", entry.get("item_id", "")))
				if not k.is_empty():
					result["items"][k] = int(_num(entry.get("count", entry.get("amount", 1))))
	var rep: Variant = r.get("reputation", {})
	if rep is Dictionary:
		for k in rep:
			result["reputation"][str(k)] = int(_num(rep[k]))
	return result


static func _str(v: Variant) -> String:
	if v == null:
		return ""
	return v if v is String else str(v)


static func _num(v: Variant, fallback: float = 0.0) -> float:
	if v is float or v is int:
		return float(v)
	if v is String and (v as String).is_valid_float():
		return float(v)
	return fallback


static func _as_array(v: Variant) -> Array:
	if v is Array:
		return v
	if v == null:
		return []
	return [v]
