class_name NPC
extends CharacterBody2D

## NPC with dialogue interaction capabilities.

signal dialogue_requested(dialogue_id: String)

@export var npc_name: String = "NPC"
@export var interaction_radius: float = 80.0
@export var dialogue_id: String = ""
@export var sprite_color: Color = Color(0.8, 0.4, 0.2, 1)

@onready var interaction_component = $Interactable
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var sprite: Sprite2D = $NPCSprite
@onready var interaction_indicator: CanvasItem = $InteractionIndicator

var _game_manager
var _event_bus
var _has_spoken: bool = false

func _ready() -> void:
	print("NPC _ready: name = ", name)
	# Use call_deferred to ensure autoloads are ready
	call_deferred("_init_npc")
	
	if interaction_component:
		print("NPC: found interaction_component = ", interaction_component, " instance_id = ", interaction_component.get_instance_id())
		interaction_component.interaction_radius = interaction_radius
		interaction_component.interaction_name = "Talk to " + npc_name
		# Only connect if not already connected
		var connected = interaction_component.is_connected("interaction_started", _on_interaction_started.bind())
		print("NPC: is_connected check = ", connected)
		if not connected:
			interaction_component.interaction_started.connect(_on_interaction_started.bind())
			print("NPC: connected interaction_started signal")
		else:
			print("NPC: interaction_started already connected")
		# Verify connection
		print("NPC: after connect, is_connected = ", interaction_component.is_connected("interaction_started", _on_interaction_started.bind()))
	else:
		print("NPC: NO interaction_component found!")
	
	sprite.modulate = sprite_color
	
	if interaction_indicator:
		interaction_indicator.visible = false
		interaction_indicator.modulate = Color(1, 1, 0, 1)

func _init_npc() -> void:
	_game_manager = get_node_or_null("/root/GameManager")
	_event_bus = get_node_or_null("/root/EventBus")

func _on_interaction_started(interactor: Node) -> void:
	print("NPC: _on_interaction_started CALLED! dialogue_id = ", dialogue_id)
	if dialogue_id != "":
		print("NPC: _on_interaction_started, dialogue_id = ", dialogue_id)
		if _event_bus:
			print("NPC: _event_bus = ", _event_bus, " emitting dialogue_started")
			_event_bus.emit("dialogue_started", [dialogue_id])
		else:
			# Fallback: try to get EventBus
			print("NPC: _event_bus is null, trying fallback")
			var eb = get_node_or_null("/root/EventBus")
			if eb:
				print("NPC: fallback EventBus found, emitting")
				eb.emit("dialogue_started", [dialogue_id])
			else:
				print("NPC: fallback EventBus also null!")
		_has_spoken = true

func set_dialogue(dialogue: String) -> void:
	dialogue_id = dialogue

func show_interaction_hint(show: bool) -> void:
	if interaction_indicator:
		interaction_indicator.visible = show

func get_dialogue_id() -> String:
	## Override to provide dynamic dialogue based on quest state
	return dialogue_id