class_name DialogueUI
extends CanvasLayer

## Mobile-friendly dialogue interface.

signal dialogue_closed

var panel: Panel
var speaker_label: Label
var text_label: Label
var options_container: VBoxContainer
var close_button: Button

var _dialogue_manager

func _ready() -> void:
	# Resolve node references manually to avoid @onready timing issues
	print("DialogueUI _ready: name = ", name, " children:")
	for child in get_children():
		print("  child: ", child.name, " (", child.get_class(), ")")
		if child.name == "DialoguePanel":
			for gc in child.get_children():
				print("    DialoguePanel child: ", gc.name, " (", gc.get_class(), ")")
	
	panel = get_node_or_null("DialoguePanel")
	speaker_label = get_node_or_null("DialoguePanel/SpeakerName")
	text_label = get_node_or_null("DialoguePanel/DialogueText")
	options_container = get_node_or_null("DialoguePanel/OptionsContainer")
	close_button = get_node_or_null("DialoguePanel/CloseButton")
	
	# Fallback: search all descendants
	if not text_label:
		text_label = _find_node_by_name("DialogueText")
	if not options_container:
		options_container = _find_node_by_name("OptionsContainer")
	if not close_button:
		close_button = _find_node_by_name("CloseButton")
	
	# In headless mode, nodes might not instantiate - create them dynamically
	if panel and not text_label:
		text_label = Label.new()
		text_label.name = "DialogueText"
		text_label.anchors_preset = 0
		text_label.offset_left = 16.0
		text_label.offset_top = 56.0
		text_label.offset_right = -16.0
		text_label.offset_bottom = 140.0
		text_label.horizontal_alignment = 0
		text_label.vertical_alignment = 0
		text_label.autowrap_mode = 1
		text_label.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9, 1))
		text_label.add_theme_font_size_override("font_size", 18)
		panel.add_child(text_label)
		print("Created DialogueText dynamically")
	
	if panel and not options_container:
		options_container = VBoxContainer.new()
		options_container.name = "OptionsContainer"
		options_container.anchors_preset = 8
		options_container.offset_left = 16.0
		options_container.offset_top = 146.0
		options_container.offset_right = -16.0
		options_container.offset_bottom = 70.0
		panel.add_child(options_container)
		print("Created OptionsContainer dynamically")
	
	print("DialogueUI _ready: panel=", panel, " speaker_label=", speaker_label, " text_label=", text_label, " options_container=", options_container)
	
	if panel:
		panel.visible = false
	
	_dialogue_manager = get_node_or_null("/root/DialogueManager")
	
	if _dialogue_manager:
		_dialogue_manager.dialogue_started.connect(_on_dialogue_started.bind())
		_dialogue_manager.dialogue_ended.connect(_on_dialogue_ended.bind())
		_dialogue_manager.node_changed.connect(_on_node_changed.bind())
	
	if close_button:
		close_button.pressed.connect(_on_close_pressed.bind())

func _find_node_by_name(target_name: String) -> Node:
	for child in get_children():
		if child.name == target_name:
			return child
		var found = _find_node_recursive(child, target_name)
		if found:
			return found
	return null

func _find_node_recursive(node: Node, target_name: String) -> Node:
	for child in node.get_children():
		if child.name == target_name:
			return child
		var found = _find_node_recursive(child, target_name)
		if found:
			return found
	return null

func _on_dialogue_started(dialogue_id: String) -> void:
	panel.visible = true
	_update_display()

func _on_dialogue_ended() -> void:
	panel.visible = false
	_clear_options()
	dialogue_closed.emit()

func _on_node_changed(node) -> void:
	_update_display()

func _update_display() -> void:
	if not _dialogue_manager:
		return
	
	var node = _dialogue_manager.get_current_node()
	if not node:
		return
	
	speaker_label.text = _format_speaker_name(_dialogue_manager.get_speaker_name())
	text_label.text = _dialogue_manager.get_dialogue_text()
	
	_clear_options()
	
	var options = _dialogue_manager.get_available_options()
	for option in options:
		var btn = Button.new()
		btn.text = option.text
		btn.custom_minimum_size = Vector2(0, 60)
		btn.theme_type_variation = "DialogueOption"
		btn.pressed.connect(_on_option_selected.bind(option))
		options_container.add_child(btn)

func _format_speaker_name(speaker_id: String) -> String:
	match speaker_id:
		"npc_mechanic": return "Marcus"
		"npc_scientist": return "Dr. Chen"
		"player": return "You"
		_: return speaker_id.capitalize()

func _clear_options() -> void:
	for child in options_container.get_children():
		child.queue_free()

func _on_option_selected(option) -> void:
	if _dialogue_manager:
		_dialogue_manager.select_option(option)

func _on_close_pressed() -> void:
	if _dialogue_manager:
		_dialogue_manager.end_dialogue()