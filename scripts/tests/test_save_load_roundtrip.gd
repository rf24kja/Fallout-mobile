extends SceneTree

## Headless integration test: verifies real save/load round-trip through the
## autoloaded SaveSystem and GameManager. Exercises the actual game code, not
## a mock. Catches broken serialization that unit tests on single systems miss.

var _failures = 0
var _checks = 0

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

func _run() -> void:
	_log("=== Save/Load Round-Trip Integration Test ===")

	var gm = root.get_node_or_null("/root/GameManager")
	var save = root.get_node_or_null("/root/SaveSystem")
	var inv = root.get_node_or_null("/root/Inventory")
	var char = root.get_node_or_null("/root/CharacterSystem")
	_check("GameManager autoload present", gm != null)
	_check("SaveSystem autoload present", save != null)
	_check("Inventory autoload present", inv != null)
	_check("CharacterSystem autoload present", char != null)

	if gm == null or save == null:
		_log("RESULT: FAIL (autoloads missing)")
		quit(1)
		return

	# Snapshot current live state
	var original: Dictionary = gm.get_save_data()
	_check("get_save_data returns version 2", int(original.get("version", 0)) == 2)
	_check("save data has player", original.has("player"))
	_check("save data has inventory", original.has("inventory"))
	_check("save data has quests", original.has("quests"))

	# Mutate a distinctive field so we can prove load restores it
	var mutated = original.duplicate(true)
	mutated["time"] = 12345.678
	mutated["map"] = "roundtrip_test_map"
	var test_player = mutated.get("player", {})
	if test_player is Dictionary:
		test_player["name"] = "RoundTripTestHero"
		mutated["player"] = test_player

	# Save to slot 9 (isolated from real saves), then load it back
	var ok: bool = save.save_game(9, mutated)
	_check("save_game(slot 9) succeeded", ok)
	_check("has_save(slot 9)", save.has_save(9))

	var loaded = save.load_game(9)
	_check("load_game(slot 9) returned dictionary", loaded is Dictionary)
	if loaded is Dictionary:
		_check("loaded time restored", abs(float(loaded.get("time", 0.0)) - 12345.678) < 0.01)
		_check("loaded map restored", str(loaded.get("map", "")) == "roundtrip_test_map")
		var lp = loaded.get("player", {})
		_check("loaded player name restored", (lp is Dictionary and str(lp.get("name", "")) == "RoundTripTestHero"))

	# Exercise GameManager load path (migration + distribution to systems)
	gm.load_save_data(loaded)
	_check("GameManager current_map after load", str(gm.get("current_map")) == "roundtrip_test_map")
	_check("GameManager game_time after load", abs(float(gm.get("game_time")) - 12345.678) < 0.01)

	# v1 -> v2 migration path for legacy SPECIAL names
	var legacy = {
		"version": 1,
		"player": {"special": {"strength": 7, "endurance": 6, "luck": 5}, "name": "LegacyHero"},
		"inventory": [], "world": {}, "quests": {}, "time": 10.0, "map": "test_map"
	}
	var migrated: Dictionary = gm._migrate_save_data(legacy)
	_check("v1 migrated to version 2", int(migrated.get("version", 0)) == 2)
	var mspecial: Dictionary = migrated.get("player", {}).get("special", {})
	_check("strength -> might", mspecial.get("might") == 7 and not mspecial.has("strength"))
	_check("endurance -> vigor", mspecial.get("vigor") == 6 and not mspecial.has("endurance"))
	_check("luck -> fortune", mspecial.get("fortune") == 5 and not mspecial.has("luck"))

	# Cleanup the test save so it does not pollute real slots
	save.delete_save(9)
	_check("delete_save(slot 9) succeeded", not save.has_save(9))

	_log("CHECKS=%d FAILURES=%d" % [_checks, _failures])
	if _failures == 0:
		_log("RESULT: ALL PASS - save/load round-trip verified")
	else:
		_log("RESULT: FAIL")
	quit(0 if _failures == 0 else 1)
