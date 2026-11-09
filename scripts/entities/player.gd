class_name Player
extends CharacterBody2D

## Player character with isometric movement, touch input, and paperdoll equipment visualization.

@export var move_speed: float = 300.0

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var character_visual: CharacterVisual = $CharacterVisual

var target_position: Vector2 = Vector2.ZERO
var is_moving: bool = false
var move_path: Array[Vector2] = []
var path_index: int = 0
var navigation_agent: NavigationAgent2D = NavigationAgent2D.new()

# Character visual type (survivor, npc_friendly, hostile)
@export var character_type: String = "survivor"

# Autoload references (set in _ready)
var _game_manager
var _event_bus
var _interaction_button: Button = null

# Isometric direction vectors (8 directions)
static var ISO_DIRS = {
	"north": Vector2(0, -1),
	"northeast": Vector2(1, -1).normalized(),
	"east": Vector2(1, 0),
	"southeast": Vector2(1, 1).normalized(),
	"south": Vector2(0, 1),
	"southwest": Vector2(-1, 1).normalized(),
	"west": Vector2(-1, 0),
	"northwest": Vector2(-1, -1).normalized()
}

# Animation name mapping for 8-directional isometric
static var ANIM_DIRS = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"]

func _get_eventbus() -> Node:
	if not _event_bus:
		_event_bus = get_node_or_null("/root/EventBus")
	return _event_bus

func _get_gamemanager() -> Node:
	if not _game_manager or not is_instance_valid(_game_manager):
		_game_manager = get_node_or_null("/root/GameManager")
	return _game_manager

func _get_interaction_manager() -> Node:
	return get_node_or_null("/root/InteractionManager")

func _ready() -> void:
	print("Player: _ready() called")
	add_child(navigation_agent)
	navigation_agent.path_desired_distance = 4.0
	target_position = global_position
	
	# Initialize autoload references
	_game_manager = _get_gamemanager()
	_event_bus = _get_eventbus()
	
	# Connect to InteractionManager signals for nearby interactable indication
	var im = _get_interaction_manager()
	if im:
		im.interactable_nearby.connect(_on_interactable_nearby.bind())
		im.interactable_far.connect(_on_interactable_far.bind())
	
	# Find InteractButton in scene (for mobile touch interaction)
	_find_interact_button()
	
	# Load player position from GameManager
	if _game_manager and _game_manager.player_data.has("position"):
		global_position = _game_manager.player_data.position
		target_position = global_position
	
	# Set up character visuals
	if character_visual:
		character_visual.character_type = character_type
		# Initial equipment sync
		_sync_equipment_visual()

func _find_interact_button() -> void:
	# Find the InteractButton in the current scene's HUD
	var root = get_tree().get_root()
	if root:
		for i in range(root.get_child_count()):
			var child = root.get_child(i)
			if child.has_node("HUD/InteractButton"):
				_interaction_button = child.get_node("HUD/InteractButton")
				print("Player: Found InteractButton at ", _interaction_button.get_path())
				_interaction_button.pressed.connect(_on_interact_button_pressed.bind())
				break

func _physics_process(delta: float) -> void:
	# Wait for GameManager to be ready
	var gm = _get_gamemanager()
	if not gm:
		return
	
	_handle_movement(delta)
	_update_animation()
	
	# Save position periodically
	if gm.player_data.has("position"):
		gm.player_data.position = global_position

func _handle_movement(delta: float) -> void:
	if is_moving and move_path.size() > 0:
		_follow_path(delta)
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _follow_path(delta: float) -> void:
	if path_index >= move_path.size():
		is_moving = false
		move_path.clear()
		path_index = 0
		return
	
	var target = move_path[path_index]
	var direction = (target - global_position).normalized()
	var distance = global_position.distance_to(target)
	
	if distance < 5.0:
		path_index += 1
		if path_index >= move_path.size():
			is_moving = false
			move_path.clear()
			path_index = 0
			return
		target = move_path[path_index]
		direction = (target - global_position).normalized()
	
	velocity = direction * move_speed
	var eb = _get_eventbus()
	if eb:
		eb.emit("player_moved", [global_position])

