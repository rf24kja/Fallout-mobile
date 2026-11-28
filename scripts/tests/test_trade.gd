extends SceneTree

## PHASE 2 - barter / trade tests (14 real checks).
## Exercises TradeSystem and the EventBus/NPC/UI integration headlessly.
## Run: godot --headless --path . --script scripts/tests/test_trade.gd --quit-after 90

const TEST_MERCHANT := "test_trade_trader"
const DialogueTypes = preload("res://scripts/systems/dialogue_types.gd")
const TRADE_UI_SCENE := "res://scenes/ui/trade_ui.tscn"
const TEST_MAP_SCENE := "res://scenes/world/test_map.tscn"

var _passed: int = 0
var _failed: int = 0

var _ts: Node = null
var _inv: Node = null
var _db: Node = null
var _gm: Node = null
var _cs: Node = null
var _eb: Node = null

var _test_npc: Node = null
var _trade_hits: int = 0
var _dialogue_hits: int = 0

var _backup_merchants: Dictionary = {}
var _backup_barter_mod: int = 0
var _backup_reaction_modifier: int = 0
var _backup_inv: Dictionary = {}
var _backup_gm_caps: int = 0
var _backup_barter_skill: int = -1
var _backup_perks: Array = []

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	print("=== TRADE TESTS ===")
	_ts = root.get_node_or_null("TradeSystem")
	_inv = root.get_node_or_null("Inventory")
	_db = root.get_node_or_null("ItemDatabase")
	_gm = root.get_node_or_null("GameManager")
	_cs = root.get_node_or_null("CharacterSystem")
	_eb = root.get_node_or_null("EventBus")
	if _ts == null or _inv == null or _db == null or _gm == null or _cs == null or _eb == null:
		_expect("autoloads_available", false, "TradeSystem=%s Inventory=%s ItemDatabase=%s GameManager=%s CharacterSystem=%s EventBus=%s" % [
			str(_ts), str(_inv), str(_db), str(_gm), str(_cs), str(_eb)])
		_finish()
		return
	_expect("autoloads_available", true, "all trade/autoload nodes present")
	_backup_state()
	await _run_tests()
	_restore_state()
	_finish()

func _backup_state() -> void:
	_backup_merchants = _ts.call("get_save_data")
	_backup_barter_mod = int(_ts.get("barter_mod"))
	_backup_reaction_modifier = int(_ts.get("reaction_modifier"))
	_backup_inv = _inv.call("get_save_data")
	_backup_gm_caps = int((_gm.get("player_data") as Dictionary).get("caps", 0))
	var char_data: Dictionary = _cs.get("character_data")
	_backup_barter_skill = int(((char_data.get("skills", {}) as Dictionary)).get("barter", -1))
	_backup_perks = (char_data.get("perks", []) as Array).duplicate(true)

func _restore_state() -> void:
	_ts.call("load_save_data", _backup_merchants)
	_ts.call("set_barter_mod", _backup_barter_mod)
	_ts.set("reaction_modifier", _backup_reaction_modifier)
	_inv.call("load_save_data", _backup_inv)
	var player_data: Dictionary = _gm.get("player_data")
	player_data["caps"] = _backup_gm_caps
	var char_data: Dictionary = _cs.get("character_data")
	var skills: Dictionary = char_data.get("skills", {})
	if _backup_barter_skill >= 0:
		skills["barter"] = _backup_barter_skill
	else:
		skills.erase("barter")
	char_data["perks"] = _backup_perks.duplicate(true)
	if _test_npc and is_instance_valid(_test_npc):
		_test_npc.queue_free()

func _setup() -> void:
	_ts.call("clear_merchants")
	_ts.call("set_barter_mod", 0)
	var player_data: Dictionary = _gm.get("player_data")
	var char_data: Dictionary = _cs.get("character_data")
	var skills: Dictionary = char_data.get("skills", {})
	skills["barter"] = 60
	char_data["perks"] = []
	player_data["perks"] = []
	_ts.call("register_merchant", TEST_MERCHANT, "Тестовый торговец", 600, 60,
		["stimpak", "first_aid_kit", "38_standard", "scrap_pistol", "leather_armor"],
		[5, 3, 20, 1, 1])
	_inv.call("clear")
	_inv.call("add_money", 1000)
	player_data["caps"] = 1000

