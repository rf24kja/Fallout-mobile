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
			if inst.get_script():
				print("Script path:", inst.get_script().get_path())
				print("Script class:", inst.get_script().get_class())
				# Try calling _ready
				if inst.has_method("_ready"):
					inst._ready()
					print("_ready called successfully")
				else:
					print("No _ready method")
			else:
				print("SCRIPT IS NULL!")
				# Try to set it manually
				var script = load("res://scripts/ui/combat_ui.gd")
				print("Manual load script:", script)
				if script:
					inst.set_script(script)
					print("After set_script:", inst.get_script())
			inst.free()
	quit(0)