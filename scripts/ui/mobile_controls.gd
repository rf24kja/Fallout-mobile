class_name MobileControls
extends CanvasLayer

## Mobile touch control overlay for the Fallout 2 Reborn mobile HUD.
##
## Additive layer only: it never changes gameplay rules, it just translates touch
## gestures into signals that the Player / Camera consume.
##
##   LEFT  : virtual joystick (fixed base, knob follows the finger, analog vector)
##   RIGHT : real Button nodes (Interact / Inventory / Attack / Pause / Map)
##   ANY   : two-finger pinch -> camera_zoom_changed, two-finger drag -> camera_pan_requested
##   SAFE AREA: root Control is inset by DisplayServer.get_display_safe_area()
##
## Touches that belong to the joystick / pinch / action buttons are marked as
## handled, so the player's tap-to-move never fires "under" a control.
## Every touch outside those zones stays untouched -> tap-to-move keeps working
## exactly as before.

signal move_vector_changed(vector: Vector2)
signal interact_pressed()
signal inventory_pressed()
signal attack_pressed()
signal pause_pressed()
signal map_pressed()
signal camera_zoom_changed(zoom: Vector2)
signal camera_pan_requested(delta: Vector2)

const JOYSTICK_RADIUS: float = 90.0
const JOYSTICK_KNOB_RADIUS: float = 38.0
const JOYSTICK_DEADZONE: float = 0.15
const MIN_ZOOM: float = 0.5
const MAX_ZOOM: float = 2.5
const JOYSTICK_GRAB_MARGIN: float = 24.0

const ACTION_BUTTONS := {
	"InteractButton": "interact_pressed",
	"InventoryButton": "inventory_pressed",
	"AttackButton": "attack_pressed",
	"PauseButton": "pause_pressed",
	"MapButton": "map_pressed",
}

@onready var _root_control: Control = get_node_or_null("UIControl") as Control
@onready var _safe_area_root: Control = get_node_or_null("UIControl/SafeAreaRoot") as Control
@onready var _joystick_base: Control = get_node_or_null("UIControl/SafeAreaRoot/JoystickBase") as Control
@onready var _joystick_knob: Control = get_node_or_null("UIControl/SafeAreaRoot/JoystickBase/JoystickKnob") as Control

var _joystick_center: Vector2 = Vector2.ZERO
var _joystick_touch_index: int = -1
var _move_vector: Vector2 = Vector2.ZERO
var _touches: Dictionary = {}
var _pinch_active: bool = false
var _pinch_last_distance: float = 0.0
var _pinch_last_center: Vector2 = Vector2.ZERO
var _zoom: float = 1.0
var _controls_visible: bool = true
var _safe_area_insets: Rect2i = Rect2i(0, 0, 0, 0)

func _ready() -> void:
	print("MobileControls: _ready() called")
	add_to_group("mobile_controls")
	_apply_safe_area()
	_connect_action_buttons()
	if not get_viewport().size_changed.is_connected(_apply_safe_area):
		get_viewport().size_changed.connect(_apply_safe_area)
	_reset_knob()

func _connect_action_buttons() -> void:
	for button_name in ACTION_BUTTONS.keys():
		var node := _find_child_node(button_name)
		var button := node as Button
		if button == null:
			print("MobileControls: action button not found: ", button_name)
			continue
		if button.pressed.is_connected(_on_action_button_pressed.bind(button_name)):
			continue
		button.pressed.connect(_on_action_button_pressed.bind(button_name))
		print("MobileControls: connected ", button_name)

func _find_child_node(node_name: String) -> Node:
	if _root_control == null:
		return null
	return _root_control.find_child(node_name, true, false)

func _on_action_button_pressed(button_name: String) -> void:
	print("MobileControls: button pressed -> ", button_name)
	emit_signal(ACTION_BUTTONS[button_name])

# ---------------------------------------------------------------- input