func _set_player_caps(value: int) -> void:
	_inv.set("caps", value)
	var player_data: Dictionary = _gm.get("player_data")
	player_data["caps"] = value

func _add_npc_children(npc: Node) -> void:
	# The real scene provides these nodes; a bare NPC instance needs them to
	# avoid harmless but noisy $Node lookup errors during _ready().
	var interactable_script = load("res://scripts/systems/interactable.gd")
	var interactable: Node = interactable_script.new() if interactable_script else Node.new()
	interactable.name = "Interactable"
	npc.add_child(interactable)
	var shape := CollisionShape2D.new()
	shape.name = "CollisionShape2D"
	npc.add_child(shape)
	var sprite := AnimatedSprite2D.new()
	sprite.name = "AnimatedSprite2D"
	npc.add_child(sprite)
	var indicator := Panel.new()
	indicator.name = "InteractionIndicator"
	npc.add_child(indicator)

func _run_tests() -> void:
	_setup()

	# ------------------------------------------------ 1 merchant-only entry
	_trade_hits = 0
	_dialogue_hits = 0
	_eb.trade_requested.connect(_on_trade_signal)
	_eb.dialogue_started.connect(_on_dialogue_signal)
	var npc_script = load("res://scripts/entities/npc.gd")
	_test_npc = npc_script.new()
	_test_npc.set("is_merchant", true)
	_test_npc.set("merchant_id", TEST_MERCHANT)
	_test_npc.set("merchant_name", "Тестовый торговец")
	_test_npc.set("merchant_caps", 600)
	_test_npc.set("merchant_barter_skill", 60)
	_test_npc.set("merchant_stock", ["stimpak"])
	_test_npc.set("merchant_stock_amounts", [1])
	_add_npc_children(_test_npc)
	root.add_child(_test_npc)
	await process_frame
	_test_npc.call("_on_interaction_started", null)
	var merchant_entry := _trade_hits == 1 and _dialogue_hits == 0 and bool(_ts.call("has_merchant", TEST_MERCHANT))
	var talker = npc_script.new()
	talker.set("dialogue_id", "generic")
	_add_npc_children(talker)
	root.add_child(talker)
	await process_frame
	talker.call("_on_interaction_started", null)
	merchant_entry = merchant_entry and _dialogue_hits == 1 and _trade_hits == 1
	talker.queue_free()
	_expect("merchant_only_entry", merchant_entry, "trade=%d dialogue=%d registered=%s" % [
		_trade_hits, _dialogue_hits, str(_ts.call("has_merchant", TEST_MERCHANT))])

	# ----------------------------------------- 2 buy/sell change both stores
	var player_before := int(_inv.call("get_item_count", "stimpak"))
	var stock_before := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak"))
	var caps_before := int(_inv.call("get_money"))
	var price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 2))
	var buy: Dictionary = _ts.call("buy", TEST_MERCHANT, "stimpak", 2)
	var after_buy_player := int(_inv.call("get_item_count", "stimpak"))
	var after_buy_stock := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak"))
	var after_buy_caps := int(_inv.call("get_money"))
	var after_buy_gm := int((_gm.get("player_data") as Dictionary).get("caps", -1))
	var buy_ok := bool(buy.get("ok", false)) and after_buy_player == player_before + 2 \
		and after_buy_stock == stock_before - 2 and after_buy_caps == caps_before - price \
		and after_buy_gm == after_buy_caps
	var sell: Dictionary = _ts.call("sell", TEST_MERCHANT, "stimpak", 1)
	var sell_value := int(_ts.call("compute_sell_price", "stimpak", 1))
	var after_sell_player := int(_inv.call("get_item_count", "stimpak"))
	var after_sell_stock := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak"))
	var after_sell_caps := int(_inv.call("get_money"))
	var sell_ok := bool(sell.get("ok", false)) and after_sell_player == after_buy_player - 1 \
		and after_sell_stock == after_buy_stock + 1 and after_sell_caps == after_buy_caps + sell_value \
		and int((_gm.get("player_data") as Dictionary).get("caps", -1)) == after_sell_caps
	_expect("buy_sell_update_both_inventories", buy_ok and sell_ok, "buy=%s sell=%s caps=%d price=%d sell_value=%d" % [
		str(buy), str(sell), after_sell_caps, price, sell_value])

	# ------------------------------------------------------ 3 multi quantity
	var kit_before := int(_inv.call("get_item_count", "first_aid_kit"))
	var kit_stock_before := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "first_aid_kit"))
	var kit_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "first_aid_kit", 3))
	var result3: Dictionary = _ts.call("buy", TEST_MERCHANT, "first_aid_kit", 3)
	var multi_ok := bool(result3.get("ok", false)) \
		and int(_inv.call("get_item_count", "first_aid_kit")) == kit_before + 3 \
		and int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "first_aid_kit")) == kit_stock_before - 3 \
		and int(result3.get("price", -1)) == kit_price \
		and kit_price == 3 * int(_ts.call("compute_buy_price", TEST_MERCHANT, "first_aid_kit", 1))
	_expect("multi_quantity", multi_ok, "result=%s price=%d" % [str(result3), kit_price])

	# ------------------------------------- 4 over-stock / over-player refused
	var before_state: Dictionary = _ts.call("get_save_data")
	var before_inv: Dictionary = _inv.call("get_save_data")
	var over_stock: Dictionary = _ts.call("buy", TEST_MERCHANT, "stimpak", 999)
	var over_player: Dictionary = _ts.call("sell", TEST_MERCHANT, "stimpak", 999)
	var refusal_ok: bool = not bool(over_stock.get("ok", true)) and str(over_stock.get("reason", "")) == "not_enough_stock" \
		and not bool(over_player.get("ok", true)) and str(over_player.get("reason", "")) == "not_enough_items" \
		and _ts.call("get_save_data") == before_state and _inv.call("get_save_data") == before_inv
	_expect("over_stock_and_over_player_refused", refusal_ok, "buy=%s sell=%s" % [str(over_stock), str(over_player)])

	# --------------------------------------------------- 5 insufficient caps
	var stock_before_nocaps := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak"))
	var items_before_nocaps := int(_inv.call("get_item_count", "stimpak"))
	_set_player_caps(0)
	var no_caps: Dictionary = _ts.call("buy", TEST_MERCHANT, "stimpak", 1)
	var caps_state_ok := not bool(no_caps.get("ok", true)) and str(no_caps.get("reason", "")) == "not_enough_caps" \
		and int(_inv.call("get_money")) == 0 \
		and int(_inv.call("get_item_count", "stimpak")) == items_before_nocaps \
		and int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak")) == stock_before_nocaps
	_set_player_caps(1000)
	_expect("insufficient_caps", caps_state_ok, "result=%s caps=%d" % [str(no_caps), int(_inv.call("get_money"))])

	# ------------------------------------------------------ 6 no negative caps
	var leather_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "leather_armor", 1))
	_set_player_caps(leather_price)
	var exact_buy: Dictionary = _ts.call("buy", TEST_MERCHANT, "leather_armor", 1)
	var no_negative := bool(exact_buy.get("ok", false)) and int(_inv.call("get_money")) == 0 \
		and int((_gm.get("player_data") as Dictionary).get("caps", -1)) == 0 \
		and int(_inv.call("get_item_count", "leather_armor")) == 1
	_set_player_caps(1000)
	_expect("no_negative_caps", no_negative, "price=%d result=%s caps=%d" % [leather_price, str(exact_buy), 0])

	# --------------------------------------------- 7 barter skill changes price
	var skills: Dictionary = (_cs.get("character_data") as Dictionary).get("skills", {})
	skills["barter"] = 10
	var low_skill_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	skills["barter"] = 200
	var high_skill_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	skills["barter"] = 60
	_expect("price_depends_on_barter_skill", low_skill_price > high_skill_price and low_skill_price > 0 and high_skill_price > 0,
		"low=%d high=%d" % [low_skill_price, high_skill_price])

	# ------------------------------------------ 8 reaction modifier changes price
	_ts.call("set_barter_mod", 0)
	var neutral_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	_ts.call("set_barter_mod", -15)
	var good_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	var expected_good := int(0.85 * float(neutral_price))
	_ts.call("set_barter_mod", 0)
	_expect("price_depends_on_reaction_mod", good_price < neutral_price and good_price == expected_good,
		"neutral=%d good=%d expected=%d" % [neutral_price, good_price, expected_good])

	# ------------------------------------------------ 9 Master Trader discount
	var char_data: Dictionary = _cs.get("character_data")
	char_data["perks"] = []
	var base_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	char_data["perks"] = [{"perk_id": "master_trader", "rank": 1}]
	var perk_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	var expected_perk := int(0.75 * float(base_price))
	char_data["perks"] = []
	_expect("master_trader_discount", perk_price < base_price and perk_price == expected_perk,
		"base=%d perk=%d expected=%d" % [base_price, perk_price, expected_perk])

	# ------------------------------------- 10 cancelled/errored trade is atomic
	var state_before_error: Dictionary = _ts.call("get_save_data")
	var inv_before_error: Dictionary = _inv.call("get_save_data")
	var invalid_item: Dictionary = _ts.call("buy", TEST_MERCHANT, "does_not_exist", 1)
	var invalid_amount: Dictionary = _ts.call("sell", TEST_MERCHANT, "stimpak", 0)
	var invalid_merchant: Dictionary = _ts.call("buy", "no_such_merchant", "stimpak", 1)
	var unchanged: bool = not bool(invalid_item.get("ok", true)) and not bool(invalid_amount.get("ok", true)) \
		and not bool(invalid_merchant.get("ok", true)) \
		and _ts.call("get_save_data") == state_before_error and _inv.call("get_save_data") == inv_before_error
	_expect("failed_trade_leaves_state_unchanged", unchanged, "item=%s amount=%s merchant=%s" % [
		str(invalid_item), str(invalid_amount), str(invalid_merchant)])

	# ------------------------------------------ 11 save/load has no duplication
	var before_save: Dictionary = _ts.call("get_save_data")
	var before_save_inv: Dictionary = _inv.call("get_save_data")
	var load_result: Dictionary = _ts.call("get_save_data")
	_ts.call("load_save_data", load_result)
	var after_load: Dictionary = _ts.call("get_save_data")
	var save_ok: bool = after_load == before_save and _inv.call("get_save_data") == before_save_inv
	_ts.call("load_save_data", before_save)
	save_ok = save_ok and _ts.call("get_save_data") == before_save
	_ts.call("load_save_data", {})
	save_ok = save_ok and _ts.call("get_save_data") == before_save
	_expect("save_load_no_duplication_or_cap_loss", save_ok, "merchants=%d" % after_load.size())

	# ----------------------------------------- 12 repeat buy does not restock
	var all_stock := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak"))
	var buy_all: Dictionary = _ts.call("buy", TEST_MERCHANT, "stimpak", all_stock)
	var repeat: Dictionary = _ts.call("buy", TEST_MERCHANT, "stimpak", 1)
	var repeat_ok := bool(buy_all.get("ok", false)) and not bool(repeat.get("ok", true)) \
		and str(repeat.get("reason", "")) == "not_enough_stock" \
		and int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak")) == 0
	_ts.call("load_save_data", _ts.call("get_save_data"))
	repeat_ok = repeat_ok and int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "stimpak")) == 0
	_expect("repeat_buy_does_not_restore_stock", repeat_ok, "stock=%d buy_all=%s repeat=%s" % [
		all_stock, str(buy_all), str(repeat)])

	# ------------------------------------------------- 13 different item types
	var pistol_stock := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "scrap_pistol"))
	var pistol_buy: Dictionary = _ts.call("buy", TEST_MERCHANT, "scrap_pistol", 1)
	var pistol_after_buy := int(_inv.call("get_item_count", "scrap_pistol"))
	var stock_after_buy := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "scrap_pistol"))
	var pistol_sell: Dictionary = _ts.call("sell", TEST_MERCHANT, "scrap_pistol", 1)
	var player_after_sell := int(_inv.call("get_item_count", "scrap_pistol"))
	var stock_after_sell := int(_ts.call("get_merchant_item_count", TEST_MERCHANT, "scrap_pistol"))
	var types_ok := pistol_stock == 1 and bool(pistol_buy.get("ok", false)) and pistol_after_buy == 1 \
		and stock_after_buy == 0 and bool(pistol_sell.get("ok", false)) \
		and player_after_sell == 0 and stock_after_sell == 1
	_expect("different_item_types", types_ok, "buy=%s sell=%s stock_before=%d player_after_buy=%d stock_after_buy=%d player_after_sell=%d stock_after_sell=%d" % [
		str(pistol_buy), str(pistol_sell), pistol_stock, pistol_after_buy,
		stock_after_buy, player_after_sell, stock_after_sell])

	# ------------------------------------------------------ 14 UI + merchant map
	var ui_packed = load(TRADE_UI_SCENE)
	var map_packed = load(TEST_MAP_SCENE)
	var ui_ok := ui_packed != null and map_packed != null
	var ui_instance: Node = null
	var ui_panel: Panel = null
	if ui_packed:
		ui_instance = (ui_packed as PackedScene).instantiate()
		root.add_child(ui_instance)
		ui_panel = ui_instance.get_node_or_null("TradePanel") as Panel
	ui_ok = ui_ok and ui_panel != null
	if ui_ok and _eb:
		_eb.emit("trade_requested", [_test_npc])
		ui_ok = ui_panel.visible
		_eb.emit("trade_closed")
		ui_ok = ui_ok and not ui_panel.visible
	var map_state = map_packed.get_state() if map_packed else null
	var merchant_in_map := false
	if map_state:
		for i in range(map_state.get_node_count()):
			if map_state.get_node_name(i) == "MerchantNPC":
				merchant_in_map = true
				for j in range(map_state.get_node_property_count(i)):
					if map_state.get_node_property_name(i, j) == "is_merchant":
						merchant_in_map = bool(map_state.get_node_property_value(i, j))
				break
	ui_ok = ui_ok and merchant_in_map
	if ui_instance:
		ui_instance.queue_free()
	_expect("ui_and_merchant_scene", ui_ok, "ui=%s panel=%s merchant_in_map=%s" % [
		str(ui_packed != null), str(ui_panel != null), str(merchant_in_map)])

	# --------------- 15 vanilla numeric buy prices (stimpak 40, leather 300)
	_ts.call("set_barter_mod", 0)
	_ts.call("set_reaction_value", 0)
	var skills_numeric: Dictionary = (_cs.get("character_data") as Dictionary).get("skills", {})
	skills_numeric["barter"] = 60
	var stimpak_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	var leather_price_vanilla := int(_ts.call("compute_buy_price", TEST_MERCHANT, "leather_armor", 1))
	_expect("vanilla_buy_prices", stimpak_price == 80 and leather_price_vanilla == 600,
		"stimpak=%d leather=%d" % [stimpak_price, leather_price_vanilla])

	# ------------------------- 16 vanilla reaction thresholds (inventory.cc)
	_ts.call("set_reaction_value", 11)
	var good_price_vanilla := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	_ts.call("set_reaction_value", 0)
	var neutral_price_vanilla := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	_ts.call("set_reaction_value", -11)
	var bad_price_vanilla := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	_ts.call("set_reaction_value", 0)
	_expect("vanilla_reaction_thresholds", good_price_vanilla == 68 and neutral_price_vanilla == 80 and bad_price_vanilla == 100,
		"good=%d neutral=%d bad=%d" % [good_price_vanilla, neutral_price_vanilla, bad_price_vanilla])

	# ----------------- 17 SET_BARTER_MOD dialogue consequence (opcode 0x814E)
	var consequence = DialogueTypes.DialogueConsequence.new()
	consequence.consequence_type = DialogueTypes.DialogueConsequence.ConsequenceType.SET_BARTER_MOD
	consequence.barter_mod_value = -15
	consequence.apply(null, null)
	var dialogue_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	_ts.call("set_barter_mod", 0)
	_expect("dialogue_set_barter_mod", dialogue_price == 68, "dialogue_price=%d" % dialogue_price)

	# ----------------------------- 18 zero Barter skill is not clamped to 1
	skills_numeric["barter"] = 0
	var zero_skill_price := int(_ts.call("compute_buy_price", TEST_MERCHANT, "stimpak", 1))
	skills_numeric["barter"] = 60
	_expect("zero_barter_no_clamp", zero_skill_price == 110, "price=%d" % zero_skill_price)

func _on_trade_signal(_npc: Node) -> void:
	_trade_hits += 1

func _on_dialogue_signal(_dialogue_id: String) -> void:
	_dialogue_hits += 1

func _expect(name: String, condition: bool, detail: String = "") -> void:
	if condition:
		_passed += 1
		print("TEST %s: PASS" % name)
	else:
		_failed += 1
		print("TEST %s: FAIL (%s)" % [name, detail])

func _finish() -> void:
	print("=== SUMMARY ===")
	print("Passed: ", _passed)
	print("Failed: ", _failed)
	print("Total: ", _passed + _failed)
	if _failed > 0:
		print("RESULT: FAIL")
		quit(1)
	else:
		print("RESULT: ALL PASS")
		quit(0)
