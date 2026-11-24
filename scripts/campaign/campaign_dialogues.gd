class_name CampaignDialogues
extends RefCounted

const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")

## Converts imported original dialogue records into live DialogueManager nodes.
## All node/option/condition/consequence text comes from importer output (msg
## lines); nothing is authored here. No data => zero registrations.
##
## Expected per-dialogue record (flexible):
## {
##   id / pid / proto_id,
##   lines / nodes : [ { id, speaker, text / message,
##                       options: [ { id/text, next, conditions:[...],
##                                    consequences:[...] } ],
##                       conditions: [...], consequences: [...] } ]
## }
##
## condition: { type: STAT_CHECK|QUEST_FLAG|ITEM_POSSESSION|QUEST_FLAG_NOT,
##              stat_name, stat_value, quest_id, quest_flag, quest_flag_value,
##              item_id, item_amount }
## consequence: { type: GIVE_ITEM|GIVE_CAPS|SET_QUEST_FLAG|SET_WORLD_STATE|ADD_XP,
##                item_id, item_amount, caps_amount, quest_id, quest_flag,
##                quest_flag_value, world_state_key, world_state_value, xp_amount }

const DialogueTypes = preload("res://scripts/systems/dialogue_types.gd")

const ALIASES := {
	"id": ["id", "pid", "proto_id", "dialogue_id"],
	"lines": ["lines", "nodes", "dialogue", "texts", "messages"],
	"speaker": ["speaker", "speaker_id", "npc", "npc_id", "who"],
	"text": ["text", "message", "description", "desc", "line"],
	"options": ["options", "choices", "replies", "responses"],
}

const COND_BY_NAME := {
	"stat_check": DialogueTypes.DialogueCondition.ConditionType.STAT_CHECK,
	"quest_flag": DialogueTypes.DialogueCondition.ConditionType.QUEST_FLAG,
	"item_possession": DialogueTypes.DialogueCondition.ConditionType.ITEM_POSSESSION,
	"quest_active": DialogueTypes.DialogueCondition.ConditionType.QUEST_ACTIVE,
	"quest_flag_not": DialogueTypes.DialogueCondition.ConditionType.QUEST_FLAG_NOT,
}

const CONS_BY_NAME := {
	"set_quest_flag": DialogueTypes.DialogueConsequence.ConsequenceType.SET_QUEST_FLAG,
	"give_item": DialogueTypes.DialogueConsequence.ConsequenceType.GIVE_ITEM,
	"remove_item": DialogueTypes.DialogueConsequence.ConsequenceType.REMOVE_ITEM,
	"give_caps": DialogueTypes.DialogueConsequence.ConsequenceType.GIVE_CAPS,
	"set_world_state": DialogueTypes.DialogueConsequence.ConsequenceType.SET_WORLD_STATE,
	"modify_stat": DialogueTypes.DialogueConsequence.ConsequenceType.MODIFY_STAT,
	"add_xp": DialogueTypes.DialogueConsequence.ConsequenceType.ADD_XP,
}

var _registered: Array[String] = []


func register_original_dialogues(dialogues: Array, dialogue_manager) -> int:
	_registered.clear()
	if dialogue_manager == null or not (dialogue_manager is Node):
		return 0
	if not dialogue_manager.has_method("start_dialogue"):
		return 0
	if not (dialogue_manager.get("_dialogues") is Dictionary):
		return 0

	var count := 0
	for raw in dialogues:
		if not (raw is Dictionary):
			continue
		var rec := CampaignLoader.normalize_record(raw, ALIASES)
		var id := _str(rec.get("id", ""))
		if id.is_empty():
			continue
		var chain := _build_chain(id, rec)
		if chain.is_empty():
			continue
		dialogue_manager._dialogues[id] = chain
		_registered.append(id)
		count += 1
	return count


func get_registered_ids() -> Array:
	return _registered.duplicate()


