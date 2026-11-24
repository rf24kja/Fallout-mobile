extends SceneTree

## Headless regression test for the mobile touch controls overlay.
##
## Verifies (runtime, not just source):
##   1. res://scenes/ui/mobile_controls.tscn loads, root is CanvasLayer + MobileControls script
##   2. JoystickBase / JoystickKnob exist
##   3. the 5 action buttons exist, are Button nodes and have touch targets >= 70x70
##   4. all required signals are declared and the safe-area API returns a Rect2i
##   5. Player.set_joystick_vector() exists and drives movement (velocity != 0)
##   6. joystick takes priority over tap-to-move, and releasing it restores path logic
##
## Usage: godot --headless --path . --script scripts/tests/test_mobile_controls.gd --quit-after 60

const SCENE_PATH := "res://scenes/ui/mobile_controls.tscn"
const PLAYER_SCRIPT_PATH := "res://scripts/entities/player.gd"
const TEST_MAP_PATH := "res://scenes/world/test_map.tscn"
const BUTTON_NAMES := ["InteractButton", "InventoryButton", "AttackButton", "PauseButton", "MapButton"]
const BUTTON_PATH := "UIControl/SafeAreaRoot/ButtonContainer/"
const REQUIRED_SIGNALS := [
	"move_vector_changed", "interact_pressed", "inventory_pressed", "attack_pressed",
	"pause_pressed", "map_pressed", "camera_zoom_changed", "camera_pan_requested",
]

var _checks := 0
var _fail_count := 0


func _init() -> void:
	call_deferred("_run")


