class_name TradeUI
extends CanvasLayer

## Mobile two-pane barter window.
## Opens when the EventBus emits trade_requested(npc). All exchanges go through
## TradeSystem so that caps stay synchronised between Inventory and GameManager.

var _event_bus: Node = null
var _trade: Node = null
var _inventory: Node = null
var _database: Node = null

var panel: Panel = null
var title_label: Label = null
var merchant_caps_label: Label = null
var player_caps_label: Label = null
var merchant_rows: VBoxContainer = null
var player_rows: VBoxContainer = null
var selection_label: Label = null
var deal_label: Label = null
var diff_label: Label = null
var message_label: Label = null
var buy_button: Button = null
var sell_button: Button = null
var cancel_button: Button = null

var _merchant_id: String = ""
var _merchant_amounts: Dictionary = {}
var _player_amounts: Dictionary = {}
var _amount_labels: Dictionary = {}
var _selected_merchant_item: String = ""
var _selected_player_item: String = ""
var _last_message: String = ""

func _ready() -> void:
	_resolve_nodes()
	_event_bus = get_node_or_null("/root/EventBus")
	_trade = get_node_or_null("/root/TradeSystem")
	_inventory = get_node_or_null("/root/Inventory")
	_database = get_node_or_null("/root/ItemDatabase")

	if panel:
		panel.visible = false
	if _event_bus and _event_bus.has_signal("trade_requested"):
		_event_bus.trade_requested.connect(_on_trade_requested)
	if _event_bus and _event_bus.has_signal("trade_closed"):
		_event_bus.trade_closed.connect(_on_trade_closed)
	if buy_button:
		buy_button.pressed.connect(_on_buy_pressed)
	if sell_button:
		sell_button.pressed.connect(_on_sell_pressed)
	if cancel_button:
		cancel_button.pressed.connect(_on_cancel_pressed)

	call_deferred("_apply_safe_area")

# ------------------------------------------------------------------ node setup

func _resolve_nodes() -> void:
	# get_node_or_null mirrors main_menu.gd:33-37; headless trees may lack paths.
	panel = get_node_or_null("TradePanel") as Panel
	title_label = get_node_or_null("TradePanel/TitleLabel") as Label
	merchant_caps_label = get_node_or_null("TradePanel/MerchantCapsLabel") as Label
	player_caps_label = get_node_or_null("TradePanel/PlayerCapsLabel") as Label
	merchant_rows = get_node_or_null("TradePanel/MerchantPane/ScrollContainer/Rows") as VBoxContainer
	player_rows = get_node_or_null("TradePanel/PlayerPane/ScrollContainer/Rows") as VBoxContainer
	selection_label = get_node_or_null("TradePanel/SelectionLabel") as Label
	deal_label = get_node_or_null("TradePanel/DealLabel") as Label
	diff_label = get_node_or_null("TradePanel/DiffLabel") as Label
	message_label = get_node_or_null("TradePanel/MessageLabel") as Label
	buy_button = get_node_or_null("TradePanel/BuyButton") as Button
	sell_button = get_node_or_null("TradePanel/SellButton") as Button
	cancel_button = get_node_or_null("TradePanel/CancelButton") as Button

	if merchant_rows == null:
		merchant_rows = _find_by_name(self, "Rows") as VBoxContainer
	if player_rows == null:
		player_rows = _find_by_name(self, "Rows2") as VBoxContainer
	if message_label == null:
		message_label = _find_by_name(self, "MessageLabel") as Label

func _find_by_name(from: Node, wanted: String) -> Node:
	if from.name == wanted:
		return from
	for child in from.get_children():
		var found := _find_by_name(child, wanted)
		if found:
			return found
	return null

func _apply_safe_area() -> void:
	if panel == null:
		return
	var insets := _compute_safe_area_insets()
	panel.offset_left = float(insets.position.x) + 16.0
	panel.offset_top = float(insets.position.y) + 16.0
	panel.offset_right = -float(insets.size.x) - 16.0
	panel.offset_bottom = -float(insets.size.y) - 16.0

func _compute_safe_area_insets() -> Rect2i:
	# Ported from scripts/ui/mobile_controls.gd:257-289.
	var zero := Rect2i(0, 0, 0, 0)
	if not DisplayServer.has_method("get_display_safe_area"):
		return zero
	var safe: Rect2i = DisplayServer.get_display_safe_area()
	if safe.size.x <= 0 or safe.size.y <= 0:
		return zero
	var window_size := DisplayServer.window_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		if DisplayServer.has_method("screen_get_size"):
			window_size = DisplayServer.screen_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		return zero
	var design_size := Vector2(1280, 720)
	if is_inside_tree() and get_viewport():
		design_size = get_viewport().get_visible_rect().size
	if design_size.x <= 0.0 or design_size.y <= 0.0:
		design_size = Vector2(1280, 720)
	var ratio := Vector2(design_size.x / float(window_size.x), design_size.y / float(window_size.y))
	var left := float(safe.position.x) * ratio.x
	var top := float(safe.position.y) * ratio.y
	var right := float(window_size.x - (safe.position.x + safe.size.x)) * ratio.x
	var bottom := float(window_size.y - (safe.position.y + safe.size.y)) * ratio.y
	return Rect2i(
		Vector2i(int(maxf(left, 0.0)), int(maxf(top, 0.0))),
		Vector2i(int(maxf(right, 0.0)), int(maxf(bottom, 0.0)))
	)

