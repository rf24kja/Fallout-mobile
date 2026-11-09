extends SceneTree

func _init() -> void:
	var s1 = preload("res://scenes/ui/called_shot_panel.tscn")
	print("called_shot_panel Preloaded:", s1)
	var s2 = preload("res://scenes/ui/combat_ui.tscn")
	print("combat_ui Preloaded:", s2)
	if s2:
		print("Type:", s2.get_class())
		var inst = s2.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance Type:", inst.get_class())
			inst.free()
	quit(0)