extends SceneTree

func _init() -> void:
	var script = load("res://scripts/ui/combat_ui.gd")
	print("Loaded script:", script)
	if script:
		print("Script class:", script.get_class())
		print("Script valid:", script.is_valid())
		# Try to instantiate the script
		var instance = script.new()
		print("Instance:", instance)
		print("Instance class:", instance.get_class())
		instance.free()
	quit(0)