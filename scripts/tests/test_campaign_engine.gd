extends SceneTree

## Headless integration test for the CAMPAIGN ENGINE layer.
## preload() constants avoid depending on a rebuilt global class cache in
## headless --script mode.
## Uses ONLY synthetic fixtures (fake "TEST ..." names) written to
## user://fallout2_data/ at test time, then deletes them in the cleanup phase.
## No licensed original text is ever written to a tracked file.

const DATA_DIR := "user://fallout2_data/"
const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")
const WorldMap = preload("res://scripts/campaign/world_map.gd")
const LocationScene = preload("res://scripts/campaign/location_scene.gd")
const CampaignQuests = preload("res://scripts/campaign/campaign_quests.gd")
const CampaignDialogues = preload("res://scripts/campaign/campaign_dialogues.gd")

var _failures := 0
var _checks := 0
var _events := 0
var _quest_save_existed := false
var _quest_save_backup := ""

func _init() -> void:
	call_deferred("_run")

func _log(msg: String) -> void:
	print(msg)

func _check(name: String, cond: bool) -> void:
	_checks += 1
	if cond:
		_log("  PASS: " + name)
	else:
		_failures += 1
		_log("  FAIL: " + name)

func _write_json(filename: String, value: Variant) -> void:
	var f := FileAccess.open(DATA_DIR + filename, FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(value))
		f.close()

func _fixture_items() -> Array:
	var out: Array = []
	for i in range(5):
		out.append({"id": "test_item_%d" % (i + 1), "name": "TEST ITEM %d" % (i + 1), "type": "misc"})
	return out

func _fixture_critters() -> Array:
	return [
		{"id": "test_critter_1", "name": "TEST CRITTER 1"},
		{"id": "test_critter_2", "name": "TEST CRITTER 2"},
	]

func _fixture_quests() -> Array:
	return [
		{
			"id": "test_quest_geck", "title": "TEST QUEST GECK",
			"description": "TEST DESCRIPTION A",
			"stages": [
				{"id": "obj_reach_test", "type": "REACH", "target": "TEST_LOCATION_B", "text": "TEST STAGE 1"},
				{"id": "obj_kill_test", "type": "KILL", "target": "TEST_CRITTER_1", "text": "TEST STAGE 2", "count": 2},
			],
			"choices": [{"id": "test_choice_1", "text": "TEST CHOICE", "next_objective": ""}],
			"rewards": {"xp": 100, "money": 50},
		},
		{
			"id": "test_quest_debt", "title": "TEST QUEST DEBT",
			"description": "TEST DESCRIPTION B",
			"stages": [{"id": "obj_talk_test", "type": "TALK", "target": "TEST_NPC_1", "text": "TEST TALK STAGE"}],
			"rewards": {"xp": 40},
		},
		{
			"id": "test_quest_rescue", "title": "TEST QUEST RESCUE",
			"description": "TEST DESCRIPTION C",
			"stages": [{"id": "obj_collect_test", "type": "COLLECT", "target": "test_item_1", "text": "TEST COLLECT STAGE", "count": 1}],
			"rewards": {"xp": 60},
		},
	]

func _fixture_locations() -> Array:
	return [
		{
			"id": "TEST_LOCATION_A", "name": "TEST LOCATION A", "region": "TEST REGION",
			"map": "test_map_a", "exits": ["TEST_LOCATION_B"], "npcs": ["TEST_NPC_1"],
			"items": ["test_item_1"], "enemies": [], "travel_hours": 1,
		},
		{
			"id": "TEST_LOCATION_B", "name": "TEST LOCATION B", "region": "TEST REGION",
			"map_file": "test_map_b", "exits": ["TEST_LOCATION_A", "TEST_LOCATION_C"],
			"npcs": [], "items": [], "enemies": ["TEST_CRITTER_1"],
			"requires": ["test_gate_open"], "travel_hours": 2,
		},
		{
			"id": "TEST_LOCATION_C", "name": "TEST LOCATION C", "region": "TEST REGION",
			"map": "test_map_c", "exits": [], "npcs": [], "items": [], "enemies": [],
			"travel_hours": 3,
		},
	]