func _update_animation() -> void:
	if not character_visual:
		return
	
	if velocity.length() > 1.0:
		var angle = velocity.angle()
		var anim_dir = _angle_to_anim_dir(angle)
		character_visual.set_animation("walk", anim_dir)
	elif character_visual:
		character_visual.set_animation("idle", character_visual.get_anim_dir())

func _angle_to_anim_dir(angle: float) -> String:
	# Convert angle to 8-direction animation name
	# Godot: 0 = right (east), PI/2 = down (south)
	var deg = rad_to_deg(angle)
	if deg < 0:
		deg += 360
	
	if deg >= 337.5 or deg < 22.5:
		return "E"
	elif deg < 67.5:
		return "SE"
	elif deg < 112.5:
		return "S"
	elif deg < 157.5:
		return "SW"
	elif deg < 202.5:
		return "W"
	elif deg < 247.5:
		return "NW"
	elif deg < 292.5:
		return "N"
	elif deg < 337.5:
		return "NE"
	return "S"

func move_to(position: Vector2) -> void:
	# Called from touch input or click
	target_position = position
	_request_path(position)

func _request_path(target: Vector2) -> void:
	# Use NavigationAgent2D for pathfinding
	navigation_agent.target_position = target
	# In headless mode, NavigationAgent2D needs time to compute path
	# For immediate movement, use direct path as fallback
	var path = navigation_agent.get_next_path_position()
	# Check if path is valid (not zero and not current position)
	if path != Vector2.ZERO and path.distance_to(global_position) > 1.0:
		# Path is ready - use it
		move_path = [path]
		path_index = 0
		is_moving = true
	else:
		# Direct movement if no navigation mesh or path not ready
		move_path = [target]
		path_index = 0
		is_moving = true
		# Don't call _check_navigation_path for direct movement - it overwrites with current position

func _check_navigation_path() -> void:
	var path = navigation_agent.get_next_path_position()
	if path != Vector2.ZERO:
		move_path = [path]
		path_index = 0
		is_moving = true

func _unhandled_input(event: InputEvent) -> void:
	# Debug: Log ALL unhandled input events
	print("Player._unhandled_input: event = ", event.get_class())
	if event is InputEventKey:
		print("Player._unhandled_input: InputEventKey keycode = ", event.keycode, " pressed = ", event.pressed, " physical_keycode = ", event.physical_keycode, " echo = ", event.echo)
		print("Player._unhandled_input: InputEventKey full = ", event)
	
	# Check if UI wants to handle input
	if _is_ui_focused():
		print("Player._unhandled_input: UI focused, returning early")
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Left click / tap to move
		var mouse_pos = get_viewport().get_mouse_position()
		var world_pos = get_viewport().get_canvas_transform().affine_inverse() * mouse_pos
		move_to(world_pos)
	elif event is InputEventScreenTouch and event.pressed:
		# Touch input
		var world_pos = get_viewport().get_canvas_transform().affine_inverse() * event.position
		move_to(world_pos)
	elif event.is_pressed():
		print("Player._unhandled_input: InputEventKey with pressed=true, checking keycodes")
		if event.keycode == KEY_ESCAPE:
			_game_manager.change_state(2)  # PAUSED
		elif event.keycode == KEY_I:
			_toggle_inventory()
		elif Input.is_action_pressed("interact"):
			# Use InputMap action for proper cross-platform interaction
			# Maps to KEY_E on desktop, and can be extended for mobile touch interaction
			_attempt_interaction()
		else:
			print("Player._unhandled_input: InputEventKey unhandled keycode = ", event.keycode)

