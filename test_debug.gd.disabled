extends SceneTree

func _init() -> void:
	var s = load("res://scenes/ui/combat_ui.tscn")
	print("Loaded scene:", s)
	if s:
		print("Scene class:", s.get_class())
		var inst = s.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance class:", inst.get_class())
			print("Instance script:", inst.get_script())
			inst.free()

func _process(_delta: float) -> void:
	var stage_b = get_node_or_null("/root/StageBTestRunner")
	var stage_c = get_node_or_null("/root/StageCTestRunner")
	
	if stage_b and stage_c:
		var b_done = stage_b.get("tests_completed")
		var c_done = stage_c.get("tests_completed")
		if b_done and c_done:
			print("Both Stage B and Stage C completed - quitting")
			quit(0)

func _notification(what: int) -> void:
	if what == NOTIFICATION_PROCESS_TIME:
		# Keep running
		pass