func _fixture_maps() -> Array:
	return [
		{"id": "TEST_LOCATION_A", "width": 640, "height": 480, "exits": ["TEST_LOCATION_B"]},
	]

func _fixture_dialogues() -> Array:
	return [
		{
			"id": "test_dialogue_1",
			"lines": [
				{
					"id": "test_node_1", "speaker": "TEST_NPC_1",
					"text": "TEST DIALOGUE LINE 1",
					"options": [
						{"id": "test_opt_1", "text": "TEST OPTION", "next": "test_node_2",
						 "consequences": [{"type": "GIVE_CAPS", "caps_amount": 10}]},
					],
				},
				{
					"id": "test_node_2", "speaker": "TEST_NPC_1",
					"text": "TEST DIALOGUE LINE 2",
					"options": [],
					"conditions": [{"type": "STAT_CHECK", "stat_name": "intellect", "stat_value": 1}],
				},
			],
		},
		{
			"id": "test_dialogue_2",
			"lines": [{"id": "test_node_3", "speaker": "TEST_NPC_2", "text": "TEST SECOND DIALOGUE"}],
		},
	]

func _write_fixtures() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(DATA_DIR))
	_write_json("items.json", {"records": _fixture_items()})
	_write_json("critters.json", _fixture_critters())
	_write_json("quests.json", {"data": _fixture_quests()})
	_write_json("locations.json", _fixture_locations())
	_write_json("maps_index.json", {"records": _fixture_maps()})
	_write_json("dialog_index.json", _fixture_dialogues())
	_write_json("manifest.json", {"source": "SYNTHETIC_TEST_ONLY", "version": "test"})

func _cleanup_fixtures() -> void:
	for name in ["items.json", "critters.json", "quests.json", "locations.json",
			"maps_index.json", "dialog_index.json", "manifest.json"]:
		var path: String = DATA_DIR + name
		if FileAccess.file_exists(path):
			DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	# Removing the directory itself is best-effort — other agents may be using it.

func _on_location_reached(_id: String) -> void:
	_events += 1

