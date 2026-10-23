class_name DialogueManager
extends Node

## Manages dialogue flow, conditions, and consequences.

signal dialogue_started(dialogue_id: String)
signal dialogue_ended
signal node_changed(node)
signal option_selected(option)

## Preload dialogue types from separate file
const DialogueTypes = preload("res://scripts/systems/dialogue_types.gd")

var _dialogues: Dictionary = {}  # dialogue_id -> Array[DialogueNode]
var _current_dialogue_id: String = ""
var _current_node
var _game_manager
var _inventory

func _ready() -> void:
	_game_manager = get_node_or_null("/root/GameManager")
	_inventory = get_node_or_null("/root/Inventory")
	
	# Connect to EventBus for dialogue_started signal
	var eb = get_node_or_null("/root/EventBus")
	if eb:
		eb.connect("dialogue_started", _on_dialogue_started.bind())
		print("DialogueManager: connected to EventBus dialogue_started")
	else:
		print("DialogueManager: EventBus not found!")
	
	_load_dialogues()

func _make_opt(opt_id: String, txt: String, nxt: String):
	var o = DialogueTypes.DialogueOption.new()
	o.option_id = opt_id
	o.text = txt
	o.next_node = nxt
	return o

func _make_opt_cons(opt_id: String, txt: String, nxt: String, cons: Array):
	var o = DialogueTypes.DialogueOption.new()
	o.option_id = opt_id
	o.text = txt
	o.next_node = nxt
	o.consequences = cons
	return o

func _make_cond(c_type: int, kwargs: Dictionary):
	var c = DialogueTypes.DialogueCondition.new()
	c.condition_type = c_type
	for k in kwargs:
		c.set(k, kwargs[k])
	return c

func _make_cons(c_type: int, kwargs: Dictionary):
	var c = DialogueTypes.DialogueConsequence.new()
	c.consequence_type = c_type
	for k in kwargs:
		c.set(k, kwargs[k])
	return c

