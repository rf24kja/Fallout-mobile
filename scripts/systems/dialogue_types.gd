## Dialogue data structures (no class_name - loaded via preload)

class DialogueCondition:
	extends RefCounted
	
	enum ConditionType {
		STAT_CHECK = 0,
		QUEST_FLAG = 1,
		ITEM_POSSESSION = 2,
		QUEST_ACTIVE = 3,
		QUEST_FLAG_NOT = 4
	}
	
	var condition_type: int = 0
	var stat_name: String = ""
	var stat_value: int = 5
	var quest_id: String = ""
	var quest_flag: String = ""
	var quest_flag_value: Variant = true
	var item_id: String = ""
	var item_amount: int = 1
	
	func check(game_manager) -> bool:
		if not game_manager:
			return false
		
		match condition_type:
			ConditionType.STAT_CHECK:
				return game_manager.get_player_stat(stat_name) >= stat_value
			ConditionType.QUEST_FLAG:
				return game_manager.get_quest_flag(quest_id, quest_flag, false) == quest_flag_value
			ConditionType.ITEM_POSSESSION:
				var inv = game_manager.get_node_or_null("/root/Inventory")
				if inv:
					return inv.has_item(item_id, item_amount)
				return false
			ConditionType.QUEST_ACTIVE:
				return game_manager.get_quest_flag(quest_id, quest_flag, false) == quest_flag_value
			ConditionType.QUEST_FLAG_NOT:
				return game_manager.get_quest_flag(quest_id, quest_flag, false) != quest_flag_value
		return true


class DialogueConsequence:
	extends RefCounted
	
	enum ConsequenceType {
		SET_QUEST_FLAG = 1,
		GIVE_ITEM = 2,
		REMOVE_ITEM = 3,
		GIVE_CAPS = 4,
		SET_WORLD_STATE = 5,
		MODIFY_STAT = 6,
		ADD_XP = 7
	}
	
	var consequence_type: int = 0
	var quest_id: String = ""
	var quest_flag: String = ""
	var quest_flag_value: Variant = true
	var item_id: String = ""
	var item_amount: int = 1
	var caps_amount: int = 0
	var world_state_key: String = ""
	var world_state_value: Variant = null
	var stat_name: String = ""
	var stat_delta: int = 0
	var xp_amount: int = 0
	
	func apply(game_manager, inventory) -> void:
		print("DialogueConsequence.apply: type=" + str(consequence_type) + ", game_manager=" + str(game_manager))
		if not game_manager:
			return
		
		match consequence_type:
			ConsequenceType.SET_QUEST_FLAG:
				print("DialogueConsequence.apply: SET_QUEST_FLAG quest_id=" + quest_id + ", flag=" + quest_flag + ", value=" + str(quest_flag_value))
				game_manager.add_quest_flag(quest_id, quest_flag, quest_flag_value)
			ConsequenceType.GIVE_ITEM:
				if inventory:
					var db = inventory._item_database
					if db:
						var def = db.get_item(item_id)
						if def:
							inventory.add_item(def.create_instance(item_amount))
			ConsequenceType.REMOVE_ITEM:
				if inventory:
					inventory.remove_item(item_id, item_amount)
			ConsequenceType.GIVE_CAPS:
				var caps = game_manager.player_data.get("caps", 0)
				game_manager.player_data["caps"] = caps + caps_amount
			ConsequenceType.SET_WORLD_STATE:
				game_manager.set_world_state(world_state_key, world_state_value)
			ConsequenceType.MODIFY_STAT:
				game_manager.modify_player_stat(stat_name, stat_delta)
			ConsequenceType.ADD_XP:
				game_manager.add_xp(xp_amount)


class DialogueOption:
	extends RefCounted
	
	var option_id: String = ""
	var text: String = ""
	var next_node: String = ""
	var conditions: Array = []
	var consequences: Array = []
	
	func apply(game_manager, inventory) -> void:
		for consequence in consequences:
			if consequence and consequence.apply:
				consequence.apply(game_manager, inventory)


class DialogueNode:
	extends RefCounted
	
	var node_id: String = ""
	var speaker_id: String = ""
	var text: String = ""
	var options: Array = []
	var conditions: Array = []
	var on_enter: Array = []
	var on_exit: Array = []