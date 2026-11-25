class_name TradeSystem
extends Node

## NPC barter / trade system.
##
## Vanilla reference (Fallout 2 CE source, `src/inventory.cc`):
##   * `_barter_compute_value()` lines 4673-4702 -> `compute_buy_price()`
##   * `_barter_attempt_transaction()` lines 4706-4761 -> `buy()` / `sell()`
##   * `_barter_mod` default 0, NPC_REACTION_GOOD => modifier = -15 (lines
##     5100-5102, final `_barter_mod = barterMod + modifier`, line 5124).
##
## SELL price is the RAW `sum(item.value * amount)` of the player's offer.
## In vanilla the player's offered table is valued with plain `objectGetCost()`
## (inventory.cc:4743), NOT with `_barter_compute_value()`, so there is no
## sell-side barter multiplier. Do not invent one.
##
## Caps are a known split-brain in this project: `Inventory.caps` and
## `GameManager.player_data["caps"]`. Every successful deal writes BOTH so the
## two values can never drift apart.

const MASTER_TRADER_PERK := "master_trader"
const MASTER_TRADER_BONUS := 25.0

## `_barter_mod` from vanilla. 0 = neutral, -15 = NPC_REACTION_GOOD.
var barter_mod: int = 0

## merchant_id -> {display_name: String, caps: int, barter_skill: int, items: Array[Dictionary]}
## Each item instance is {item_id: String, amount: int, instance_id: String}
## (same shape as `ItemDefinition.create_instance()`).
var merchants: Dictionary = {}

var _item_database
var _inventory
var _game_manager
var _character_system
var _event_bus

func _ready() -> void:
	_resolve_autoloads()

func _resolve_autoloads() -> void:
	_item_database = get_node_or_null("/root/ItemDatabase")
	_inventory = get_node_or_null("/root/Inventory")
	_game_manager = get_node_or_null("/root/GameManager")
	_character_system = get_node_or_null("/root/CharacterSystem")
	_event_bus = get_node_or_null("/root/EventBus")

func _db():
	if not _item_database:
		_item_database = get_node_or_null("/root/ItemDatabase")
	return _item_database

func _inv():
	if not _inventory:
		_inventory = get_node_or_null("/root/Inventory")
	return _inventory

func _gm():
	if not _game_manager:
		_game_manager = get_node_or_null("/root/GameManager")
	return _game_manager

func _cs():
	if not _character_system:
		_character_system = get_node_or_null("/root/CharacterSystem")
	return _character_system

func _eb():
	if not _event_bus:
		_event_bus = get_node_or_null("/root/EventBus")
	return _event_bus

# ------------------------------------------------------------------ merchants

func register_merchant(id: String, display_name: String, caps: int, barter_skill: int, stock_ids: Array, stock_amounts: Array) -> bool:
	## Register a merchant. If the id is already registered (e.g. restored from a
	## save file) the saved stock and caps are PRESERVED and nothing is rebuilt.
	if id.strip_edges() == "":
		return false
	if merchants.has(id):
		return true

	var db = _db()
	if db == null:
		return false

	var record := {
		"display_name": display_name if display_name != "" else id,
		"caps": max(0, caps),
		"barter_skill": max(0, barter_skill),
		"items": [],
	}

	for i in range(stock_ids.size()):
		var item_id := str(stock_ids[i])
		var amount := 0
		if i < stock_amounts.size():
			amount = int(stock_amounts[i])
		if amount <= 0:
			continue
		var def = db.get_item(item_id)
		if def == null:
			push_warning("TradeSystem: unknown stock item '%s' for merchant '%s'" % [item_id, id])
			continue
		# Split into stack-sized instances; create_instance() clamps the amount.
		var remaining := amount
		while remaining > 0:
			var chunk := remaining
			if def.is_stackable:
				chunk = min(remaining, int(def.max_stack_size))
			else:
				chunk = 1
			record.items.append(def.create_instance(chunk))
			remaining -= chunk

	merchants[id] = record
	return true

func has_merchant(id: String) -> bool:
	return merchants.has(id)

func get_merchant(id: String) -> Dictionary:
	if not merchants.has(id):
		return {}
	return (merchants[id] as Dictionary).duplicate(true)

func get_merchant_item_count(id: String, item_id: String) -> int:
	if not merchants.has(id):
		return 0
	var total := 0
	for instance in (merchants[id] as Dictionary).get("items", []):
		if str(instance.get("item_id", "")) == item_id:
			total += int(instance.get("amount", 0))
	return total

