extends SceneTree

func _init() -> void:
	print("In-Game Validation: Starting...")
	call_deferred("_run_validation")

func _run_validation() -> void:
	# Wait a frame for autoloads
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	
	# Load test_map to get player with CharacterVisual
	var test_map_scene = load("res://scenes/world/test_map.tscn")
	if not test_map_scene:
		print("ERROR: Could not load test_map.tscn")
		quit(1)
		return
	
	get_tree().change_scene_to_packed(test_map_scene)
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	
	var current_scene = get_tree().current_scene
	if not current_scene:
		print("ERROR: No current scene after change")
		quit(1)
		return
	
	print("Current scene: ", current_scene.name)
	
	# Find player
	var player = current_scene.get_node_or_null("Player")
	if not player:
		print("ERROR: Player not found in scene")
		quit(1)
		return
	
	print("Player found: ", player)
	
	# Equip production pistol (dev candidate) to player
	var inventory = get_node_or_null("/root/Inventory")
	if inventory and inventory.has_method("add_item"):
		# Add production pistol to inventory first
		inventory.add_item("production_pistol", 1)
		await get_tree().process_frame
		# Equip it
		inventory.equip_item("production_pistol")
		await get_tree().process_frame
		print("Production pistol equipped to player")
	
	# Update character visual
	if player.has_method("_sync_equipment_visual"):
		player._sync_equipment_visual()
		await get_tree().process_frame
	
	# Capture screenshots
	_capture_player_equipped(player)
	await get_tree().process_frame
	_capture_inventory_ui()
	await get_tree().process_frame
	_capture_combat_ui()
	await get_tree().process_frame
	
	print("In-Game Validation: Complete!")
	quit(0)

func _capture_player_equipped(player) -> void:
	print("Capturing player equipped screenshot...")
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	if img:
		var output_dir = "user://artifacts/art_review/pistol/"
		var dir = DirAccess.open("user://")
		if dir and not dir.dir_exists(output_dir):
			dir.make_dir_recursive(output_dir)
		
		var path = output_dir + "player_equipped_production_pistol.png"
		img.save_png(path)
		print("Saved: ", path)
	else:
		print("Could not capture viewport image")

func _capture_inventory_ui() -> void:
	print("Capturing inventory UI screenshot...")
	# Open inventory
	var inventory_ui = get_node_or_null("/root/InventoryUI")
	if inventory_ui and inventory_ui.has_method("show"):
		inventory_ui.show()
		await get_tree().process_frame
		await get_tree().process_frame
		
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		if img:
			var path = "user://artifacts/art_review/pistol/inventory_with_production_pistol.png"
			img.save_png(path)
			print("Saved: ", path)
		
		inventory_ui.hide()
	else:
		print("InventoryUI not found or no show method")

func _capture_combat_ui() -> void:
	print("Capturing combat UI screenshot...")
	var combat_ui = get_node_or_null("/root/CombatUI")
	if not combat_ui:
		var combat_ui_scene = load("res://scenes/ui/combat_ui.tscn")
		if combat_ui_scene:
			combat_ui = combat_ui_scene.instantiate()
			get_tree().get_root().add_child(combat_ui)
			await get_tree().process_frame
	
	if combat_ui and combat_ui.has_method("show"):
		# Start combat to show combat UI
		var game_manager = get_node_or_null("/root/GameManager")
		if game_manager and game_manager.has_method("start_combat"):
			game_manager.start_combat([], [])
			await get_tree().process_frame
			await get_tree().process_frame
			
			combat_ui.show()
			await get_tree().process_frame
			await get_tree().process_frame
			
			var viewport = get_viewport()
			var img = viewport.get_texture().get_image()
			if img:
				var path = "user://artifacts/art_review/pistol/combat_with_production_pistol.png"
				img.save_png(path)
				print("Saved: ", path)
			
			combat_ui.hide()
		else:
			print("GameManager not found or no start_combat")
	else:
		print("CombatUI not found or no show method")