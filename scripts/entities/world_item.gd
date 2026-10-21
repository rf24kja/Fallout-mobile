class_name WorldItem
extends Area2D

## World-spawned item that can be picked up by the player.

signal picked_up(item_instance: Dictionary, picker: Node)

@export var item_id: String = ""
@export var amount: int = 1
@export var pickup_radius: float = 48.0
@export var respawn_time: float = 0.0  # 0 = no respawn

@onready var interaction_component = $Interactable
@onready var sprite: Sprite2D = $ItemSprite
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var pickup_indicator: CanvasItem = $PickupIndicator

var _item_definition
var _is_picked_up: bool = false
var _respawn_timer: float = 0.0
var _event_bus

func _ready() -> void:
	# Use call_deferred to ensure autoloads are ready
	call_deferred("_init_world_item")
	
	if interaction_component:
		interaction_component.interaction_radius = pickup_radius
		interaction_component.interaction_name = "Pick up"
		# Only connect if not already connected
		if not interaction_component.is_connected("interaction_started", _on_pickup.bind()):
			interaction_component.interaction_started.connect(_on_pickup.bind())
	
	_update_visuals()
	
	if pickup_indicator:
		pickup_indicator.visible = false

func _init_world_item() -> void:
	_event_bus = get_node_or_null("/root/EventBus")
	var db = get_node_or_null("/root/ItemDatabase")
	if db:
		_item_definition = db.get_item(item_id)

func _physics_process(delta: float) -> void:
	if _is_picked_up and respawn_time > 0:
		_respawn_timer += delta
		if _respawn_timer >= respawn_time:
			_respawn()

func _on_pickup(interactor: Node) -> void:
	if _is_picked_up:
		return
	
	var gm = get_node_or_null("/root/GameManager")
	if not gm:
		return
	
	var instance = _create_instance()
	if gm.add_to_inventory(instance):
		_is_picked_up = true
		_respawn_timer = 0.0
		_update_visuals()
		picked_up.emit(instance, interactor)
		if _event_bus:
			_event_bus.emit("item_picked_up", [item_id, instance.amount])
	else:
		# Inventory full
		if _event_bus:
			_event_bus.emit("inventory_full", [])

func _create_instance() -> Dictionary:
	if _item_definition:
		return _item_definition.create_instance(amount)
	return {
		"item_id": item_id,
		"amount": amount,
		"instance_id": item_id + "_" + str(Time.get_unix_time_from_system())
	}

func _respawn() -> void:
	_is_picked_up = false
	_update_visuals()

func _update_visuals() -> void:
	if _is_picked_up:
		sprite.visible = false
		collision_shape.disabled = true
		if interaction_component:
			interaction_component.set_active(false)
	else:
		sprite.visible = true
		collision_shape.disabled = false
		if interaction_component:
			interaction_component.set_active(true)
		
		if _item_definition and _item_definition.icon_path != "":
			var tex = load(_item_definition.icon_path)
			if tex:
				sprite.texture = tex

func set_item(item: String, qty: int = 1) -> void:
	item_id = item
	amount = qty
	_ready()  # Re-initialize visuals

func is_available() -> bool:
	return not _is_picked_up