# ------------------------------------------------------------------ signal flow

func _on_trade_requested(npc: Node) -> void:
	_merchant_id = ""
	if npc and npc.has_method("get_trade_id"):
		_merchant_id = str(npc.call("get_trade_id"))
	elif npc:
		_merchant_id = str(npc.get("merchant_id"))
	if _merchant_id.is_empty():
		_set_message("Торговец не задан")
		return
	if npc and npc.has_method("register_as_merchant"):
		npc.call("register_as_merchant")
	if _trade == null or not bool(_trade.call("has_merchant", _merchant_id)):
		_set_message("Торговец не зарегистрирован: " + _merchant_id)
		return
	if _trade:
		var npc_barter_mod := int(npc.get("trade_barter_mod")) if npc else 0
		var npc_reaction := int(npc.get("reaction_value")) if npc else 0
		_trade.call("set_barter_mod", npc_barter_mod)
		_trade.call("set_reaction_value", npc_reaction)
	_merchant_amounts.clear()
	_player_amounts.clear()
	_amount_labels.clear()
	_selected_merchant_item = ""
	_selected_player_item = ""
	_set_message("")
	_refresh()
	if panel:
		panel.visible = true

func _on_trade_closed() -> void:
	if panel:
		panel.visible = false

func _on_cancel_pressed() -> void:
	if _event_bus and _event_bus.has_signal("trade_closed"):
		_event_bus.emit("trade_closed")
	_on_trade_closed()

# ------------------------------------------------------------------- rendering

func _clear_rows(container: VBoxContainer) -> void:
	if container == null:
		return
	for child in container.get_children():
		child.queue_free()

func _count_items(instances: Array) -> Dictionary:
	var result: Dictionary = {}
	for instance in instances:
		if not (instance is Dictionary):
			continue
		var id := str((instance as Dictionary).get("item_id", ""))
		if id.is_empty():
			continue
		result[id] = int(result.get(id, 0)) + int((instance as Dictionary).get("amount", 0))
	return result

func _refresh() -> void:
	if _trade == null or _inventory == null or _database == null:
		return
	if title_label:
		title_label.text = "BARTER — " + _merchant_name()
	if merchant_caps_label:
		merchant_caps_label.text = "%s: %d caps" % [_merchant_name(), int(_trade.call("get_merchant_caps", _merchant_id))]
	if player_caps_label:
		player_caps_label.text = "Вы: %d caps" % int(_trade.call("get_player_caps"))

	var record: Dictionary = _trade.call("get_merchant", _merchant_id)
	_clear_rows(merchant_rows)
	var stock := _count_items(record.get("items", []))
	for item_id in stock.keys():
		_add_row(merchant_rows, str(item_id), int(stock[item_id]), true)

	_clear_rows(player_rows)
	var player_items: Array = _inventory.call("get_items")
	var owned := _count_items(player_items)
	for item_id in owned.keys():
		_add_row(player_rows, str(item_id), int(owned[item_id]), false)

	_update_amount_labels()
	_update_selection()

func _merchant_name() -> String:
	if _trade == null or _merchant_id.is_empty():
		return "Торговец"
	var record: Dictionary = _trade.call("get_merchant", _merchant_id)
	return str(record.get("display_name", "Торговец"))

func _add_row(container: VBoxContainer, item_id: String, available: int, merchant_side: bool) -> void:
	if container == null or _database == null:
		return
	var def = _database.call("get_item", item_id)
	var display_name := item_id
	var description := ""
	var value := 0
	if def:
		var name_value = def.get("display_name")
		var desc_value = def.get("description")
		var value_value = def.get("value")
		display_name = str(name_value) if name_value != null and str(name_value) != "" else item_id
		description = str(desc_value) if desc_value != null else ""
		value = int(value_value) if value_value != null else 0

	var row := HBoxContainer.new()
	row.custom_minimum_size = Vector2(0, 66)

	var select := Button.new()
	select.custom_minimum_size = Vector2(220, 60)
	select.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var label_text := "%s  x%d  •  %d caps" % [display_name, available, value]
	if not description.is_empty():
		label_text += "  (" + description + ")"
	select.text = label_text
	select.pressed.connect(_on_row_selected.bind(item_id, merchant_side))
	row.add_child(select)

	var minus := Button.new()
	minus.custom_minimum_size = Vector2(60, 60)
	minus.text = "−"
	minus.pressed.connect(_on_amount_changed.bind(item_id, merchant_side, -1))
	row.add_child(minus)

	var amount_label := Label.new()
	amount_label.name = "AmountLabel"
	amount_label.custom_minimum_size = Vector2(60, 60)
	amount_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	amount_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(amount_label)
	_amount_labels[_side_key(item_id, merchant_side)] = amount_label

	var plus := Button.new()
	plus.custom_minimum_size = Vector2(60, 60)
	plus.text = "+"
	plus.pressed.connect(_on_amount_changed.bind(item_id, merchant_side, 1))
	row.add_child(plus)

	container.add_child(row)

