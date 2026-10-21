extends SceneTree

func _init():
	var scene = load("res://scenes/combat.tscn")
	if scene:
		print("combat.tscn loaded OK")
	else:
		print("combat.tscn failed to load")
	var scene2 = load("res://scenes/ui/combat_ui.tscn")
	if scene2:
		print("combat_ui.tscn loaded OK")
	else:
		print("combat_ui.tscn failed to load")
	quit()