func _unhandled_input(event: InputEvent) -> void:
	if not _controls_visible:
		return
	if event is InputEventScreenTouch:
		if event.pressed:
			_on_touch_pressed(event.index, event.position)
		else:
			_on_touch_released(event.index, event.position)
	elif event is InputEventScreenDrag:
		_on_touch_dragged(event.index, event.position)

func _on_touch_pressed(index: int, position: Vector2) -> void:
	_touches[index] = position

	# Joystick zone always claims the touch (never falls through to tap-to-move).
	if _is_in_joystick(position):
		if _joystick_touch_index == -1:
			_joystick_touch_index = index
			_update_joystick(position)
		_consume_input()
		return

	# Second finger outside the joystick starts a pinch gesture.
	if _touches.size() == 2 and _joystick_touch_index == -1:
		_begin_pinch()
		_consume_input()
		return

	# Action buttons are real Button nodes; still consume the touch so the
	# player does not walk to the button position.
	if _is_in_button(position):
		_consume_input()

func _on_touch_dragged(index: int, position: Vector2) -> void:
	if not _touches.has(index):
		return
	_touches[index] = position

	if index == _joystick_touch_index:
		_update_joystick(position)
		_consume_input()
		return

	if _pinch_active and _touches.size() >= 2:
		_update_pinch()
		_consume_input()

func _on_touch_released(index: int, _position: Vector2) -> void:
	_touches.erase(index)

	if index == _joystick_touch_index:
		_joystick_touch_index = -1
		_set_move_vector(Vector2.ZERO)
		_reset_knob()
		_consume_input()

	if _pinch_active and _touches.size() < 2:
		_pinch_active = false

func _consume_input() -> void:
	var vp := get_viewport()
	if vp:
		vp.set_input_as_handled()

# ---------------------------------------------------------------- joystick

func _is_in_joystick(position: Vector2) -> bool:
	if _joystick_base == null or not _joystick_base.is_visible_in_tree():
		return false
	var rect := _joystick_base.get_global_rect().grow(JOYSTICK_GRAB_MARGIN)
	return rect.has_point(position)

func _is_in_button(position: Vector2) -> bool:
	if _root_control == null:
		return false
	for button_name in ACTION_BUTTONS.keys():
		var button := _find_child_node(button_name) as Button
		if button == null or not button.is_visible_in_tree():
			continue
		if button.get_global_rect().has_point(position):
			return true
	return false

func _update_joystick(position: Vector2) -> void:
	if _joystick_base == null:
		return
	_joystick_center = _joystick_base.get_global_rect().get_center()
	var delta := position - _joystick_center
	var strength := clampf(delta.length() / JOYSTICK_RADIUS, 0.0, 1.0)
	var direction := delta.normalized() if delta.length() > 0.001 else Vector2.ZERO
	if strength < JOYSTICK_DEADZONE:
		_set_move_vector(Vector2.ZERO)
	else:
		_set_move_vector(direction * strength)
	_place_knob(direction * strength)

func _set_move_vector(vector: Vector2) -> void:
	if vector.is_equal_approx(_move_vector):
		return
	_move_vector = vector
	move_vector_changed.emit(_move_vector)

func _place_knob(vector: Vector2) -> void:
	if _joystick_knob == null or _joystick_base == null:
		return
	var travel := JOYSTICK_RADIUS - JOYSTICK_KNOB_RADIUS * 0.5
	_joystick_knob.position = _joystick_base.size * 0.5 + vector * travel - _joystick_knob.size * 0.5

func _reset_knob() -> void:
	if _joystick_knob == null or _joystick_base == null:
		return
	_joystick_knob.position = _joystick_base.size * 0.5 - _joystick_knob.size * 0.5

func get_move_vector() -> Vector2:
	return _move_vector

# ---------------------------------------------------------------- pinch / camera

func _begin_pinch() -> void:
	var keys := _touches.keys()
	if keys.size() < 2:
		return
	var p1: Vector2 = _touches[keys[0]]
	var p2: Vector2 = _touches[keys[1]]
	_pinch_active = true
	_pinch_last_distance = p1.distance_to(p2)
	_pinch_last_center = (p1 + p2) * 0.5

