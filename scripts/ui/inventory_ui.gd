class_name InventoryUI
extends CanvasLayer

## Mobile-friendly inventory interface.

signal inventory_closed

var panel: Panel
var items_container: GridContainer
var details_panel: Panel
var item_name_label: Label
var item_description_label: Label
var item_weight_label: Label
var item_value_label: Label
var item_amount_label: Label
var use_button: Button
var drop_button: Button
var close_button: Button
var weight_label: Label
var caps_label: Label

var _inventory
var _item_database
var _selected_item: Dictionary = {}

func _ready() -> void:
	# Resolve node references manually to avoid @onready timing issues
	print("InventoryUI _ready: name = ", name, " children:")
	for child in get_children():
		print("  child: ", child.name, " (", child.get_class(), ")")
		if child.get_class() == "Panel":
			for gc in child.get_children():
				print("    grandchild: ", gc.name, " (", gc.get_class(), ")")
				if gc.get_class() == "ScrollContainer":
					for ggc in gc.get_children():
						print("      great-grandchild: ", ggc.name, " (", ggc.get_class(), ")")
	
	panel = get_node_or_null("InventoryPanel")
	items_container = get_node_or_null("InventoryPanel/ScrollContainer/ItemsContainer")
	details_panel = get_node_or_null("InventoryPanel/DetailsPanel")
	item_name_label = get_node_or_null("InventoryPanel/DetailsPanel/ItemName")
	item_description_label = get_node_or_null("InventoryPanel/DetailsPanel/ItemDescription")
	item_weight_label = get_node_or_null("InventoryPanel/DetailsPanel/ItemWeight")
	item_value_label = get_node_or_null("InventoryPanel/DetailsPanel/ItemValue")
	item_amount_label = get_node_or_null("InventoryPanel/DetailsPanel/ItemAmount")
	use_button = get_node_or_null("InventoryPanel/DetailsPanel/UseButton")
	drop_button = get_node_or_null("InventoryPanel/DetailsPanel/DropButton")
	close_button = get_node_or_null("InventoryPanel/CloseButton")
	weight_label = get_node_or_null("InventoryPanel/WeightLabel")
	caps_label = get_node_or_null("InventoryPanel/CapsLabel")
	
	# Fallback: search all descendants for mangled names
	if not items_container:
		items_container = _find_node_by_name("ItemsContainer")
		if not items_container:
			items_container = _find_node_by_name("InventoryPanel_ScrollContainer#ItemsContainer")
	if not details_panel:
		details_panel = _find_node_by_name("DetailsPanel")
	if not item_name_label:
		item_name_label = _find_node_by_name("ItemName")
	if not item_description_label:
		item_description_label = _find_node_by_name("ItemDescription")
	if not item_weight_label:
		item_weight_label = _find_node_by_name("ItemWeight")
	if not item_value_label:
		item_value_label = _find_node_by_name("ItemValue")
	if not item_amount_label:
		item_amount_label = _find_node_by_name("ItemAmount")
	if not use_button:
		use_button = _find_node_by_name("UseButton")
	if not drop_button:
		drop_button = _find_node_by_name("DropButton")
	if not close_button:
		close_button = _find_node_by_name("CloseButton")
	if not weight_label:
		weight_label = _find_node_by_name("WeightLabel")
	if not caps_label:
		caps_label = _find_node_by_name("CapsLabel")
	
	print("InventoryUI _ready: panel=", panel, " items_container=", items_container, " details_panel=", details_panel)
	
	if panel:
		panel.visible = false
	if details_panel:
		details_panel.visible = false
	
	_inventory = get_node_or_null("/root/Inventory")
	_item_database = get_node_or_null("/root/ItemDatabase")
	
	if _inventory:
		_inventory.inventory_changed.connect(_refresh_inventory.bind())
	
	var eb = get_node_or_null("/root/EventBus")
	if eb:
		# Events handled via signals, not direct emit
		pass
	
	if close_button:
		close_button.pressed.connect(_on_close_pressed.bind())
	if use_button:
		use_button.pressed.connect(_on_use_pressed.bind())
	if drop_button:
		drop_button.pressed.connect(_on_drop_pressed.bind())

func _find_node_by_name(target_name: String) -> Node:
	for child in get_children():
		if child.name == target_name:
			return child
		var found = _find_node_recursive(child, target_name)
		if found:
			return found
	return null

func _find_node_recursive(node: Node, target_name: String) -> Node:
	for child in node.get_children():
		if child.name == target_name:
			return child
		var found = _find_node_recursive(child, target_name)
		if found:
			return found
	return null

