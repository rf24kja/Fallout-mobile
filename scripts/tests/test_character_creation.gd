extends SceneTree

## PHASE 1 — character creation tests.
## Verifies the rules engine, the creation UI and the GameManager handoff:
##   1. creation opens from the main menu Start button
##   2. an invalid character cannot be confirmed
##   3. base SPECIAL is 5 per stat (sum 35)
##   4. SPECIAL is clamped to 1..10
##   5. the 5 allocation points cannot be overspent
##   6. skills are recalculated with the vanilla formula
##   7. at most 2 traits
##   8. exactly 3 tag skills
##   9. confirm creates a Character and applies it to GameManager
##  10. the player starts in the campaign (starting location)
##  11. save/load restores the created character
##  12. a new game resets inventory items, equipment and caps
##
## Run: godot --headless --path . --script scripts/tests/test_character_creation.gd --quit-after 60

const CharacterCreationRules = preload("res://scripts/systems/character_creation.gd")

const MAIN_MENU_SCENE := "res://scenes/ui/main_menu.tscn"
const CREATION_SCENE := "res://scenes/ui/character_creation_ui.tscn"
const CAMPAIGN_SCENE := "res://scenes/campaign/campaign_root.tscn"
const SAVE_SLOT := 7
const MENU_DEBUG_PATH := "user://mainmenu_debug.txt"

var _passed: int = 0
var _failed: int = 0

var _gm: Node = null
var _cs: Node = null
var _eb: Node = null
var _save: Node = null
var _inv: Node = null
var _db: Node = null

var _menu_debug_backup: String = ""
var _menu_debug_existed: bool = false

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	print("=== CHARACTER CREATION TESTS ===")
	_gm = root.get_node_or_null("GameManager")
	_cs = root.get_node_or_null("CharacterSystem")
	_eb = root.get_node_or_null("EventBus")
	_save = root.get_node_or_null("SaveSystem")
	_inv = root.get_node_or_null("Inventory")
	_db = root.get_node_or_null("ItemDatabase")

	if _gm == null or _cs == null:
		_expect("autoloads_available", false, "GameManager=%s CharacterSystem=%s" % [str(_gm), str(_cs)])
		_finish()
		return

	_backup_menu_debug()
	await _run_tests()
	_finish()

