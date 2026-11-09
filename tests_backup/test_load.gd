extends SceneTree

func _init() -> void:
	var s = load("res://scenes/ui/combat_ui.tscn")
	print("Loaded:", s)
	if s:
		print("Type:", s.get_class())
		var inst = s.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance Type:", inst.get_class())
			inst.free()
	quit(0)