func _load_dialogues() -> void:
	## Quest: Lost Power Cell (branching)
	var quest_dialogue: Array = []
	
	# Node 1: Initial greeting
	var node1 = DialogueTypes.DialogueNode.new()
	node1.node_id = "q1_greet"
	node1.speaker_id = "npc_mechanic"
	node1.text = "You look like someone who can handle a fusion cell. Lost one near the generator. Find it, and there's caps in it for you."
	node1.conditions = [_make_cond(4, {"quest_id": "lost_power_cell", "quest_flag": "started", "quest_flag_value": true})]
	node1.options = [
		_make_opt_cons("q1_accept_quest", "I'll find it.", "q1_accepted", [
			_make_cons(1, {"quest_id": "lost_power_cell", "quest_flag": "started", "quest_flag_value": true})
		]),
		_make_opt("q1_decline_quest", "Not my problem.", "q1_end")
	]
	quest_dialogue.append(node1)
	
	# Node 2: Quest accepted, no cell yet
	var node2 = DialogueTypes.DialogueNode.new()
	node2.node_id = "q1_accepted"
	node2.speaker_id = "npc_mechanic"
	node2.text = "Good. It's near the generator, south of here. Don't lose it yourself."
	node2.conditions = [_make_cond(4, {"quest_id": "lost_power_cell", "quest_flag": "has_cell", "quest_flag_value": true})]
	node2.options = [
		_make_opt("q1_onward", "On my way.", "q1_end")
	]
	quest_dialogue.append(node2)
	
	# Node 3: Has cell - can return or keep
	var node3 = DialogueTypes.DialogueNode.new()
	node3.node_id = "q1_has_cell"
	node3.speaker_id = "npc_mechanic"
	node3.text = "You found it! Hand it over, and I'll pay up."
	node3.conditions = [_make_cond(3, {"quest_id": "lost_power_cell", "quest_flag": "has_cell", "quest_flag_value": true})]
	node3.options = [
		_make_opt_cons("q1_return_cell", "Here's the cell.", "q1_returned", [
			_make_cons(1, {"quest_id": "lost_power_cell", "quest_flag": "completed", "quest_flag_value": true}),
			_make_cons(1, {"quest_id": "lost_power_cell", "quest_flag": "returned", "quest_flag_value": true}),
			_make_cons(4, {"caps_amount": 200})
		]),
		_make_opt_cons("q1_keep_cell", "[Keep it] ...Actually, I need this.", "q1_kept", [
			_make_cons(1, {"quest_id": "lost_power_cell", "quest_flag": "completed", "quest_flag_value": true}),
			_make_cons(1, {"quest_id": "lost_power_cell", "quest_flag": "kept", "quest_flag_value": true})
		])
	]
	quest_dialogue.append(node3)
	
	# Node 4: Quest started, no cell yet
	var node4 = DialogueTypes.DialogueNode.new()
	node4.node_id = "q1_check"
	node4.speaker_id = "npc_mechanic"
	node4.text = "Still looking? Generator's south of town. Can't miss it."
	node4.conditions = [
		_make_cond(1, {"quest_id": "lost_power_cell", "quest_flag": "started", "quest_flag_value": true}),
		_make_cond(4, {"quest_id": "lost_power_cell", "quest_flag": "has_cell", "quest_flag_value": true})
	]
	node4.on_enter = ["quest_started:lost_power_cell"]
	node4.options = [
		_make_opt("q1_onward2", "Right.", "q1_end")
	]
	quest_dialogue.append(node4)
	
	# Node 5: Has cell, returning
	var node5 = DialogueTypes.DialogueNode.new()
	node5.node_id = "q1_returned"
	node5.speaker_id = "npc_mechanic"
	node5.text = "Appreciate it. Generator's humming again. Here's your pay."
	node5.conditions = [_make_cond(3, {"quest_id": "lost_power_cell", "quest_flag": "has_cell", "quest_flag_value": true})]
	node5.on_enter = [
		"give_item:power_cell:-1",
		"give_caps:200"
	]
	node5.options = [
		_make_opt("q1_done", "Thanks.", "q1_end")
	]
	quest_dialogue.append(node5)
	
	# Node 6: Has cell, keeping
	var node6 = DialogueTypes.DialogueNode.new()
	node6.node_id = "q1_kept"
	node6.speaker_id = "npc_mechanic"
	node6.text = "You're a piece of work, you know that? Generator dies, people suffer. But it's your call. Get out of my sight."
	node6.conditions = [_make_cond(1, {"quest_id": "lost_power_cell", "quest_flag": "has_cell", "quest_flag_value": true})]
	node6.options = [
		_make_opt("q1_walk_away", "...", "q1_end")
	]
	quest_dialogue.append(node6)
	
	# Node 7: Quest completed - returned
	var node7 = DialogueTypes.DialogueNode.new()
	node7.node_id = "q1_done_returned"
	node7.speaker_id = "npc_mechanic"
	node7.text = "Generator's running smooth. Settlement's stable. Thanks to you."
	node7.conditions = [_make_cond(3, {"quest_id": "lost_power_cell", "quest_flag": "returned", "quest_flag_value": true})]
	node7.options = [
		_make_opt("q1_bye", "Good to hear.", "q1_end")
	]
	quest_dialogue.append(node7)
	
	# Node 8: Quest completed - kept
	var node8 = DialogueTypes.DialogueNode.new()
	node8.node_id = "q1_done_kept"
	node8.speaker_id = "npc_mechanic"
	node8.text = "Don't see your face around here again."
	node8.conditions = [_make_cond(3, {"quest_id": "lost_power_cell", "quest_flag": "kept", "quest_flag_value": true})]
	node8.options = [
		_make_opt("q1_leave_final", "Yeah, yeah.", "q1_end")
	]
	quest_dialogue.append(node8)
	
	# Node 9: End
	var node9 = DialogueTypes.DialogueNode.new()
	node9.node_id = "q1_end"
	node9.speaker_id = "npc_mechanic"
	node9.text = ""
	node9.options = []
	
	quest_dialogue.append(node9)
	
	_dialogues["lost_power_cell"] = quest_dialogue
	
	## Generic NPC dialogue
	var generic: Array = []
	var g1 = DialogueTypes.DialogueNode.new()
	g1.node_id = "generic_greeting"
	g1.speaker_id = "generic"
	g1.text = "Hello there."
	g1.options = [
		_make_opt("g_bye", "Goodbye.", "generic_end")
	]
	generic.append(g1)
	
	var g2 = DialogueTypes.DialogueNode.new()
	g2.node_id = "generic_end"
	g2.speaker_id = "generic"
	g2.text = ""
	g2.options = []
	generic.append(g2)
	
	_dialogues["generic"] = generic
	
	## High Intelligence dialogue example
	var smart_dialogue: Array = []
	var s1 = DialogueTypes.DialogueNode.new()
	s1.node_id = "smart_greeting"
	s1.speaker_id = "npc_scientist"
	s1.text = "Ah, a fellow intellectual. The wasteland has few of us left."
	s1.conditions = [_make_cond(0, {"stat_name": "intellect", "stat_value": 7})]
	var s1_opt1 = _make_opt("s_talk_science", "[Intellect 7] Discuss pre-war tech.", "s_tech")
	s1_opt1.conditions = [_make_cond(0, {"stat_name": "intellect", "stat_value": 7})]
	s1.options = [
		s1_opt1,
		_make_opt("s_normal", "Just passing through.", "generic_end")
	]
	smart_dialogue.append(s1)
	
	var s2 = DialogueTypes.DialogueNode.new()
	s2.node_id = "s_tech"
	s2.speaker_id = "npc_scientist"
	s2.text = "Fascinating. The energy systems alone..."
	s2.options = [
		_make_opt("s_more", "Tell me more.", "s_tech2"),
		_make_opt("s_bye", "Later.", "generic_end")
	]
	smart_dialogue.append(s2)
	
	var s3 = DialogueTypes.DialogueNode.new()
	s3.node_id = "s_tech2"
	s3.speaker_id = "npc_scientist"
	s3.text = "Classified. But theoretically... magnificent."
	s3.options = [
		_make_opt("s_bye2", "I'll let you work.", "generic_end")
	]
	smart_dialogue.append(s3)
	
	_dialogues["high_int"] = smart_dialogue

