extends SceneTree

## Integration test: RADZONE Wave12 world props must be present in test_map.tscn
## with valid, non-empty textures from art/production/painterly_v4/wave12.

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	await process_frame
	var packed := load("res://scenes/world/test_map.tscn")
	if packed == null:
		print("FAIL: cannot load res://scenes/world/test_map.tscn")
		quit(1)
		return
	var scene = packed.instantiate()
	if scene == null:
		print("FAIL: cannot instantiate test_map.tscn")
		quit(1)
		return
	var props = scene.get_node_or_null("RadzoneProps")
	if props == null:
		print("FAIL: RadzoneProps node missing")
		scene.free()
		quit(1)
		return
	var expected := {
		"ConcreteBarricadePiece": "concrete_barricade_piece_256.png",
		"RetroCrtTerminal": "retro_crt_terminal_256.png",
		"RoadsideBarrierAndTires": "roadside_barrier_and_tires_256.png",
		"UsedTireStack": "used_tire_stack_256.png",
	}
	var ok := true
	if props.get_child_count() != expected.size():
		print("FAIL: expected %d props, got %d" % [expected.size(), props.get_child_count()])
		ok = false
	for prop_name in expected:
		var child = props.get_node_or_null(prop_name)
		if child == null:
			print("FAIL: missing prop ", prop_name)
			ok = false
			continue
		var sprite := child.get_node_or_null("Art") as Sprite2D
		if sprite == null or sprite.texture == null:
			print("FAIL: no Art Sprite2D/texture on ", prop_name)
			ok = false
			continue
		var path := sprite.texture.resource_path
		if not path.ends_with(expected[prop_name]):
			print("FAIL: wrong texture for ", prop_name, ": ", path)
			ok = false
		elif sprite.texture.get_width() <= 0 or sprite.texture.get_height() <= 0:
			print("FAIL: invalid dimensions for ", prop_name)
			ok = false
		else:
			print("PASS: ", prop_name, " -> ", path)
	scene.free()
	if ok:
		print("RESULT: ALL PASS")
		quit(0)
	else:
		print("RESULT: FAILURES")
		quit(1)
