extends Node
class_name InGameValidationRev2

## In-Game Validation for REV2 pistol - runs from within game
## Attach to a node in test_map and it will auto-run

func _ready() -> void:
	print("In-Game Validation REV2: Starting graphical capture...")
	call_deferred("_run_validation")

func _run_validation() -> void:
	# Wait a few frames for autoloads to initialize
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	
	var current_scene = get_tree().current_scene
	if not current_scene:
		print("ERROR: No current scene")
		get_tree().quit(1)
		return
	
	print("Current scene: ", current_scene.name)
	
	# Find player
	var player = current_scene.get_node_or_null("Player")
	if not player:
		print("ERROR: Player not found in scene")
		get_tree().quit(1)
		return
	
	print("Player found: ", player)
	
	# Equip production pistol REV2 to player
	var inventory = get_node_or_null("/root/Inventory")
	if inventory and inventory.has_method("add_item"):
		# Add production pistol rev2 to inventory first
		inventory.add_item({"item_id": "production_pistol_rev2", "amount": 1})
		await get_tree().process_frame
		await get_tree().process_frame
		# Equip it
		inventory.equip_item("weapon_primary", {"item_id": "production_pistol_rev2", "amount": 1})
		await get_tree().process_frame
		await get_tree().process_frame
		print("Production pistol REV2 equipped to player")
	
	# Update character visual
	if player.has_method("_sync_equipment_visual"):
		player._sync_equipment_visual()
		await get_tree().process_frame
		await get_tree().process_frame
	
	# Capture screenshots
	_capture_player_equipped(player)
	await get_tree().process_frame
	await get_tree().process_frame
	_capture_inventory_ui()
	await get_tree().process_frame
	await get_tree().process_frame
	_capture_combat_ui()
	await get_tree().process_frame
	await get_tree().process_frame
	_capture_inspection_ui()
	await get_tree().process_frame
	await get_tree().process_frame
	_capture_full_gameplay(player)
	await get_tree().process_frame
	
	print("In-Game Validation REV2: Complete!")
	get_tree().quit(0)

func _capture_player_equipped(player) -> void:
	print("Capturing player equipped REV2 screenshot...")
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	if img:
		var output_dir = "user://artifacts/art_review/pistol/revision2/"
		var dir = DirAccess.open("user://")
		if dir and not dir.dir_exists(output_dir):
			dir.make_dir_recursive(output_dir)
		
		var path = output_dir + "player_equipped_rev2.png"
		img.save_png(path)
		print("Saved: ", path)
	else:
		print("Could not capture viewport image")

func _capture_inventory_ui() -> void:
	print("Capturing inventory UI with REV2 screenshot...")
	# Open inventory
	var inventory_ui = get_node_or_null("/root/InventoryUI")
	if inventory_ui and inventory_ui.has_method("show"):
		inventory_ui.show()
	elif inventory_ui and inventory_ui.has_node("InventoryPanel"):
		var panel = inventory_ui.get_node("InventoryPanel")
		panel.visible = true
		await get_tree().process_frame
		await get_tree().process_frame
		await get_tree().process_frame
		
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		if img:
			var path = "user://artifacts/art_review/pistol/revision2/inventory_with_rev2.png"
			img.save_png(path)
			print("Saved: ", path)
		
		panel.visible = false
	else:
		print("InventoryUI not found or no panel")

func _capture_combat_ui() -> void:
	print("Capturing combat UI with REV2 screenshot...")
	var combat_ui = get_node_or_null("/root/CombatUI")
	if not combat_ui:
		var combat_ui_scene = load("res://scenes/ui/combat_ui.tscn")
		if combat_ui_scene:
			combat_ui = combat_ui_scene.instantiate()
			get_tree().get_root().add_child(combat_ui)
			await get_tree().process_frame
			await get_tree().process_frame
	
	if combat_ui and combat_ui.has_method("show_combat"):
		# Show combat UI
		combat_ui.show_combat()
		await get_tree().process_frame
		await get_tree().process_frame
		await get_tree().process_frame
		
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		if img:
			var path = "user://artifacts/art_review/pistol/revision2/combat_with_rev2.png"
			img.save_png(path)
			print("Saved: ", path)
		
		combat_ui.hide_combat()
	elif combat_ui and combat_ui.has_method("show"):
		combat_ui.show()
		await get_tree().process_frame
		await get_tree().process_frame
		await get_tree().process_frame
		
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		if img:
			var path = "user://artifacts/art_review/pistol/revision2/combat_with_rev2.png"
			img.save_png(path)
			print("Saved: ", path)
		
		combat_ui.hide()
	else:
		print("CombatUI not found or no show method")