func _is_ui_focused() -> bool:
	# Check if any UI panel is visible and would capture input
	# Check autoload UIs
	var dialogue_ui = get_node_or_null("/root/DialogueUI")
	var inventory_ui = get_node_or_null("/root/InventoryUI")
	var combat_hud = get_node_or_null("/root/CombatHUD")
	
	print("_is_ui_focused: dialogue_ui = ", dialogue_ui, " visible = ", dialogue_ui.visible if dialogue_ui else "N/A")
	print("_is_ui_focused: inventory_ui = ", inventory_ui, " visible = ", inventory_ui.visible if inventory_ui else "N/A")
	print("_is_ui_focused: combat_hud = ", combat_hud, " visible = ", combat_hud.visible if combat_hud else "N/A")
	
	if dialogue_ui and dialogue_ui.visible:
		print("_is_ui_focused: DialogueUI visible, returning true")
		return true
	if inventory_ui and inventory_ui.visible:
		print("_is_ui_focused: InventoryUI visible, returning true")
		return true
	if combat_hud and combat_hud.visible:
		print("_is_ui_focused: CombatHUD visible, returning true")
		return true
	
	# Check instanced UIs in current scene (for headless testing)
	var root = get_tree().get_root()
	if root:
		for i in range(root.get_child_count()):
			var child = root.get_child(i)
			if child.has_node("DialogueUI"):
				var dlg = child.get_node("DialogueUI")
				if dlg is CanvasLayer and dlg.visible:
					print("_is_ui_focused: instanced DialogueUI visible, returning true")
					return true
				# Check children (the actual CanvasLayer inside the packed scene)
				for gc in dlg.get_children():
					if gc is CanvasLayer and gc.visible:
						print("_is_ui_focused: instanced DialogueUI child visible, returning true")
						return true
			if child.has_node("InventoryUI"):
				var inv = child.get_node("InventoryUI")
				if inv is CanvasLayer and inv.visible:
					print("_is_ui_focused: instanced InventoryUI visible, returning true")
					return true
				for gc in inv.get_children():
					if gc is CanvasLayer and gc.visible:
						print("_is_ui_focused: instanced InventoryUI child visible, returning true")
						return true
			if child.has_node("CombatHUD"):
				var ch = child.get_node("CombatHUD")
				if ch is Control and ch.visible:
					print("_is_ui_focused: instanced CombatHUD visible, returning true")
					return true
	
	return false

func _toggle_inventory() -> void:
	var inventory_ui = get_node_or_null("/root/InventoryUI")
	if inventory_ui and inventory_ui.has_method("toggle"):
		inventory_ui.toggle()

func _attempt_interaction() -> void:
	print("Player._attempt_interaction: KEY_E pressed, attempting interaction")
	var interaction_manager = get_node_or_null("/root/InteractionManager")
	if interaction_manager:
		print("Player._attempt_interaction: InteractionManager found, calling attempt_interaction")
		interaction_manager.attempt_interaction()
	else:
		print("Player._attempt_interaction: InteractionManager NOT FOUND at /root/InteractionManager")

func get_special(stat: String) -> int:
	return _game_manager.get_player_stat(stat)

func _sync_equipment_visual() -> void:
	if not character_visual or not _game_manager:
		return
	
	var equipment = _game_manager.get_equipped_items()
	character_visual.update_from_equipment(equipment)

# Called when equipment changes
func _on_equipment_changed() -> void:
	_sync_equipment_visual()

func _on_interactable_nearby(interactable: Node) -> void:
	print("Player._on_interactable_nearby: ", interactable, " is nearby")
	if _interaction_button:
		_interaction_button.visible = true
		_interaction_button.text = "ВЗАИМОДЕЙСТВИЕ"

func _on_interactable_far(interactable: Node) -> void:
	print("Player._on_interactable_far: ", interactable, " is far")
	if _interaction_button:
		_interaction_button.visible = false

func _on_interact_button_pressed() -> void:
	print("Player._on_interact_button_pressed: Interact button pressed!")
	_attempt_interaction()