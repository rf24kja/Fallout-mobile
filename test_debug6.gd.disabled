extends SceneTree

func _init() -> void:
	var script = load("res://scripts/ui/inventory_ui.gd")
	print("Loaded script:", script)
	if script:
		print("Script class:", script.get_class())
		var s = load("res://scenes/ui/combat_ui.tscn")
		print("Loaded scene:", s)
		if s:
			print("Scene class:", s.get_class())
			var inst = s.instantiate()
			print("Instantiated:", inst)
			if inst:
				print("Instance class:", inst.get_class())
				print("Instance script before set:", inst.get_script())
				inst.set_script(script)
				print("Instance script after set:", inst.get_script())
				inst.free()
	quit(0)