func _side_key(item_id: String, merchant_side: bool) -> String:
	return ("m:" if merchant_side else "p:") + item_id

func _available_count(item_id: String, merchant_side: bool) -> int:
	if merchant_side:
		return int(_trade.call("get_merchant_item_count", _merchant_id, item_id)) if _trade else 0
	return int(_inventory.call("get_item_count", item_id)) if _inventory else 0

func _update_amount_labels() -> void:
	for item_id in _merchant_amounts.keys():
		var key := _side_key(str(item_id), true)
		if _amount_labels.has(key):
			var label: Label = _amount_labels[key]
			if is_instance_valid(label):
				label.text = str(_merchant_amounts[item_id])
	for item_id in _player_amounts.keys():
		var key := _side_key(str(item_id), false)
		if _amount_labels.has(key):
			var label: Label = _amount_labels[key]
			if is_instance_valid(label):
				label.text = str(_player_amounts[item_id])

func _on_row_selected(item_id: String, merchant_side: bool) -> void:
	_set_message("")
	if merchant_side:
		_selected_merchant_item = item_id
		_merchant_amounts[item_id] = 1
	else:
		_selected_player_item = item_id
		_player_amounts[item_id] = 1
	_update_amount_labels()
	_update_selection()

func _on_amount_changed(item_id: String, merchant_side: bool, delta: int) -> void:
	var values: Dictionary = _merchant_amounts if merchant_side else _player_amounts
	var current := int(values.get(item_id, 1))
	var available := maxi(1, _available_count(item_id, merchant_side))
	values[item_id] = clampi(current + delta, 1, available)
	if merchant_side:
		_selected_merchant_item = item_id
	else:
		_selected_player_item = item_id
	_update_amount_labels()
	_update_selection()

func _update_selection() -> void:
	if _trade == null:
		return
	var buy_amount := int(_merchant_amounts.get(_selected_merchant_item, 0))
	var sell_amount := int(_player_amounts.get(_selected_player_item, 0))
	var buy_price := 0
	var sell_price := 0
	if buy_amount > 0:
		buy_price = int(_trade.call("compute_buy_price", _merchant_id, _selected_merchant_item, buy_amount))
	if sell_amount > 0:
		sell_price = int(_trade.call("compute_sell_price", _selected_player_item, sell_amount))

	if selection_label:
		selection_label.text = "Покупка: %s x%d | Продажа: %s x%d" % [
			_selected_merchant_item if _selected_merchant_item != "" else "—", buy_amount,
			_selected_player_item if _selected_player_item != "" else "—", sell_amount]
	if deal_label:
		deal_label.text = "Цена покупки: %d | Цена продажи: %d" % [buy_price, sell_price]
	if diff_label:
		diff_label.text = "Разница: %d caps" % (sell_price - buy_price)

func _set_message(text: String) -> void:
	_last_message = text
	if message_label:
		message_label.text = text

# ------------------------------------------------------------------ operations

func _on_buy_pressed() -> void:
	if _trade == null or _selected_merchant_item.is_empty():
		_set_message("Выберите товар торговца")
		return
	var amount := int(_merchant_amounts.get(_selected_merchant_item, 1))
	var result: Dictionary = _trade.call("buy", _merchant_id, _selected_merchant_item, amount)
	if bool(result.get("ok", false)):
		_set_message("Куплено %s x%d за %d caps" % [_selected_merchant_item, amount, int(result.get("price", 0))])
	else:
		_set_message("Не удалось купить: " + str(result.get("reason", "unknown")))
	_refresh()

func _on_sell_pressed() -> void:
	if _trade == null or _selected_player_item.is_empty():
		_set_message("Выберите свою вещь")
		return
	var amount := int(_player_amounts.get(_selected_player_item, 1))
	var result: Dictionary = _trade.call("sell", _merchant_id, _selected_player_item, amount)
	if bool(result.get("ok", false)):
		_set_message("Продано %s x%d за %d caps" % [_selected_player_item, amount, int(result.get("price", 0))])
	else:
		_set_message("Не удалось продать: " + str(result.get("reason", "unknown")))
	_refresh()