func _run_tests() -> void:
	# ------------------------------------------------ 1 creation opens from menu
	var menu = await _goto(MAIN_MENU_SCENE)
	var start_button: Button = menu.get_node_or_null("ButtonContainer/StartButton") if menu else null
	var pressed := false
	if start_button:
		start_button.pressed.emit()
		pressed = true
	await _wait_frames(8)
	var creation = current_scene
	var creation_path := ""
	if creation:
		creation_path = creation.scene_file_path
	_expect("creation_opens_from_menu", pressed and creation_path == CREATION_SCENE, "pressed=%s scene=%s" % [str(pressed), creation_path])
	if creation_path != CREATION_SCENE:
		return

	var ui = creation

	# --------------------------------------------- 2 invalid character rejected
	var ui_config: Dictionary = ui.get_config()
	var default_valid: Dictionary = CharacterCreationRules.validate(ui_config)
	var confirm_before: bool = bool(ui.is_confirm_enabled())
	ui.call("_on_confirm_pressed")
	await _wait_frames(2)
	var still_creation := current_scene != null and current_scene.scene_file_path == CREATION_SCENE
	var cs_has_effective: bool = (_cs.get("character_data") as Dictionary).has("effective_special")
	_expect("invalid_cannot_confirm", not bool(default_valid.get("ok", true)) and not confirm_before and still_creation and not cs_has_effective,
		"valid=%s confirm_enabled=%s still_creation=%s cs_effective=%s" % [str(default_valid.get("ok", true)), str(confirm_before), str(still_creation), str(cs_has_effective)])

	# ------------------------------------------------------ 3 base SPECIAL = 5
	var base_cfg: Dictionary = CharacterCreationRules.create_default_config("Base")
	var base_sum: int = CharacterCreationRules.sum_special(base_cfg)
	var all_base := true
	for stat_key in CharacterCreationRules.SPECIAL_KEYS:
		if CharacterCreationRules.get_stat(base_cfg, str(stat_key)) != CharacterCreationRules.BASE_STAT:
			all_base = false
	_expect("special_base_5", base_sum == 35 and all_base, "sum=%d all_base=%s" % [base_sum, str(all_base)])

	# --------------------------------------------------------- 4 clamp 1..10
	var clamp_cfg: Dictionary = CharacterCreationRules.create_default_config("Clamp")
	for i in range(CharacterCreationRules.ALLOC_POINTS):
		CharacterCreationRules.increase(clamp_cfg, "might")
	var max_reached: int = CharacterCreationRules.get_stat(clamp_cfg, "might")
	var plus_blocked: bool = not CharacterCreationRules.can_increase(clamp_cfg, "might")
	for i in range(20):
		CharacterCreationRules.decrease(clamp_cfg, "might")
	var min_reached: int = CharacterCreationRules.get_stat(clamp_cfg, "might")
	var minus_blocked: bool = not CharacterCreationRules.can_decrease(clamp_cfg, "might")
	_expect("stat_clamp_1_10", max_reached == 10 and plus_blocked and min_reached == 1 and minus_blocked,
		"max=%d plus_blocked=%s min=%d minus_blocked=%s" % [max_reached, str(plus_blocked), min_reached, str(minus_blocked)])

	# ------------------------------------------------------ 5 no overspending
	var spend_cfg: Dictionary = CharacterCreationRules.create_default_config("Spend")
	CharacterCreationRules.increase(spend_cfg, "might")
	CharacterCreationRules.increase(spend_cfg, "might")
	CharacterCreationRules.increase(spend_cfg, "vigor")
	CharacterCreationRules.increase(spend_cfg, "dexterity")
	CharacterCreationRules.increase(spend_cfg, "fortune")
	var remaining_after: int = CharacterCreationRules.remaining_points(spend_cfg)
	var extra_ok: bool = CharacterCreationRules.increase(spend_cfg, "presence")
	var total_after: int = CharacterCreationRules.sum_special(spend_cfg)
	_expect("no_overspend", remaining_after == 0 and not extra_ok and total_after == 40,
		"remaining=%d extra_increase=%s sum=%d" % [remaining_after, str(extra_ok), total_after])

	# ------------------------------------------------- 6 vanilla skill formula
	var skill_cfg: Dictionary = CharacterCreationRules.create_default_config("Skills")
	for skill_id in ["small_guns", "speech", "lockpick"]:
		CharacterCreationRules.toggle_tag_skill(skill_cfg, str(skill_id))
	var calc: Dictionary = CharacterCreationRules.calculate(skill_cfg)
	var skills: Dictionary = calc.get("skills", {})
	var small_guns: int = int(skills.get("small_guns", 0))   # 5 + 4*AGI + 20 (tagged)
	var big_guns: int = int(skills.get("big_guns", 0))       # 0 + 2*AGI
	var unarmed: int = int(skills.get("unarmed", 0))         # 30 + 2*(AGI+STR)
	var outdoorsman: int = int(skills.get("outdoorsman", 0)) # 0 + 2*(END+INT)
	var lockpick: int = int(skills.get("lockpick", 0))       # 10 + 1*(PER+AGI) + 20 (tagged)
	# STR 8: unarmed/melee use both AGI and STR.
	CharacterCreationRules.increase(skill_cfg, "might")
	CharacterCreationRules.increase(skill_cfg, "might")
	CharacterCreationRules.increase(skill_cfg, "might")
	var calc_strong: Dictionary = CharacterCreationRules.calculate(skill_cfg)
	var strong_skills: Dictionary = calc_strong.get("skills", {})
	var unarmed_strong: int = int(strong_skills.get("unarmed", 0)) # 30 + 2*(5+8)
	_expect("skills_recalculated",
		small_guns == 45 and big_guns == 10 and unarmed == 50 and outdoorsman == 20 and lockpick == 40 and unarmed_strong == 56,
		"small_guns=%d big_guns=%d unarmed=%d outdoorsman=%d lockpick=%d unarmed_str8=%d" % [small_guns, big_guns, unarmed, outdoorsman, lockpick, unarmed_strong])

	# ------------------------------------------------------------- 7 max 2 traits
	var trait_cfg: Dictionary = CharacterCreationRules.create_default_config("Traits")
	var t1: bool = CharacterCreationRules.toggle_trait(trait_cfg, "gifted")
	var t2: bool = CharacterCreationRules.toggle_trait(trait_cfg, "bruiser")
	var t3: bool = CharacterCreationRules.toggle_trait(trait_cfg, "finesse")
	var trait_count: int = (trait_cfg.get("traits", []) as Array).size()
	var gifted_effective: Dictionary = CharacterCreationRules.effective_special(trait_cfg)
	var bruiser_derived: Dictionary = CharacterCreationRules.calculate(trait_cfg).get("derived", {})
	# Gifted raises AGI 5→6 (AP 5+3), Bruiser costs 2 AP → 6.
	_expect("max_two_traits",
		t1 and t2 and not t3 and trait_count == 2
			and int(gifted_effective.get("might", 0)) == 8
			and int(bruiser_derived.get("max_action_points", 0)) == 6,
		"t1=%s t2=%s t3=%s count=%d might=%d ap=%d" % [str(t1), str(t2), str(t3), trait_count, int(gifted_effective.get("might", 0)), int(bruiser_derived.get("max_action_points", 0))])

	# --------------------------------------------------------- 8 exactly 3 tags
	var tag_cfg: Dictionary = CharacterCreationRules.create_default_config("Tags")
	var tags_ok := true
	for skill_id in ["small_guns", "speech", "science"]:
		tags_ok = tags_ok and CharacterCreationRules.toggle_tag_skill(tag_cfg, str(skill_id))
	var fourth: bool = CharacterCreationRules.toggle_tag_skill(tag_cfg, "repair")
	var tag_count: int = (tag_cfg.get("tag_skills", []) as Array).size()
	_expect("three_tag_skills", tags_ok and not fourth and tag_count == 3,
		"three_added=%s fourth=%s count=%d" % [str(tags_ok), str(fourth), tag_count])

	# --------------------------------- 9 confirm creates and applies Character
	var hero_cfg: Dictionary = CharacterCreationRules.create_default_config("Test Wanderer")
	hero_cfg["gender"] = "female"
	hero_cfg["age"] = 30
	CharacterCreationRules.increase(hero_cfg, "might")
	CharacterCreationRules.increase(hero_cfg, "might")
	CharacterCreationRules.increase(hero_cfg, "vigor")
	CharacterCreationRules.increase(hero_cfg, "dexterity")
	CharacterCreationRules.increase(hero_cfg, "intellect")
	for skill_id in ["small_guns", "speech", "science"]:
		CharacterCreationRules.toggle_tag_skill(hero_cfg, str(skill_id))
	CharacterCreationRules.toggle_trait(hero_cfg, "gifted")
	var hero_validation: Dictionary = CharacterCreationRules.validate(hero_cfg)
	var hero_calc: Dictionary = CharacterCreationRules.calculate(hero_cfg)
	var expected_hp: int = int(hero_calc.get("derived", {}).get("max_hp", 0))
	var expected_skills: Dictionary = hero_calc.get("skills", {})

	# Simulate leftovers from a previous session (regression: new game must reset).
	var item_def = _db.call("get_item", "power_cell") if _db else null
	var polluted := false
	if item_def and _inv:
		polluted = bool(_inv.call("add_item", item_def.call("create_instance", 1)))
		var pollute_slots: Dictionary = _inv.get("equipment")
		if pollute_slots.has("body"):
			pollute_slots["body"] = {"item_id": "power_cell", "amount": 1}
		polluted = polluted and not (_inv.call("get_items") as Array).is_empty()

	ui.set_config(hero_cfg)
	var confirm_enabled: bool = bool(ui.is_confirm_enabled())
	ui.call("_on_confirm_pressed")
	await _wait_frames(8)

	var gm_data: Dictionary = _gm.get("player_data")
	var cs_data: Dictionary = _cs.get("character_data")
	var gm_effective: Dictionary = gm_data.get("effective_special", {})
	var gm_tags: Array = gm_data.get("tag_skills", [])
	var gm_traits: Array = gm_data.get("traits", [])
	var gm_caps: int = int(gm_data.get("caps", 0))
	var inv_caps: int = int(_inv.call("get_money")) if _inv else -1
	var created_ok: bool = bool(hero_validation.get("ok", false)) and confirm_enabled \
		and str(gm_data.get("name", "")) == "Test Wanderer" \
		and str(cs_data.get("name", "")) == "Test Wanderer" \
		and int(cs_data.get("level", 0)) == 1 \
		and int(cs_data.get("max_hp", 0)) == expected_hp \
		and int(cs_data.get("hp", 0)) == int(cs_data.get("max_hp", -1)) \
		and int(gm_effective.get("might", 0)) == 8 \
		and gm_tags.size() == 3 and gm_traits.has("gifted") \
		and int((cs_data.get("skills", {}) as Dictionary).get("small_guns", -1)) == int(expected_skills.get("small_guns", -2)) \
		and gm_caps == 150 and inv_caps == 150 \
		and int(_gm.get("current_state")) == 1 \
		and str(_gm.get("current_map")) != "test_map"
	_expect("confirm_creates_character", created_ok,
		"valid=%s confirm=%s gm_name=%s cs_name=%s level=%d hp=%d/%d might=%d tags=%d traits=%s caps=%d inv_caps=%d state=%d map=%s" % [
			str(hero_validation.get("ok", false)), str(confirm_enabled),
			str(gm_data.get("name", "")), str(cs_data.get("name", "")),
			int(cs_data.get("level", 0)), int(cs_data.get("hp", 0)), int(cs_data.get("max_hp", 0)),
			int(gm_effective.get("might", 0)), gm_tags.size(), str(gm_traits),
			gm_caps, inv_caps, int(_gm.get("current_state")), str(_gm.get("current_map"))])

	# ---------------------- 12 a new game resets inventory and equipment
	var leftover_items: Array = _inv.call("get_items") if _inv else []
	var leftover_caps: int = int(_inv.call("get_money")) if _inv else -1
	var equipped_left := 0
	if _inv:
		for slot_value in (_inv.get("equipment") as Dictionary).values():
			if slot_value != null:
				equipped_left += 1
	_expect("inventory_reset_on_new_game",
		polluted and leftover_items.is_empty() and leftover_caps == 150 and equipped_left == 0,
		"polluted=%s items=%d caps=%d equipped=%d" % [
			str(polluted), leftover_items.size(), leftover_caps, equipped_left])

	# ----------------------------------------- 10 player in the starting location
	var campaign = current_scene
	var campaign_path := ""
	var world_map_id := ""
	if campaign:
		campaign_path = campaign.scene_file_path
		var world_map = campaign.get_node_or_null("WorldMap")
		if world_map and world_map.has_method("get_current_id"):
			world_map_id = str(world_map.call("get_current_id"))
	_expect("starting_location", campaign_path == CAMPAIGN_SCENE and not world_map_id.is_empty(),
		"scene=%s current_location=%s" % [campaign_path, world_map_id])

	# -------------------------------------------------- 11 save/load round-trip
	var saved_skills: Dictionary = (cs_data.get("skills", {}) as Dictionary).duplicate(true)
	var saved_might: int = int(gm_effective.get("might", 0))
	if _eb:
		_eb.call("emit", "save_requested", [SAVE_SLOT])
	await _wait_frames(2)
	var has_save: bool = bool(_save.call("has_save", SAVE_SLOT)) if _save else false
	var saved_data: Dictionary = _save.call("load_game", SAVE_SLOT) if has_save else {}

	_gm.call("_load_default_state")
	_cs.call("_init_default_character")
	if has_save:
		_gm.call("load_save_data", saved_data)
	await _wait_frames(2)

	var reloaded_gm: Dictionary = _gm.get("player_data")
	var reloaded_cs: Dictionary = _cs.get("character_data")
	var reloaded_effective: Dictionary = reloaded_gm.get("effective_special", {})
	var reloaded_skills: Dictionary = reloaded_cs.get("skills", {})
	var reloaded_traits: Array = reloaded_gm.get("traits", [])
	var reloaded_tags: Array = reloaded_gm.get("tag_skills", [])
	_expect("save_load_restores",
		has_save and int(saved_data.get("version", -1)) == 2
			and str(reloaded_gm.get("name", "")) == "Test Wanderer"
			and int(reloaded_effective.get("might", 0)) == saved_might
			and reloaded_traits.has("gifted") and reloaded_tags.size() == 3
			and int(reloaded_skills.get("small_guns", -1)) == int(saved_skills.get("small_guns", -2)),
		"has_save=%s version=%d name=%s might=%d traits=%s tags=%d small_guns=%d/%d" % [
			str(has_save), int(saved_data.get("version", -1)), str(reloaded_gm.get("name", "")),
			int(reloaded_effective.get("might", 0)), str(reloaded_traits), reloaded_tags.size(),
			int(reloaded_skills.get("small_guns", -1)), int(saved_skills.get("small_guns", -2))])

	# ------------------------------------- 13 all 16 traits + derived stats
	var trait_ids: Array = CharacterCreationRules.TRAIT_DEFS.keys()
	var base_special: Dictionary = {}
	for key in CharacterCreationRules.SPECIAL_KEYS:
		base_special[key] = 5
	var derived_check: Dictionary = CharacterCreationRules.derive_stats(base_special, [], 1, base_special)
	var required_derived := ["max_hp", "hp_per_level", "max_action_points", "armor_class", "sequence", "critical_chance", "carry_weight", "melee_damage", "healing_rate", "skill_points_per_level"]
	var all_derived := true
	for key in required_derived:
		all_derived = all_derived and derived_check.has(key)
	_expect("all_sixteen_traits_and_derived",
		trait_ids.size() == 16 and trait_ids.has("one_handed") and trait_ids.has("jinxed") \
			and trait_ids.has("chem_reliant") and trait_ids.has("chem_resistant") \
			and trait_ids.has("bloody_mess") and trait_ids.has("sex_appeal") \
			and all_derived and int(derived_check.get("armor_class", -1)) == 5,
		"traits=%d derived=%s" % [trait_ids.size(), str(derived_check.keys())])

