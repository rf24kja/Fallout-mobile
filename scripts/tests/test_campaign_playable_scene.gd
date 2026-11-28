extends SceneTree

## Headless verification that the campaign scene is ACTUALLY PLAYABLE.
## Real assertions only — never tailor checks to force a pass.
## Instantiates scenes/campaign/campaign_root.tscn, lets _ready() build the
## location + player, then verifies visible geometry, a current camera, a
## non-empty starting location, and that travelling reconfigures the scene.

const CAMPAIGN_SCENE := "res://scenes/campaign/campaign_root.tscn"

var _failures := 0
var _checks := 0

func _init() -> void:
	call_deferred("_run")

func _check(name: String, cond: bool, detail: String = "") -> void:
	_checks += 1
	if cond:
		print("  PASS: " + name)
	else:
		_failures += 1
		print("  FAIL: " + name + ((" -> " + detail) if not detail.is_empty() else ""))

func _run() -> void:
	var packed: PackedScene = load(CAMPAIGN_SCENE)
	if packed == null:
		print("FAIL: cannot load campaign scene")
		quit(1)
		return

	var inst := packed.instantiate()
	if inst == null:
		print("FAIL: cannot instantiate campaign scene")
		quit(1)
		return
	get_root().add_child(inst)
	# Let _ready() and deferred signal wiring settle.
	await process_frame
	await process_frame

	var loc := inst.get_node_or_null("CurrentLocation")
	var player := inst.get_node_or_null("Player")
	var wm := inst.get_node_or_null("WorldMap")

	# 1. A real rendered location with Ground + PlayerSpawn.
	_check("CurrentLocation exists", loc != null)
	if loc != null:
		_check("location has Ground ColorRect", loc.get_node_or_null("Ground") != null)
		_check("location has PlayerSpawn", loc.get_node_or_null("PlayerSpawn") != null)
		_check("location built children", loc.get_child_count() > 0, "children=%d" % loc.get_child_count())

	# 2. A real Player with a current camera.
	_check("Player exists", player != null)
	if player != null:
		_check("Player is CharacterBody2D", player is CharacterBody2D)
		var cam := player.get_node_or_null("Camera2D")
		_check("Player has Camera2D", cam != null)
		if cam != null:
			_check("Player camera is current", bool(cam.call("is_current")) if cam.has_method("is_current") else true)
		_check("Player has CharacterVisual", player.get_node_or_null("CharacterVisual") != null)

	# 3. Initial location populated.
	_check("WorldMap exists", wm != null)
	var start_id := ""
	if wm != null and wm.has_method("get_current_id"):
		start_id = str(wm.call("get_current_id"))
	_check("initial location set", not start_id.is_empty(), "start_id='%s'" % start_id)

	# 4. Travelling to a neighbour changes location and reconfigures the scene.
	if wm != null and wm.has_method("get_exits") and loc != null and loc.has_method("interact_exit"):
		var exits: Array = wm.call("get_exits", start_id)
		if exits.is_empty():
			print("  FAIL: starting location has no exits to travel to")
			_failures += 1
		else:
			var target := str(exits[0])
			loc.call("interact_exit", target)
			await process_frame
			var new_id := str(wm.call("get_current_id"))
			_check("travel changed location id", new_id == target, "new_id='%s' target='%s'" % [new_id, target])
			_check("location reconfigured (has Ground)", loc.get_node_or_null("Ground") != null)
			_check("location still non-empty", loc.get_child_count() > 0)

	inst.queue_free()
	print("PLAYABLE_SCENE_CHECK=%d FAILURES=%d" % [_checks, _failures])
	if _failures == 0:
		print("RESULT: ALL PASS")
	else:
		print("RESULT: FAIL")
	quit(0 if _failures == 0 else 1)