func start_dialogue(dialogue_id: String) -> bool:
	if not _dialogues.has(dialogue_id):
		push_error("Dialogue not found: ", dialogue_id)
		return false
	
	_current_dialogue_id = dialogue_id
	_current_node = _find_start_node(dialogue_id)
	
	if _current_node:
		_process_node_entry(_current_node)
		_game_manager.change_state(3)  # DIALOGUE
		dialogue_started.emit(dialogue_id)
		node_changed.emit(_current_node)
		return true
	
	return false

func _find_start_node(dialogue_id: String):
	var nodes = _dialogues[dialogue_id]
	for node in nodes:
		if _check_conditions(node.conditions):
			return node
	return nodes[0] if nodes.size() > 0 else null

func _check_conditions(conditions: Array) -> bool:
	for condition in conditions:
		if not condition.check(_game_manager):
			return false
	return true

func _process_node_entry(node) -> void:
	for action in node.on_enter:
		_execute_action(action)

func _execute_action(action: String) -> void:
	var parts = action.split(":")
	if parts.size() < 1:
		return
	
	match parts[0]:
		"give_caps":
			if parts.size() > 1:
				var amount = parts[1].to_int()
				if _game_manager:
					_game_manager.player_data["caps"] = _game_manager.player_data.get("caps", 0) + amount
		"give_item":
			if parts.size() > 1:
				var item_id = parts[1]
				var amount = 1
				if parts.size() > 2:
					amount = parts[2].to_int()
				if _inventory:
					var def = _inventory._item_database.get_item(item_id)
					if def:
						_inventory.add_item(def.create_instance(amount))
		"quest_started":
			if parts.size() > 1:
				_game_manager.add_quest_flag(parts[1], "started", true)

func select_option(option) -> void:
	if not _current_node:
		return
	
	for consequence in option.consequences:
		consequence.apply(_game_manager, _inventory)
	
	for action in _current_node.on_exit:
		_execute_action(action)
	
	if option.next_node != "":
		_current_node = _find_node_by_id(_current_dialogue_id, option.next_node)
		if _current_node and _check_conditions(_current_node.conditions):
			_process_node_entry(_current_node)
			node_changed.emit(_current_node)
		else:
			end_dialogue()
	else:
		end_dialogue()
	
	option_selected.emit(option)

func _find_node_by_id(dialogue_id: String, node_id: String):
	for node in _dialogues[dialogue_id]:
		if node.node_id == node_id:
			return node
	return null

func get_current_node():
	return _current_node

func get_available_options():
	if not _current_node:
		return []
	
	var available = []
	for option in _current_node.options:
		if _check_conditions(option.conditions):
			available.append(option)
	return available

func end_dialogue() -> void:
	if _current_node:
		for action in _current_node.on_exit:
			_execute_action(action)
	
	_current_dialogue_id = ""
	_current_node = null
	_game_manager.change_state(1)  # PLAYING
	dialogue_ended.emit()

func _on_dialogue_started(dialogue_id: String) -> void:
	print("DialogueManager: _on_dialogue_started called with ", dialogue_id)
	start_dialogue(dialogue_id)

func get_dialogue_text() -> String:
	if _current_node:
		return _current_node.text
	return ""

func get_speaker_name() -> String:
	if _current_node:
		return _current_node.speaker_id
	return ""