func _update_pinch() -> void:
	var keys := _touches.keys()
	if keys.size() < 2:
		_pinch_active = false
		return
	var p1: Vector2 = _touches[keys[0]]
	var p2: Vector2 = _touches[keys[1]]
	var distance := p1.distance_to(p2)
	var center := (p1 + p2) * 0.5

	if distance > 1.0 and _pinch_last_distance > 1.0:
		var ratio := distance / _pinch_last_distance
		var new_zoom := clampf(_zoom * ratio, MIN_ZOOM, MAX_ZOOM)
		if not is_equal_approx(new_zoom, _zoom):
			_zoom = new_zoom
			camera_zoom_changed.emit(Vector2(_zoom, _zoom))

	var pan_delta := center - _pinch_last_center
	if pan_delta.length() > 0.5:
		camera_pan_requested.emit(pan_delta)

	_pinch_last_distance = distance
	_pinch_last_center = center

func get_zoom() -> float:
	return _zoom

# ---------------------------------------------------------------- safe area

func _apply_safe_area() -> void:
	_safe_area_insets = _compute_safe_area_insets()
	if _safe_area_root == null:
		return
	_safe_area_root.offset_left = float(_safe_area_insets.position.x)
	_safe_area_root.offset_top = float(_safe_area_insets.position.y)
	_safe_area_root.offset_right = -float(_safe_area_insets.size.x)
	_safe_area_root.offset_bottom = -float(_safe_area_insets.size.y)

func _compute_safe_area_insets() -> Rect2i:
	var zero := Rect2i(0, 0, 0, 0)
	if not DisplayServer.has_method("get_display_safe_area"):
		return zero
	var safe: Rect2i = DisplayServer.get_display_safe_area()
	if safe.size.x <= 0 or safe.size.y <= 0:
		return zero

	# Window size in physical pixels (0 in headless -> fall back to display size).
	var window_size := DisplayServer.window_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		if DisplayServer.has_method("screen_get_size"):
			window_size = DisplayServer.screen_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		return zero

	# Design (viewport) size: physical px -> design px ratio.
	var design_size := Vector2(1280, 720)
	if _root_control != null:
		design_size = _root_control.get_viewport_rect().size
	if design_size.x <= 0 or design_size.y <= 0:
		design_size = Vector2(1280, 720)
	var ratio := Vector2(design_size.x / float(window_size.x), design_size.y / float(window_size.y))

	var left := float(safe.position.x) * ratio.x
	var top := float(safe.position.y) * ratio.y
	var right := float(window_size.x - (safe.position.x + safe.size.x)) * ratio.x
	var bottom := float(window_size.y - (safe.position.y + safe.size.y)) * ratio.y

	return Rect2i(
		Vector2i(int(maxf(left, 0.0)), int(maxf(top, 0.0))),
		Vector2i(int(maxf(right, 0.0)), int(maxf(bottom, 0.0)))
	)

## Returns the safe-area insets (position = left/top inset, size = right/bottom inset)
## already converted from physical pixels to design (1280x720) pixels.
func get_safe_area_insets() -> Rect2i:
	return _safe_area_insets

# ---------------------------------------------------------------- visibility

func set_visible_controls(v: bool) -> void:
	_controls_visible = v
	if _root_control != null:
		_root_control.visible = v
	if not v:
		_joystick_touch_index = -1
		_touches.clear()
		_pinch_active = false
		_set_move_vector(Vector2.ZERO)
		_reset_knob()

func are_controls_visible() -> bool:
	return _controls_visible

func is_mobile_input_active() -> bool:
	if _joystick_touch_index >= 0 or _pinch_active:
		return true
	if DisplayServer.has_method("is_touchscreen_available"):
		return DisplayServer.is_touchscreen_available()
	return false