func _capture_inspection_ui() -> void:
	print("Capturing inspection UI with REV2...")
	# Create a simple inspection panel using the existing inventory system
	var inspection_panel = _create_inspection_panel()
	if inspection_panel:
		get_tree().get_root().add_child(inspection_panel)
		await get_tree().process_frame
		await get_tree().process_frame
		
		var viewport = get_viewport()
		var img = viewport.get_texture().get_image()
		if img:
			var path = "user://artifacts/art_review/pistol/revision2/inspection_rev2.png"
			img.save_png(path)
			print("Saved: ", path)
		
		inspection_panel.queue_free()

func _create_inspection_panel() -> Control:
	"""Create a minimal inspection panel showing the REV2 pistol in detail"""
	var panel = Control.new()
	panel.name = "InspectionPanel"
	panel.anchors_preset = Control.PRESET_FULL_RECT
	panel.offset_right = 0
	panel.offset_bottom = 0
	
	# Background
	var bg = ColorRect.new()
	bg.name = "Background"
	bg.color = Color(0.05, 0.05, 0.07, 0.95)
	bg.anchors_preset = Control.PRESET_FULL_RECT
	bg.offset_right = 0
	bg.offset_bottom = 0
	panel.add_child(bg)
	
	# Title
	var title = Label.new()
	title.name = "Title"
	title.text = "WEAPON INSPECTION — PRODUCTION PISTOL REV2"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.vertical_alignment = VERTICAL_ALIGNMENT_TOP
	title.anchors_preset = Control.PRESET_TOP_WIDE
	title.offset_top = 40
	title.offset_bottom = 80
	title.offset_left = 100
	title.offset_right = -100
	title.add_theme_font_size_override("font_size", 24)
	title.add_theme_color_override("font_color", Color(0.9, 0.8, 0.6, 1))
	panel.add_child(title)
	
	# Weapon sprite - large centered
	var sprite = Sprite2D.new()
	sprite.name = "WeaponSprite"
	sprite.centered = true
	sprite.position = Vector2(640, 360)  # Center of 1280x720
	sprite.scale = Vector2(3.0, 3.0)  # Large for inspection
	
	# Load REV2 atlas texture directly
	var texture = load("res://assets/weapons/production_pistol_candidate_rev2/production_pistol_atlas_rev2.png")
	if texture:
		sprite.texture = texture
		# Set region to the S frame (first 256x256)
		sprite.region_enabled = true
		sprite.region_rect = Rect2(0, 0, 256, 256)
	else:
		print("Could not load REV2 atlas for inspection")
	
	panel.add_child(sprite)
	
	# Stats text
	var stats = Label.new()
	stats.name = "Stats"
	stats.text = "Damage: 20-28  |  Range: 22m  |  AP: 4  |  Mag: 10  |  Ammo: 9mm (Std/JHP/AP)"
	stats.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	stats.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	stats.anchors_preset = Control.PRESET_BOTTOM_WIDE
	stats.offset_top = -80
	stats.offset_bottom = -40
	stats.offset_left = 100
	stats.offset_right = -100
	stats.add_theme_font_size_override("font_size", 18)
	stats.add_theme_color_override("font_color", Color(0.8, 0.8, 0.8, 1))
	panel.add_child(stats)
	
	# Close instruction
	var close = Label.new()
	close.name = "Close"
	close.text = "Press ESC or click to close"
	close.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	close.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	close.anchors_preset = Control.PRESET_BOTTOM_WIDE
	close.offset_top = -30
	close.offset_bottom = -10
	close.offset_left = 100
	close.offset_right = -100
	close.add_theme_font_size_override("font_size", 14)
	close.add_theme_color_override("font_color", Color(0.6, 0.6, 0.6, 1))
	panel.add_child(close)
	
	return panel

func _capture_full_gameplay(player) -> void:
	print("Capturing full gameplay scene with REV2...")
	# Move player to a good position showing environment
	player.global_position = Vector2(400, 300)
	await get_tree().process_frame
	await get_tree().process_frame
	
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	if img:
		var path = "user://artifacts/art_review/pistol/revision2/full_gameplay_rev2.png"
		img.save_png(path)
		print("Saved: ", path)
	else:
		print("Could not capture full gameplay image")