func _refresh_inventory() -> void:
	_clear_items()
	
	if not _inventory or not items_container:
		return
	
	for instance in _inventory.items:
		var def = _item_database.get_item(instance.item_id)
		if not def:
			continue
		
		var btn = TextureButton.new()
		btn.custom_minimum_size = Vector2(64, 64)
		btn.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED
		
		if def.icon_path != "":
			var tex = null
			if ResourceLoader.exists(def.icon_path):
				tex = load(def.icon_path)
			if tex:
				btn.texture_normal = tex
			else:
				# Fallback: create a colored rectangle
				btn.texture_normal = _create_placeholder_texture(Color(0.5, 0.5, 0.8))
		
		btn.tooltip_text = def.display_name
		btn.pressed.connect(_on_item_selected.bind(instance))
		items_container.add_child(btn)
		
		# Amount label for stacked items
		if instance.amount > 1:
			var amount_label = Label.new()
			amount_label.text = "x" + str(instance.amount)
			amount_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			amount_label.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
			amount_label.add_theme_font_size_override("font_size", 12)
			amount_label.add_theme_color_override("font_color", Color(1, 1, 1))
			btn.add_child(amount_label)
			amount_label.set_anchors_preset(Control.PRESET_BOTTOM_RIGHT)
			amount_label.offset_left = 4
			amount_label.offset_top = 4
			amount_label.offset_right = -4
			amount_label.offset_bottom = -4
	
	_update_weight_display()

func _create_placeholder_texture(color: Color) -> ImageTexture:
	var img = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(color)
	var tex = ImageTexture.create_from_image(img)
	return tex

func _clear_items() -> void:
	if not items_container:
		print("_clear_items: items_container is null, attempting to find it")
		items_container = _find_node_by_name("ItemsContainer")
		if not items_container:
			items_container = _find_node_by_name("InventoryPanel_ScrollContainer#ItemsContainer")
	if not items_container:
		print("_clear_items: items_container still null, skipping clear")
		return
	for child in items_container.get_children():
		child.queue_free()

func _on_item_selected(instance: Dictionary) -> void:
	_selected_item = instance
	var def = _item_database.get_item(instance.item_id)
	
	if not def:
		return
	
	item_name_label.text = def.display_name
	item_description_label.text = def.description
	item_weight_label.text = "Weight: " + str(def.weight * instance.amount)
	item_value_label.text = "Value: " + str(def.value * instance.amount)
	item_amount_label.text = "Amount: " + str(instance.amount)
	
	use_button.visible = def.is_usable
	use_button.disabled = not def.is_usable
	drop_button.visible = true
	
	details_panel.visible = true

func _on_use_pressed() -> void:
	if not _selected_item or not _item_database:
		return
	
	var def = _item_database.get_item(_selected_item.item_id)
	if not def or not def.is_usable:
		return
	
	# Apply use effect
	_apply_use_effect(def.use_effect)
	
	# Remove one from inventory
	_inventory.remove_item(_selected_item.item_id, 1)
	details_panel.visible = false

func _apply_use_effect(effect: String) -> void:
	var parts = effect.split(":")
	if parts.size() < 2:
		return
	
	var gm = get_node_or_null("/root/GameManager")
	if not gm:
		return
	
	match parts[0]:
		"heal_hp":
			var amount = parts[1].to_int()
			gm.player_data.hp = min(gm.player_data.hp + amount, gm.player_data.max_hp)
		"reduce_rad":
			# Radiation system not implemented yet
			pass

func _on_drop_pressed() -> void:
	if not _selected_item:
		return
	
	# Drop one item at player position
	var player = get_node_or_null("/root/TestMap/Player")
	if player:
		var world_item = _spawn_world_item(_selected_item.item_id, 1, player.global_position)
		_inventory.remove_item(_selected_item.item_id, 1)
		details_panel.visible = false

func _spawn_world_item(item_id: String, amount: int, position: Vector2) -> Node:
	var scene = load("res://scenes/entities/world_item.tscn").instantiate()
	if scene:
		get_tree().root.add_child(scene)
		if scene.has_method("set_item"):
			scene.set_item(item_id, amount)
		scene.global_position = position
	return scene

func _on_close_pressed() -> void:
	panel.visible = false
	details_panel.visible = false
	inventory_closed.emit()

func _update_weight_display() -> void:
	if _inventory and weight_label:
		var current = _inventory.get_total_weight()
		var max_w = _inventory.max_weight
		weight_label.text = "Weight: " + str(current) + " / " + str(max_w)
	
	var gm = get_node_or_null("/root/GameManager")
	if gm and caps_label:
		caps_label.text = "Caps: " + str(gm.player_data.get("caps", 0))

func toggle() -> void:
	panel.visible = not panel.visible
	if panel.visible:
		_refresh_inventory()
		var eb = get_node_or_null("/root/EventBus")
		if eb:
			eb.emit("inventory_opened")
	else:
		var eb = get_node_or_null("/root/EventBus")
		if eb:
			eb.emit("inventory_closed")