func get_merchant_caps(id: String) -> int:
	if not merchants.has(id):
		return 0
	return int((merchants[id] as Dictionary).get("caps", 0))

func set_barter_mod(value: int) -> void:
	barter_mod = value

# --------------------------------------------------------------------- pricing

func _player_barter() -> int:
	var cs = _cs()
	if cs and cs.has_method("get_character_sheet"):
		var sheet = cs.call("get_character_sheet")
		if sheet is Dictionary and sheet.has("skills") and sheet.skills is Dictionary:
			if (sheet.skills as Dictionary).has("barter"):
				return int((sheet.skills as Dictionary).get("barter", 0))
	var gm = _gm()
	if gm:
		var skills = (gm.get("player_data") as Dictionary).get("skills", {})
		if skills is Dictionary:
			return int((skills as Dictionary).get("barter", 0))
	return 0

func _has_master_trader() -> bool:
	var cs = _cs()
	if cs:
		var perks = (cs.get("character_data") as Dictionary).get("perks", [])
		if _perk_list_has(perks, MASTER_TRADER_PERK):
			return true
	var gm = _gm()
	if gm:
		var perks = (gm.get("player_data") as Dictionary).get("perks", [])
		if _perk_list_has(perks, MASTER_TRADER_PERK):
			return true
	return false

func _perk_list_has(perks, perk_id: String) -> bool:
	if not (perks is Array):
		return false
	for p in perks:
		if p is String and p == perk_id:
			return true
		if p is Dictionary:
			var pid := str(p.get("perk_id", p.get("id", "")))
			if pid == perk_id:
				return true
	return false

func compute_buy_price(merchant_id: String, item_id: String, amount: int) -> int:
	## Exact port of vanilla `_barter_compute_value()` (inventory.cc:4673-4702).
	## Returns -1 when the request is invalid.
	if amount <= 0 or not merchants.has(merchant_id):
		return -1
	var db = _db()
	if db == null:
		return -1
	var def = db.get_item(item_id)
	if def == null:
		return -1

	# cost = objectGetCost(table) for the NPC's offered goods.
	var cost := float(int(def.value) * amount)
	# itemGetTotalCaps(table): stock items carry no caps of their own.
	var caps := 0.0
	var cost_without_caps := cost - caps

	var perk_bonus := MASTER_TRADER_BONUS if _has_master_trader() else 0.0
	var party_barter := float(max(1, _player_barter()))
	var npc_barter := float(max(0, int((merchants[merchant_id] as Dictionary).get("barter_skill", 0))))

	var barter_mod_mult := (float(barter_mod) + 100.0 - perk_bonus) * 0.01
	if barter_mod_mult < 0.0:
		barter_mod_mult = 0.0099999998

	var balanced_cost := (160.0 + npc_barter) / (160.0 + party_barter) * (cost_without_caps * 2.0)
	# int() truncates toward zero, exactly like the C++ cast in vanilla.
	return int(barter_mod_mult * balanced_cost + caps)

func compute_sell_price(item_id: String, amount: int) -> int:
	## Raw objectGetCost() of the player's offer (inventory.cc:4743): no barter
	## multiplier on the sell side. Returns -1 for an invalid request.
	if amount <= 0:
		return -1
	var db = _db()
	if db == null:
		return -1
	var def = db.get_item(item_id)
	if def == null:
		return -1
	return int(def.value) * amount

# ---------------------------------------------------------------- caps helpers

func get_player_caps() -> int:
	var inv = _inv()
	if inv:
		return int(inv.call("get_money"))
	var gm = _gm()
	if gm:
		return int((gm.get("player_data") as Dictionary).get("caps", 0))
	return 0

func _sync_caps_to_game_manager() -> void:
	## Inventory is the authority; mirror its caps into GameManager.player_data.
	var gm = _gm()
	if gm == null:
		return
	var inv = _inv()
	var value := int(inv.call("get_money")) if inv else int((gm.get("player_data") as Dictionary).get("caps", 0))
	var player_data: Dictionary = gm.get("player_data")
	if player_data is Dictionary:
		player_data["caps"] = max(0, value)

