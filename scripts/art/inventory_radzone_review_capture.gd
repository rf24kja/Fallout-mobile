extends Node

## Real in-game screenshot capture for the RADZONE inventory icon integration.
##
## Runs the actual test_map scene with the actual Inventory autoload, opens the
## real InventoryUI scene, and saves viewport captures to
##   user://artifacts/art_review/inventory_radzone/
## Not a concept render: this is the shipped UI over the shipped scene.

const OUT_DIR := "user://artifacts/art_review/inventory_radzone"

func _ready() -> void:
	call_deferred("_run")

func _run() -> void:
	await _wait(6)

	var inv = get_node_or_null("/root/Inventory")
	if inv == null:
		print("CAPTURE FAIL: /root/Inventory autoload missing")
		get_tree().quit(1)
		return

	# Real items: the 7 mapped RADZONE icons, plus unmapped ones so the
	# placeholder path is captured too.
	var picks := [
		{"item_id": "combat_knife", "amount": 1},
		{"item_id": "combat_shotgun", "amount": 1},
		{"item_id": "hunting_rifle", "amount": 1},
		{"item_id": "gas_mask", "amount": 1},
		{"item_id": "lockpick_set", "amount": 3},
		{"item_id": "laser_pistol", "amount": 1},
		{"item_id": "pump_shotgun", "amount": 1},
		{"item_id": "stimpak", "amount": 4},
		{"item_id": "mentats", "amount": 2},
		{"item_id": "9mm_standard", "amount": 24},
	]
	for p in picks:
		inv.add_item(p)
	await _wait(4)

	var ui = load("res://scenes/ui/inventory_ui.tscn").instantiate()
	add_child(ui)
	await _wait(6)

	ui.toggle()
	await _wait(10)
	_capture("inventory_radzone_icons.png")

	# Select the combat knife so the details panel is visible too.
	var btn = _find_button(ui, "combat_knife")
	if btn:
		btn.emit_signal("pressed")
	await _wait(8)
	_capture("inventory_radzone_details.png")

	var abs := ProjectSettings.globalize_path(OUT_DIR)
	print("CAPTURE OK dir=", abs)
	get_tree().quit(0)

func _wait(frames: int) -> void:
	for i in frames:
		await get_tree().process_frame

func _find_button(ui: Node, item_id: String) -> TextureButton:
	var container = ui.get_node_or_null("InventoryPanel/ScrollContainer/ItemsContainer")
	if container == null:
		return null
	for child in container.get_children():
		if child is TextureButton and child.tooltip_text != "":
			var db = get_node("/root/ItemDatabase")
			var def = db.get_item(item_id)
			if def and child.tooltip_text == def.display_name:
				return child
	return null

func _capture(name: String) -> void:
	var dir = DirAccess.open("user://")
	if dir and not dir.dir_exists(OUT_DIR):
		dir.make_dir_recursive(OUT_DIR)
	var img = get_viewport().get_texture().get_image()
	if img == null:
		print("CAPTURE FAIL: no viewport image for ", name)
		return
	var path = OUT_DIR + "/" + name
	img.save_png(path)
	print("CAPTURE ", path, " ", img.get_width(), "x", img.get_height())