func _run() -> void:
	_log("=== Campaign Engine Integration Test (synthetic fixtures) ===")
	# QuestManager autoload has already run _ready() before this deferred test,
	# so any error it emitted at boot is unrelated to the campaign layer.
	# Neutralize user://quest_save.json so this test's quest mutations cannot
	# leave a save that breaks the NEXT boot (QuestManager parses it as a
	# JSONParseResult, which is broken for raw dictionaries in Godot 4).
	var qsave := "user://quest_save.json"
	_quest_save_existed = FileAccess.file_exists(qsave)
	if _quest_save_existed:
		_quest_save_backup = FileAccess.get_file_as_string(qsave)
	var f := FileAccess.open(qsave, FileAccess.WRITE)
	if f:
		f.store_string("{}")
		f.close()

	_write_fixtures()

	# 1. Loader -----------------------------------------------------------------
	var loader := CampaignLoader.new()
	var loaded := loader.load_all(DATA_DIR, true)
	_check("loader available", bool(loaded.get("available", false)))
	var summary := loader.get_summary()
	_check("summary items == 5", int(summary.get("items", 0)) == 5)
	_check("summary critters == 2", int(summary.get("critters", 0)) == 2)
	_check("summary quests == 3", int(summary.get("quests", 0)) == 3)
	_check("summary locations == 3", int(summary.get("locations", 0)) == 3)
	_check("summary maps == 1", int(summary.get("maps", 0)) == 1)
	_check("summary dialogues == 2", int(summary.get("dialogues", 0)) == 2)
	_check("has_original_data true", loader.has_original_data())
	_check("manifest source synthetic", str(loaded.get("manifest", {}).get("source", "")) == "SYNTHETIC_TEST_ONLY")

	# normalize_record helper — array shape + field aliases + no crash.
	var norm := CampaignLoader.normalize_record({"pid": "x", "title": "T"}, {"id": ["id", "pid"], "name": ["name", "title"], "exits": ["exits"]})
	_check("normalize_record id alias", str(norm.get("id", "")) == "x")
	_check("normalize_record name alias", str(norm.get("name", "")) == "T")
	_check("normalize_record missing alias default", norm.has("exits") and (norm["exits"] is Array))

	# 2. WorldMap ---------------------------------------------------------------
	var gm := root.get_node_or_null("/root/GameManager")
	var eb := root.get_node_or_null("/root/EventBus")
	var wm := WorldMap.new()
	root.add_child(wm)
	wm.build_from_data(loaded.get("locations", []), loaded.get("maps", []))

	_check("world map 3 locations", wm.get_all_locations().size() == 3)
	_check("get_location A", not wm.get_location("TEST_LOCATION_A").is_empty())
	# Gate on destination B blocks A->B until "test_gate_open" is set.
	_check("gated A->B blocked by default", not wm.can_travel("TEST_LOCATION_A", "TEST_LOCATION_B"))
	_check("can_travel B->A true (bidirectional)", wm.can_travel("TEST_LOCATION_B", "TEST_LOCATION_A"))
	_check("can_travel A->C false (no edge)", not wm.can_travel("TEST_LOCATION_A", "TEST_LOCATION_C"))
	_check("can_travel unknown false", not wm.can_travel("TEST_LOCATION_A", "NO_SUCH"))
	if gm != null:
		gm.set_world_state("test_gate_open", true)
	_check("gated B open after flag", wm.can_travel("TEST_LOCATION_A", "TEST_LOCATION_B"))

	if eb != null and eb.has_method("connect") and not eb.has_signal("location_reached"):
		eb.add_user_signal("location_reached")
	if eb != null and eb.has_signal("location_reached"):
		eb.connect("location_reached", Callable(self, "_on_location_reached"))

	var time_before: float = float(gm.get("game_time")) if gm != null else 0.0
	_check("travel_to B succeeded", wm.travel_to("TEST_LOCATION_B"))
	_check("travel_to invalid failed", not wm.travel_to("NO_SUCH"))
	if gm != null:
		_check("current_map set", str(gm.get("current_map")) == "test_map_b")
		_check("game_time advanced", float(gm.get("game_time")) > time_before)
		_check("world state location flag", bool(gm.get_world_state("location_TEST_LOCATION_B", false)))
	_check("location_reached event emitted", _events >= 1)
	_check("visited persisted", bool(wm.get_location("TEST_LOCATION_B").get("visited", false)))

	var saved := wm.get_save_data()
	_check("save data has visited", (saved.get("visited", []) as Array).has("TEST_LOCATION_B"))
	# Reset then restore roundtrip.
	var wm2 := WorldMap.new()
	root.add_child(wm2)
	wm2.build_from_data(loaded.get("locations", []), [])
	wm2.load_save_data(saved)
	_check("roundtrip current restored", wm2.get_current_id() == "TEST_LOCATION_B")
	_check("roundtrip visited restored", bool(wm2.get_location("TEST_LOCATION_B").get("visited", false)))

	# 3. CampaignQuests ---------------------------------------------------------
	var qm := root.get_node_or_null("/root/QuestManager")
	_check("QuestManager autoload present", qm != null)
	var cq := CampaignQuests.new()
	var qcount := cq.register_original_quests(loaded.get("quests", []), qm)
	_check("registered >=1 quests", qcount >= 1)
	_check("registered ids tracked", cq.get_registered_ids().has("test_quest_geck"))
	var qlist: Array = qm.get_quest_list() if qm != null else []
	_check("quest appears in get_quest_list", _array_has_id(qlist, "test_quest_geck"))
	_check("empty quests registers zero", CampaignQuests.new().register_original_quests([], qm) == 0)
	if qm != null:
		_check("start_quest works", qm.start_quest("test_quest_geck"))
		_check("quest active after start", qm.is_quest_active("test_quest_geck"))
		var objectives: Array = qm.get_active_objectives("test_quest_geck")
		_check("objectives exist", objectives.size() >= 1)
		# The REACH objective has count=1, so one update completes and grants
		# rewards. Verify via the quest-state/progress signal rather than the
		# active list (completed objectives drop out of get_active_objectives).
		var progress_seen := [0]
		qm.quest_updated.connect(func(_qid, _oid, p): progress_seen[0] = p)
		qm.update_objective("test_quest_geck", "obj_reach_test", 1)
		_check("update_objective changed progress", int(progress_seen[0]) >= 1)

	# 4. CampaignDialogues ------------------------------------------------------
	var dm := root.get_node_or_null("/root/DialogueManager")
	_check("DialogueManager autoload present", dm != null)
	var cd := CampaignDialogues.new()
	var dcount := cd.register_original_dialogues(loaded.get("dialogues", []), dm)
	_check("registered >=1 dialogues", dcount >= 1)
	_check("dialogue ids tracked", cd.get_registered_ids().has("test_dialogue_1"))
	_check("empty dialogues registers zero", CampaignDialogues.new().register_original_dialogues([], dm) == 0)
	if dm != null:
		_check("start_dialogue works", dm.start_dialogue("test_dialogue_1"))
		_check("get_dialogue_text non-empty", not str(dm.get_dialogue_text()).is_empty())
		_check("available options non-empty", dm.get_available_options().size() >= 1)
		dm.end_dialogue()

	# 5. LocationScene (headless) -----------------------------------------------
	var ls := LocationScene.new()
	root.add_child(ls)
	ls.configure(wm.get_location("TEST_LOCATION_A"), loaded.get("maps", [])[0])
	_check("location scene has children", ls.get_child_count() > 0)
	_check("ground exists", ls.get_node_or_null("Ground") != null)
	_check("spawn exists", ls.get_node_or_null("PlayerSpawn") != null)
	_check("exit markers exist", ls.get_exit_ids().size() >= 1)
	# Graceful default with empty map data.
	var empty_ls := LocationScene.new()
	root.add_child(empty_ls)
	empty_ls.configure({}, {})
	_check("empty configure still non-empty", empty_ls.get_child_count() > 0)
	_check("empty configure has fallback exit", empty_ls.get_exit_ids().size() >= 1)

	# 6. Adapter robustness -----------------------------------------------------
	# Temporarily remove fixtures so load_all() has nothing to read from any
	# source (the explicit path also does not exist).
	_cleanup_fixtures()
	var missing := CampaignLoader.new().load_all("user://definitely_missing_path_xyz/", true)
	_check("missing path available=false", not bool(missing.get("available", false)))
	_check("missing path arrays empty", (missing.get("items", []) as Array).is_empty())

	# Cleanup synthetic fixtures and restore any pre-existing quest save.
	_cleanup_fixtures()
	var qsave_path := "user://quest_save.json"
	if _quest_save_existed:
		var qf := FileAccess.open(qsave_path, FileAccess.WRITE)
		if qf:
			qf.store_string(_quest_save_backup)
			qf.close()
	else:
		# Remove the "{}" placeholder we wrote at the start so the next boot
		# does not hit the pre-existing quest_save.json parse issue.
		if FileAccess.file_exists(qsave_path):
			DirAccess.remove_absolute(ProjectSettings.globalize_path(qsave_path))

	_log("CHECKS=%d FAILURES=%d" % [_checks, _failures])
	if _failures == 0:
		_log("CAMPAIGN_CHECK=PASS FAILURES=0")
		_log("RESULT: ALL PASS")
	else:
		_log("CAMPAIGN_CHECK=FAIL FAILURES=%d" % _failures)
		_log("RESULT: FAIL")
	quit(0 if _failures == 0 else 1)


func _array_has_id(arr: Array, id: String) -> bool:
	for q in arr:
		if q is Dictionary and str((q as Dictionary).get("id", "")) == id:
			return true
	return false