func _change_player_caps(delta: int) -> bool:
	var inv = _inv()
	if inv:
		if delta < 0:
			if not bool(inv.call("remove_money", -delta)):
				return false
		else:
			inv.call("add_money", delta)
		_sync_caps_to_game_manager()
		return true
	var gm = _gm()
	if gm == null:
		return false
	var player_data: Dictionary = gm.get("player_data")
	var current := int(player_data.get("caps", 0))
	var new_value := current + delta
	if new_value < 0:
		return false
	player_data["caps"] = new_value
	return true

# ---------------------------------------------------------------- item helpers

func _can_fit_in_player_inventory(item_id: String, amount: int) -> bool:
	var inv = _inv()
	var db = _db()
	if inv == null or db == null:
		return false
	var def = db.get_item(item_id)
	if def == null:
		return false

	var weight := float(def.weight) * amount
	if float(inv.call("get_total_weight")) + weight > float(inv.get("max_weight")):
		return false

	var remaining := amount
	if def.is_stackable:
		for instance in inv.get("items"):
			if str(instance.get("item_id", "")) == item_id:
				var space := int(def.max_stack_size) - int(instance.get("amount", 0))
				if space > 0:
					remaining -= space
					if remaining <= 0:
						return true
	if remaining <= 0:
		return true
	var per_stack := int(def.max_stack_size) if def.is_stackable else 1
	if per_stack < 1:
		per_stack = 1
	var needed_stacks := int(ceil(float(remaining) / float(per_stack)))
	return (inv.get("items") as Array).size() + needed_stacks <= int(inv.get("max_slots"))

func _player_add_item(item_id: String, amount: int) -> bool:
	## Adds an amount split into legal stacks. Rolls back on partial failure.
	var inv = _inv()
	var db = _db()
	if inv == null or db == null:
		return false
	var def = db.get_item(item_id)
	if def == null:
		return false
	var added_chunks: Array = []
	var remaining := amount
	while remaining > 0:
		var chunk := remaining
		if def.is_stackable:
			chunk = min(remaining, int(def.max_stack_size))
		else:
			chunk = 1
		if not bool(inv.call("add_item", def.create_instance(chunk))):
			for c in added_chunks:
				inv.call("remove_item", item_id, int(c))
			return false
		added_chunks.append(chunk)
		remaining -= chunk
	return true

func _merchant_add_item(merchant: Dictionary, item_id: String, amount: int) -> void:
	var db = _db()
	var def = db.get_item(item_id) if db else null
	var remaining := amount
	if def and def.is_stackable:
		for instance in merchant.get("items", []):
			if str(instance.get("item_id", "")) == item_id:
				var space := int(def.max_stack_size) - int(instance.get("amount", 0))
				if space > 0:
					var add: int = mini(space, remaining)
					instance["amount"] = int(instance.get("amount", 0)) + add
					remaining -= add
					if remaining <= 0:
						return
	var items: Array = merchant.get("items", [])
	while remaining > 0:
		var chunk := 1
		if def and def.is_stackable:
			chunk = min(remaining, int(def.max_stack_size))
		items.append(def.create_instance(chunk) if def else {"item_id": item_id, "amount": chunk, "instance_id": ""})
		remaining -= chunk

func _merchant_remove_item(merchant: Dictionary, item_id: String, amount: int) -> void:
	var items: Array = merchant.get("items", [])
	var remaining := amount
	for i in range(items.size() - 1, -1, -1):
		var instance: Dictionary = items[i]
		if str(instance.get("item_id", "")) != item_id:
			continue
		var take: int = mini(remaining, int(instance.get("amount", 0)))
		instance["amount"] = int(instance.get("amount", 0)) - take
		remaining -= take
		if int(instance.get("amount", 0)) <= 0:
			items.remove_at(i)
		if remaining <= 0:
			return

# ------------------------------------------------------------------ operations

func _result(ok: bool, reason: String, price: int = 0) -> Dictionary:
	return {"ok": ok, "reason": reason, "price": price}