func _run() -> void:
	await process_frame

	var mc_scene: PackedScene = load(SCENE_PATH)
	_check(mc_scene != null, "scene loads: " + SCENE_PATH)
	if mc_scene == null:
		_finish()
		return

	var mc := mc_scene.instantiate()
	_check(mc is CanvasLayer, "root is CanvasLayer (got %s)" % mc.get_class())
	_check(mc.get_script() != null, "root has script attached")
	if mc.get_script() != null:
		_check(String(mc.get_script().resource_path) == "res://scripts/ui/mobile_controls.gd",
				"root script is mobile_controls.gd")
	root.add_child(mc)
	await process_frame
	await process_frame

	# --- nodes
	_check(mc.get_node_or_null("UIControl") != null, "UIControl exists")
	_check(mc.get_node_or_null("UIControl/SafeAreaRoot") != null, "SafeAreaRoot exists")
	var joystick_base := mc.get_node_or_null("UIControl/SafeAreaRoot/JoystickBase")
	var joystick_knob := mc.get_node_or_null("UIControl/SafeAreaRoot/JoystickBase/JoystickKnob")
	_check(joystick_base != null, "JoystickBase exists")
	_check(joystick_knob != null, "JoystickKnob exists")
	if joystick_base != null and joystick_base is Control:
		_check(joystick_base.size.x >= 150.0, "JoystickBase is a large touch area (%.0f px)" % joystick_base.size.x)

	# --- buttons
	var button_count := 0
	for button_name in BUTTON_NAMES:
		var node := mc.get_node_or_null(BUTTON_PATH + button_name)
		_check(node != null, "button exists: " + button_name)
		if node == null:
			continue
		_check(node is Button, button_name + " is a Button node")
		button_count += 1
		if node is Button:
			_check(node.custom_minimum_size.x >= 70.0 and node.custom_minimum_size.y >= 70.0,
					"%s touch target >= 70x70 (got %.0f x %.0f)" % [
						button_name, node.custom_minimum_size.x, node.custom_minimum_size.y])
	_check(button_count == BUTTON_NAMES.size(), "all %d action buttons present" % BUTTON_NAMES.size())

	# --- signals
	for sig in REQUIRED_SIGNALS:
		_check(mc.has_signal(sig), "signal declared: " + sig)

	# --- safe area API
	_check(mc.has_method("get_safe_area_insets"), "get_safe_area_insets() exists")
	_check(mc.has_method("set_visible_controls"), "set_visible_controls() exists")
	_check(mc.has_method("is_mobile_input_active"), "is_mobile_input_active() exists")
	var insets = mc.get_safe_area_insets()
	_check(typeof(insets) == TYPE_RECT2I, "get_safe_area_insets() returns Rect2i")
	if typeof(insets) == TYPE_RECT2I:
		_check(insets.position.x >= 0 and insets.position.y >= 0 and
				insets.size.x >= 0 and insets.size.y >= 0,
				"safe area insets are non-negative: %s" % str(insets))
	_check(mc.is_mobile_input_active() is bool, "is_mobile_input_active() returns bool")

	# toggling visibility must not error and must zero the joystick
	mc.set_visible_controls(false)
	_check(mc.are_controls_visible() == false, "set_visible_controls(false) hides controls")
	mc.set_visible_controls(true)
	_check(mc.are_controls_visible() == true, "set_visible_controls(true) shows controls")

	# --- player integration
	var player_script: Script = load(PLAYER_SCRIPT_PATH)
	_check(player_script != null, "player.gd loads")
	if player_script != null:
		var methods := player_script.get_script_method_list()
		var names: Array = []
		for m in methods:
			names.append(m["name"])
		_check(names.has("set_joystick_vector"), "Player.set_joystick_vector() exists")
		_check(names.has("get_joystick_vector"), "Player.get_joystick_vector() exists")

	var map: PackedScene = load(TEST_MAP_PATH)
	_check(map != null, "test_map.tscn loads")
	if map != null:
		var map_inst := map.instantiate()
		var player := map_inst.get_node_or_null("Player")
		_check(player != null, "test_map has Player")
		if player != null:
			player.get_parent().remove_child(player)
			player.owner = null
			root.add_child(player)
			await process_frame
			await physics_frame

			# MobileControls is already in the tree -> Player must wire itself to it.
			player.set_joystick_vector(Vector2(1.0, 0.0))
			_check(player.get_joystick_vector().distance_to(Vector2(1, 0)) < 0.001,
					"set_joystick_vector() stores the vector")

			player._handle_movement(1.0 / 60.0)
			_check(player.velocity.length() > 1.0,
					"joystick produces non-zero velocity (got %.2f)" % player.velocity.length())
			_check(absf(player.velocity.length() - player.move_speed) < 1.0,
					"joystick velocity equals move_speed (%.1f vs %.1f)" % [
						player.velocity.length(), player.move_speed])
			_check(player.is_moving == false, "joystick clears tap-to-move is_moving")

			# tap-to-move still works with the joystick released
			player.set_joystick_vector(Vector2.ZERO)
			player.move_to(player.global_position + Vector2(200, 0))
			_check(player.is_moving == true, "tap-to-move still sets is_moving")
			player._handle_movement(1.0 / 60.0)
			_check(player.velocity.length() > 1.0, "tap-to-move path still produces velocity")

			# and the joystick overrides the path again
			player.set_joystick_vector(Vector2(0.0, -1.0))
			player._handle_movement(1.0 / 60.0)
			_check(player.is_moving == false and player.move_path.is_empty(),
					"joystick overrides an active tap-to-move path")

			# mobile signal from the overlay reaches the player
			player.set_joystick_vector(Vector2.ZERO)
			mc.move_vector_changed.emit(Vector2(0.0, 1.0))
			_check(player.get_joystick_vector().distance_to(Vector2(0, 1)) < 0.001,
					"move_vector_changed signal is wired to the player")
			player.set_joystick_vector(Vector2.ZERO)

			player.get_parent().remove_child(player)
			player.queue_free()
		map_inst.queue_free()

	mc.queue_free()
	await process_frame
	_finish()


func _check(condition: bool, label: String) -> void:
	_checks += 1
	if condition:
		print("PASS  ", label)
	else:
		_fail_count += 1
		print("FAIL  ", label)


func _finish() -> void:
	print("MOBILE_CONTROLS_CHECK=%d FAILURES=%d" % [_checks, _fail_count])
	if _fail_count == 0:
		print("RESULT: ALL PASS")
		quit(0)
	else:
		print("RESULT: FAIL")
		quit(1)
