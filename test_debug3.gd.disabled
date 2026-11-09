extends SceneTree

func _init() -> void:
	var s = load("res://scenes/ui/combat_ui.tscn")
	print("Loaded scene:", s)
	if s:
		print("Scene class:", s.get_class())
		print("Scene subresources:", s.get_subresource_list())
		var inst = s.instantiate()
		print("Instantiated:", inst)
		if inst:
			print("Instance class:", inst.get_class())
			print("Instance script:", inst.get_script())
			# Try getting script directly from scene
			var scene_script = s.get_script()
			print("Scene script (before instantiate):", scene_script)
			inst.free()
	quit(0)