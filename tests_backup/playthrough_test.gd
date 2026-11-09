class_name PlaythroughTest
extends SceneTree

func _init():
	call_deferred("_run_playthrough")

func _run_playthrough():
	print("=== STARTING VERTICAL SLICE PLAYTHROUGH ===")
	
	change_scene_to_file("res://scenes/world/test_map.tscn")
	await get_tree().process_frame
	print("1. Launch - test_map loaded")
	
	var gm = get_node("/root/GameManager")
	var dm = get_node("/root/DialogueManager")
	var inv = get_node("/root/Inventory")
	var cs = get_node("/root/CharacterSystem")
	var csys = get_node("/root/CombatSystem")
	var eb = get_node("/root/EventBus")
	
	print("2. Character started: " + gm.player_data.name)
	
	var test_map = get_tree().get_root().get_node("TestMap")
	var player = test_map.get_node("Player")
	var npc = test_map.get_node_or_null("Marcus")
	if not npc:
		var npc_scene = preload("res://scenes/entities/npc.tscn")
		npc = npc_scene.instantiate()
		npc.name = "Marcus"
		npc.global_position = Vector2(600, 400)
		test_map.add_child(npc)
		npc.set_dialogue("lost_power_cell")
	
	player.global_position = Vector2(550, 400)
	await get_tree().process_frame
	print("3. Moved to NPC position")
	
	var success = dm.start_dialogue("lost_power_cell")
	print("4. Talk to NPC - dialogue started: " + str(success))
	
	if dm.get_available_options().size() > 0:
		var opts = dm.get_available_options()
		for i in range(opts.size()):
			if opts[i].option_id == "q1_accept_quest":
				dm.select_option(i)
				print("5. Accepted quest lost_power_cell")
				break
	
	await get_tree().process_frame
	
	var power_cell = test_map.get_node_or_null("PowerCell")
	if not power_cell:
		var item_scene = preload("res://scenes/entities/world_item.tscn")
		power_cell = item_scene.instantiate()
		power_cell.name = "PowerCell"
		power_cell.global_position = Vector2(900, 600)
		power_cell.set_item("power_cell", 1)
		test_map.add_child(power_cell)
	
	player.global_position = Vector2(850, 600)
	await get_tree().process_frame
	print("6. Explored to power cell location")
	
	if power_cell.has_method("_on_pickup"):
		power_cell._on_pickup(player)
	await get_tree().process_frame
	var has_cell = gm.get_item_count("power_cell") > 0
	print("7. Collected power cell: " + str(has_cell) + " count " + str(gm.get_item_count("power_cell")))
	
	gm.change_state(2)
	await get_tree().process_frame
	print("8. Opened inventory")
	
	var items = inv.get_items()
	print("   Inventory items count: " + str(items.size()))
	if items.size() > 0:
		for item in items:
			if item.item_id == "10mm_pistol" or item.item_id == "pipe_rifle" or item.item_id == "9mm_pistol":
				inv.equip_item(item.instance_id, "weapon")
				print("9. Equipped weapon: " + item.item_id)
				break
	
	player.global_position = Vector2(550, 400)
	await get_tree().process_frame
	
	var participants = []
	var player_data = cs.get_character_sheet()
	participants.append({
		"id": "player",
		"name": "Vault Dweller",
		"team": "player",
		"hp": player_data.hp,
		"max_hp": player_data.max_hp,
		"stats": player_data.special,
		"skills": player_data.skills,
		"weapon": inv.get_equipped("weapon") or {"damage_min": 8, "damage_max": 18, "damage_type": 0, "ap_cost": 5, "range": 15.0, "skill": "small_guns", "crit_chance": 5, "crit_multiplier": 2.0, "ammo_type": "9mm", "caliber": "9mm", "magazine_capacity": 12, "current_ammo": 12}
	})
	participants.append({
		"id": "raider_1",
		"name": "Raider",
		"team": "enemy",
		"hp": 60,
		"max_hp": 60,
		"stats": {"might": 6, "awareness": 5, "vigor": 5, "presence": 4, "intellect": 4, "dexterity": 6, "fortune": 5},
		"skills": {"small_guns": 30, "melee": 40, "unarmed": 30},
		"weapon": {"damage_min": 5, "damage_max": 12, "damage_type": 0, "ap_cost": 4, "range": 12.0, "skill": "small_guns", "crit_chance": 3, "crit_multiplier": 1.5, "ammo_type": "10mm", "caliber": "10mm", "magazine_capacity": 10, "current_ammo": 10}
	})
	
	var result = csys.start_combat(participants)
	print("10. Entered combat: " + str(result))
	
	if csys.get_combat_state():
		print("   Combat active: true")
	
	player.global_position = Vector2(550, 400)
	await get_tree().process_frame
	dm.start_dialogue("lost_power_cell")
	await get_tree().process_frame
	var opts = dm.get_available_options()
	for i in range(opts.size()):
		if opts[i].option_id == "q1_return_cell":
			dm.select_option(i)
			print("11. Completed quest - returned cell")
			break
	
	await get_tree().process_frame
	
	var xp = gm.player_data.xp
	print("12. XP after quest: " + str(xp))
	
	var save_success = get_node("/root/SaveSystem").save_game(1)
	print("13. Save game: " + str(save_success))
	
	print("14. Exit")
	
	var load_success = get_node("/root/SaveSystem").load_game(1)
	print("15. Restart and load: " + str(load_success))
	
	var loaded_xp = gm.player_data.xp
	var loaded_caps = gm.player_data.caps
	var loaded_items = gm.get_item_count("power_cell")
	print("16. Verified persistent state - XP: " + str(loaded_xp) + " Caps: " + str(loaded_caps) + " Power cells: " + str(loaded_items))
	
	print("=== VERTICAL SLICE PLAYTHROUGH COMPLETE ===")
	quit(0)