func _finish() -> void:
	if _save:
		_save.call("delete_save", SAVE_SLOT)
	_restore_menu_debug()
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

# ------------------------------------------------------------------- helpers

func _expect(name: String, condition: bool, detail: String = "") -> void:
	if condition:
		_passed += 1
		print("TEST %s: PASS" % name)
	else:
		_failed += 1
		print("TEST %s: FAIL (%s)" % [name, detail])

func _goto(scene_path: String) -> Node:
	var packed = load(scene_path)
	if packed == null:
		return null
	change_scene_to_packed(packed)
	await _wait_frames(3)
	return current_scene

func _wait_frames(count: int) -> void:
	for i in range(count):
		await process_frame

func _backup_menu_debug() -> void:
	if FileAccess.file_exists(MENU_DEBUG_PATH):
		var file := FileAccess.open(MENU_DEBUG_PATH, FileAccess.READ)
		if file:
			_menu_debug_backup = file.get_as_text()
			_menu_debug_existed = true
			file.close()

func _restore_menu_debug() -> void:
	if _menu_debug_existed:
		var file := FileAccess.open(MENU_DEBUG_PATH, FileAccess.WRITE)
		if file:
			file.store_string(_menu_debug_backup)
			file.close()
	else:
		DirAccess.remove_absolute(ProjectSettings.globalize_path(MENU_DEBUG_PATH))