func buy(merchant_id: String, item_id: String, amount: int) -> Dictionary:
	## Player buys `amount` of `item_id` from the merchant.
	## ATOMIC: every check happens before any mutation.
	if amount <= 0:
		return _result(false, "invalid_amount")
	if not merchants.has(merchant_id):
		return _result(false, "invalid_merchant")
	var db = _db()
	if db == null:
		return _result(false, "no_item_database")
	var def = db.get_item(item_id)
	if def == null:
		return _result(false, "invalid_item")
	var stock := get_merchant_item_count(merchant_id, item_id)
	if stock < amount:
		return _result(false, "not_enough_stock")
	var price := compute_buy_price(merchant_id, item_id, amount)
	if price < 0:
		return _result(false, "invalid_price")
	if get_player_caps() < price:
		return _result(false, "not_enough_caps")
	if not _can_fit_in_player_inventory(item_id, amount):
		return _result(false, "inventory_full")

	# ---- mutations start here ----
	if not _player_add_item(item_id, amount):
		return _result(false, "inventory_rejected")
	var merchant: Dictionary = merchants[merchant_id]
	_merchant_remove_item(merchant, item_id, amount)
	if not _change_player_caps(-price):
		# Roll back the item move so the failure stays atomic.
		var inv = _inv()
		if inv:
			inv.call("remove_item", item_id, amount)
		_merchant_add_item(merchant, item_id, amount)
		return _result(false, "caps_sync_failed")

	var eb = _eb()
	if eb and eb.has_signal("item_picked_up"):
		eb.emit("item_picked_up", [item_id, amount])
	return _result(true, "ok", price)

func sell(merchant_id: String, item_id: String, amount: int) -> Dictionary:
	## Player sells `amount` of `item_id` to the merchant for raw item value.
	if amount <= 0:
		return _result(false, "invalid_amount")
	if not merchants.has(merchant_id):
		return _result(false, "invalid_merchant")
	var db = _db()
	if db == null:
		return _result(false, "no_item_database")
	var def = db.get_item(item_id)
	if def == null:
		return _result(false, "invalid_item")
	var inv = _inv()
	if inv == null:
		return _result(false, "no_inventory")
	if not bool(inv.call("has_item", item_id, amount)):
		return _result(false, "not_enough_items")
	var price := compute_sell_price(item_id, amount)
	if price < 0:
		return _result(false, "invalid_price")
	var merchant: Dictionary = merchants[merchant_id]
	if int(merchant.get("caps", 0)) < price:
		return _result(false, "merchant_not_enough_caps")

	# ---- mutations start here ----
	var removed := int(inv.call("remove_item", item_id, amount))
	if removed != amount:
		# Should be impossible after the has_item() check; restore what we took.
		if removed > 0:
			_player_add_item(item_id, removed)
		return _result(false, "remove_failed")
	_merchant_add_item(merchant, item_id, amount)
	merchant["caps"] = int(merchant.get("caps", 0)) - price
	if not _change_player_caps(price):
		merchant["caps"] = int(merchant.get("caps", 0)) + price
		_merchant_remove_item(merchant, item_id, amount)
		_player_add_item(item_id, amount)
		return _result(false, "caps_sync_failed")

	var eb = _eb()
	if eb and eb.has_signal("item_dropped"):
		eb.emit("item_dropped", [item_id, amount])
	return _result(true, "ok", price)

# ----------------------------------------------------------------- persistence

func get_save_data() -> Dictionary:
	## Serializable merchant state keyed by merchant id (no Node references).
	return merchants.duplicate(true)

func load_save_data(data) -> void:
	## Restores merchant stock/caps. Missing or corrupt data leaves the current
	## registry untouched (backward compatible with saves lacking "merchants").
	if not (data is Dictionary):
		return
	var source: Dictionary = data
	if source.has("merchants") and source["merchants"] is Dictionary:
		source = source["merchants"]
	if source.is_empty():
		return

	var db = _db()
	for id in source.keys():
		var raw = source[id]
		if not (raw is Dictionary):
			continue
		var record := {
			"display_name": str(raw.get("display_name", str(id))),
			"caps": max(0, int(raw.get("caps", 0))),
			"barter_skill": max(0, int(raw.get("barter_skill", 0))),
			"items": [],
		}
		var items = raw.get("items", [])
		if items is Array:
			for entry in items:
				if not (entry is Dictionary):
					continue
				var item_id := str(entry.get("item_id", ""))
				var amount := int(entry.get("amount", 0))
				if item_id == "" or amount <= 0:
					continue
				if db and db.get_item(item_id) == null:
					continue
				record["items"].append({
					"item_id": item_id,
					"amount": amount,
					"instance_id": str(entry.get("instance_id", "")),
				})
		merchants[str(id)] = record

func clear_merchants() -> void:
	merchants.clear()
