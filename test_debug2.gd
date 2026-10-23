extends SceneTree

func _init() -> void:
	var s = load("res://scenes/ui/inventory_ui.tscn")
	print("Loaded scene:", s)
	if s:
		print("Scene class:", s.get_class())
		var inst = s.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance class:", inst.get_class())
			print("Instance script:", inst.get_script())
			inst.free()
	quit(0)