func _build_chain(id: String, rec: Dictionary) -> Array:
	var lines: Variant = rec.get("lines", [])
	if not (lines is Array):
		if lines is Dictionary:
			lines = [lines]
		else:
			lines = []
	var nodes: Array = []
	var first_id := ""
	for i in range(lines.size()):
		var raw: Variant = lines[i]
		var lr: Dictionary = {}
		if raw is Dictionary:
			lr = raw
		elif raw is String:
			lr = {"text": raw}
		else:
			continue
		var node := DialogueTypes.DialogueNode.new()
		var nid := _str(lr.get("id", lr.get("node_id", "node_%d" % i)))
		node.node_id = nid
		if first_id.is_empty():
			first_id = nid
		node.speaker_id = _str(lr.get("speaker", lr.get("speaker_id", rec.get("speaker", id))))
		node.text = _str(lr.get("text", lr.get("message", lr.get("description", ""))))
		if node.text.is_empty():
			continue
		node.conditions = _build_conditions(lr.get("conditions", []))
		var opts: Variant = lr.get("options", [])
		if not (opts is Array):
			opts = []
		for j in range(opts.size()):
			var oraw: Variant = opts[j]
			var opt: Variant = _build_option(oraw, j, nid)
			if opt != null:
				node.options.append(opt)
		if node.options.is_empty():
			var done := DialogueTypes.DialogueOption.new()
			done.option_id = "done"
			done.text = "End"
			done.next_node = ""
			node.options.append(done)
		nodes.append(node)

	# Wire bare/empty next_node to the subsequent node id (linear fallback).
	for i in range(nodes.size()):
		var node: DialogueTypes.DialogueNode = nodes[i]
		for opt in node.options:
			if _str(opt.next_node).is_empty() and i + 1 < nodes.size():
				opt.next_node = nodes[i + 1].node_id
	return nodes


func _build_option(oraw: Variant, index: int, _parent_id: String):
	var od: Dictionary = {}
	if oraw is Dictionary:
		od = oraw
	elif oraw is String:
		od = {"text": oraw}
	else:
		return null
	var label := _str(od.get("text", od.get("message", od.get("label", ""))))
	if label.is_empty():
		return null
	var opt := DialogueTypes.DialogueOption.new()
	opt.option_id = _str(od.get("id", od.get("option_id", "opt_%d" % index)))
	opt.text = label
	opt.next_node = _str(od.get("next", od.get("next_node", od.get("target", ""))))
	opt.conditions = _build_conditions(od.get("conditions", []))
	opt.consequences = _build_consequences(od.get("consequences", []))
	return opt


func _build_conditions(raw: Variant) -> Array:
	var result: Array = []
	if not (raw is Array):
		return result
	for c in raw:
		if not (c is Dictionary):
			continue
		var cd: Dictionary = c
		var t := _str(cd.get("type", cd.get("condition_type", ""))).to_lower()
		var type_id: int = -1
		if t.is_valid_int():
			type_id = int(t)
		elif COND_BY_NAME.has(t):
			type_id = COND_BY_NAME[t]
		if type_id < 0:
			continue
		var cond := DialogueTypes.DialogueCondition.new()
		cond.condition_type = type_id
		cond.stat_name = _str(cd.get("stat_name", cd.get("stat", "")))
		cond.stat_value = int(_num(cd.get("stat_value", cd.get("value", 5))))
		cond.quest_id = _str(cd.get("quest_id", ""))
		cond.quest_flag = _str(cd.get("quest_flag", cd.get("flag", "")))
		cond.quest_flag_value = cd.get("quest_flag_value", cd.get("value", true))
		cond.item_id = _str(cd.get("item_id", cd.get("item", "")))
		cond.item_amount = maxi(1, int(_num(cd.get("item_amount", cd.get("amount", 1)))))
		result.append(cond)
	return result


func _build_consequences(raw: Variant) -> Array:
	var result: Array = []
	if not (raw is Array):
		return result
	for c in raw:
		if not (c is Dictionary):
			continue
		var cd: Dictionary = c
		var t := _str(cd.get("type", cd.get("consequence_type", ""))).to_lower()
		var type_id: int = -1
		if t.is_valid_int():
			type_id = int(t)
		elif CONS_BY_NAME.has(t):
			type_id = CONS_BY_NAME[t]
		if type_id < 0:
			continue
		var cons := DialogueTypes.DialogueConsequence.new()
		cons.consequence_type = type_id
		cons.quest_id = _str(cd.get("quest_id", ""))
		cons.quest_flag = _str(cd.get("quest_flag", cd.get("flag", "")))
		cons.quest_flag_value = cd.get("quest_flag_value", cd.get("value", true))
		cons.item_id = _str(cd.get("item_id", cd.get("item", "")))
		cons.item_amount = maxi(1, int(_num(cd.get("item_amount", cd.get("amount", 1)))))
		cons.caps_amount = int(_num(cd.get("caps_amount", cd.get("caps", 0))))
		cons.world_state_key = _str(cd.get("world_state_key", cd.get("key", "")))
		cons.world_state_value = cd.get("world_state_value", cd.get("value", true))
		cons.stat_name = _str(cd.get("stat_name", cd.get("stat", "")))
		cons.stat_delta = int(_num(cd.get("stat_delta", cd.get("delta", 0))))
		cons.xp_amount = int(_num(cd.get("xp_amount", cd.get("xp", 0))))
		result.append(cons)
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
