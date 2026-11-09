extends SceneTree

func _init() -> void:
	var s1 = load("res://scenes/ui/called_shot_panel.tscn")
	print("called_shot_panel Loaded:", s1)
	var s2 = load("res://scenes/ui/combat_ui.tscn")
	print("combat_ui Loaded:", s2)
	if s2:
		print("Type:", s2.get_class())
		var inst = s2.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance Type:", inst.get_class())
			inst.free()
	quit(0)