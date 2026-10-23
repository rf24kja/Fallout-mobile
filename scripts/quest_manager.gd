extends Node
class_name QuestManager

## Quest System for Fallout 2 Reborn Mobile
## Supports branching quests with 3+ paths, objectives, rewards, and state persistence.

signal quest_started(quest_id: String)
signal quest_updated(quest_id: String, objective_id: String, progress: int)
signal quest_completed(quest_id: String, outcome: String)
signal quest_failed(quest_id: String, reason: String)
signal objective_completed(quest_id: String, objective_id: String)

## Quest States
enum QuestState {
    HIDDEN,      # Not yet discovered
    ACTIVE,      # In progress
    COMPLETED,   # Successfully finished
    FAILED,      # Failed/cancelled
}

## Objective Types
enum ObjectiveType {
    KILL,           # Kill X enemies
    COLLECT,        # Collect X items
    TALK,           # Talk to NPC
    REACH,          # Reach location
    CRAFT,          # Craft item
    DELIVER,        # Deliver item to NPC
    INVESTIGATE,    # Examine object/location
    CHOICE,         # Make a branching choice
}

@export var debug_mode: bool = false

var _quests: Dictionary = {}        # All quest definitions
var _player_quests: Dictionary = {} # Player's quest states
var _active_quest_id: String = ""

func _ready() -> void:
    _load_quest_definitions()
    _load_player_quests()

func _load_quest_definitions() -> void:
    """Define all quests in the game."""
    _quests = {
        "qst_find_vault": {
            "id": "qst_find_vault",
            "title": "В поисках Убежища",
            "description": "Найти вход в Убежище 13 и узнать судьбу его жителей.",
            "state": QuestState.HIDDEN,
            "recommended_level": 1,
            "objectives": [
                {
                    "id": "obj_find_entrance",
                    "type": ObjectiveType.REACH,
                    "description": "Найти вход в Убежище 13",
                    "target": "vault13_entrance",
                    "count": 1,
                    "progress": 0,
                    "hidden": false,
                },
                {
                    "id": "obj_enter_vault",
                    "type": ObjectiveType.REACH,
                    "description": "Войти в Убежище 13",
                    "target": "vault13_interior",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_talk_overseer",
                    "type": ObjectiveType.TALK,
                    "description": "Поговорить с Начальником Убежища",
                    "target": "npc_overseer",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # BRANCHING CHOICE - 3 paths
                {
                    "id": "obj_choose_path",
                    "type": ObjectiveType.CHOICE,
                    "description": "Выбрать способ решения проблемы с водой",
                    "target": "",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                    "choices": [
                        {
                            "id": "choice_repair_purifier",
                            "text": "Починить очиститель воды (Наука 50%)",
                            "requirements": {"skill_science": 50},
                            "next_objective": "obj_repair_purifier",
                            "reputation_change": {"vault13": 10, "brotherhood": 5},
                        },
                        {
                            "id": "choice_trade_water",
                            "text": "Организовать поставки воды из Некроpolis (Караван 100 колпачков)",
                            "requirements": {"items": {"bottle_water": 20}, "money": 100},
                            "next_objective": "obj_trade_water",
                            "reputation_change": {"vault13": 5, "hub": 10},
                        },
                        {
                            "id": "choice_raid_necropolis",
                            "text": "Напасть на Некрополис и захватить их воду (Бой)",
                            "requirements": {"combat": true},
                            "next_objective": "obj_raid_necropolis",
                            "reputation_change": {"vault13": -10, "necropolis": -50, "raiders": 15},
                        },
                    ],
                },
                # PATH 1: Repair purifier
                {
                    "id": "obj_repair_purifier",
                    "type": ObjectiveType.CRAFT,
                    "description": "Починить чип очистителя воды",
                    "target": "water_chip",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_install_chip",
                    "type": ObjectiveType.DELIVER,
                    "description": "Установить чип в очиститель",
                    "target": "water_purifier",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 2: Trade water
                {
                    "id": "obj_trade_water",
                    "type": ObjectiveType.DELIVER,
                    "description": "Доставить воду в Убежище 13",
                    "target": "vault13_storage",
                    "count": 20,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_secure_route",
                    "type": ObjectiveType.KILL,
                    "description": "Очистить маршрут до Некрополиса",
                    "target": "mutant_patrol",
                    "count": 5,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 3: Raid necropolis
                {
                    "id": "obj_raid_necropolis",
                    "type": ObjectiveType.KILL,
                    "description": "Уничтожить мутантов в Некрополисе",
                    "target": "super_mutant",
                    "count": 10,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_loot_water",
                    "type": ObjectiveType.COLLECT,
                    "description": "Забрать запасы воды",
                    "target": "water_reserves",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # CONVERGING FINAL OBJECTIVE
                {
                    "id": "obj_report_back",
                    "type": ObjectiveType.TALK,
                    "description": "Докладить Начальнику",
                    "target": "npc_overseer",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
            ],
            "rewards": {
                "xp": 1500,
                "items": {"stimpak": 3, "rad_away": 2},
                "money": 500,
                "reputation": {"vault13": 20},
                "perk": "rad_resistance",
            },
            "failure_conditions": [
                {"type": "npc_dead", "target": "npc_overseer"},
                {"type": "location_destroyed", "target": "vault13"},
            ],
        },
        "qst_merchant_woes": {
            "id": "qst_merchant_woes",
            "title": "Проблемы торговца",
            "description": "Помочь торговцу Карлова избавиться от бандитов, грабящих его караваны.",
            "state": QuestState.HIDDEN,
            "recommended_level": 3,
            "objectives": [
                {
                    "id": "obj_talk_carl",
                    "type": ObjectiveType.TALK,
                    "description": "Поговорить с Карлом в Хабе",
                    "target": "npc_carl",
                    "count": 1,
                    "progress": 0,
                    "hidden": false,
                },
                {
                    "id": "obj_investigate_camp",
                    "type": ObjectiveType.INVESTIGATE,
                    "description": "Найти лагерь бандитов",
                    "target": "raider_camp",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # BRANCHING CHOICE - 3 paths
                {
                    "id": "obj_deal_with_raiders",
                    "type": ObjectiveType.CHOICE,
                    "description": "Решить проблему с бандитами",
                    "target": "",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                    "choices": [
                        {
                            "id": "choice_eliminate",
                            "text": "Уничтожить всех бандитов",
                            "requirements": {"combat": true},
                            "next_objective": "obj_kill_raiders",
                            "reputation_change": {"hub": 15, "raiders": -30},
                        },
                        {
                            "id": "choice_negotiate",
                            "text": "Переговорить с лидером (Харизма 60%)",
                            "requirements": {"skill_speech": 60},
                            "next_objective": "obj_negotiate_leader",
                            "reputation_change": {"hub": 10, "raiders": 10},
                        },
                        {
                            "id": "choice_pay_off",
                            "text": "Заплатить откуп 500 колпачков",
                            "requirements": {"money": 500},
                            "next_objective": "obj_pay_off",
                            "reputation_change": {"hub": 5, "raiders": 5},
                        },
                    ],
                },
                # PATH 1: Eliminate
                {
                    "id": "obj_kill_raiders",
                    "type": ObjectiveType.KILL,
                    "description": "Убить всех бандитов в лагере",
                    "target": "raider",
                    "count": 8,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_kill_leader",
                    "type": ObjectiveType.KILL,
                    "description": "Убить лидера бандитов",
                    "target": "raider_leader",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 2: Negotiate
                {
                    "id": "obj_negotiate_leader",
                    "type": ObjectiveType.TALK,
                    "description": "Переговорить с лидером бандитов",
                    "target": "raider_leader",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_escort_caravan",
                    "type": ObjectiveType.REACH,
                    "description": "Сопроводить караван в Хаб",
                    "target": "hub_gates",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 3: Pay off
                {
                    "id": "obj_pay_off",
                    "type": ObjectiveType.DELIVER,
                    "description": "Передать 500 колпачков бандитам",
                    "target": "raider_leader",
                    "count": 500,
                    "progress": 0,
                    "hidden": true,
                },
                # CONVERGING
                {
                    "id": "obj_report_carl",
                    "type": ObjectiveType.TALK,
                    "description": "Докладить Карлу",
                    "target": "npc_carl",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
            ],
            "rewards": {
                "xp": 800,
                "items": {"leather_armor": 1},
                "money": 300,
                "reputation": {"hub": 15},
                "discount": {"npc_carl": 0.15},  # 15% discount
            },
            "failure_conditions": [
                {"type": "npc_dead", "target": "npc_carl"},
            ],
        },
        "qst_lost_caravan": {
            "id": "qst_lost_caravan",
            "title": "Пропавшая караван",
            "description": "Разыскать пропавший караван Фар Го и выяснить, что случилось.",
            "state": QuestState.HIDDEN,
            "recommended_level": 5,
            "objectives": [
                {
                    "id": "obj_talk_far_go",
                    "type": ObjectiveType.TALK,
                    "description": "Поговорить с Фар Го в Хабе",
                    "target": "npc_far_go",
                    "count": 1,
                    "progress": 0,
                    "hidden": false,
                },
                {
                    "id": "obj_find_trail",
                    "type": ObjectiveType.INVESTIGATE,
                    "description": "Найти следы каравана в пустоши",
                    "target": "caravan_trail",
                    "count": 3,
                    "progress": 0,
                    "hidden": true,
                },
                # BRANCHING CHOICE - 3 paths
                {
                    "id": "obj_caravan_fate",
                    "type": ObjectiveType.CHOICE,
                    "description": "Выбрать действие после обнаружения каравана",
                    "target": "",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                    "choices": [
                        {
                            "id": "choice_rescue_survivors",
                            "text": "Спасти выживших (Бой с мутантами)",
                            "requirements": {"combat": true},
                            "next_objective": "obj_rescue_survivors",
                            "reputation_change": {"hub": 20, "far_go": 25},
                        },
                        {
                            "id": "choice_salvage_goods",
                            "text": "Забрать товары и уйти (Скрытность 70%)",
                            "requirements": {"skill_sneak": 70},
                            "next_objective": "obj_salvage_goods",
                            "reputation_change": {"hub": 5, "far_go": -10, "thieves": 10},
                        },
                        {
                            "id": "choice_investigate_cause",
                            "text": "Расследовать причину атаки (Наука/Врачевание 50%)",
                            "requirements": {"skill_science": 50},
                            "next_objective": "obj_investigate_cause",
                            "reputation_change": {"hub": 10, "followers": 15, "brotherhood": 10},
                        },
                    ],
                },
                # PATH 1: Rescue
                {
                    "id": "obj_rescue_survivors",
                    "type": ObjectiveType.KILL,
                    "description": "Убить мутантов, нападающих на выживших",
                    "target": "super_mutant",
                    "count": 6,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_heal_survivors",
                    "type": ObjectiveType.CRAFT,
                    "description": "Вылечить раненых (Врачевание 40%)",
                    "target": "healing_kit",
                    "count": 3,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 2: Salvage
                {
                    "id": "obj_salvage_goods",
                    "type": ObjectiveType.COLLECT,
                    "description": "Собрать ценные товары с каравана",
                    "target": "trade_goods",
                    "count": 10,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_escape_undetected",
                    "type": ObjectiveType.REACH,
                    "description": "Уйти незамеченным",
                    "target": "safe_zone",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # PATH 3: Investigate
                {
                    "id": "obj_investigate_cause",
                    "type": ObjectiveType.INVESTIGATE,
                    "description": "Исследовать следы атаки",
                    "target": "mutant_tracks",
                    "count": 5,
                    "progress": 0,
                    "hidden": true,
                },
                {
                    "id": "obj_find_mutant_base",
                    "type": ObjectiveType.REACH,
                    "description": "Найти базу мутантов",
                    "target": "mutant_base_entrance",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
                # CONVERGING
                {
                    "id": "obj_report_far_go",
                    "type": ObjectiveType.TALK,
                    "description": "Докладить Фар Го",
                    "target": "npc_far_go",
                    "count": 1,
                    "progress": 0,
                    "hidden": true,
                },
            ],
            "rewards": {
                "xp": 1200,
                "items": {"combat_armor": 1, "stimpak": 5},
                "money": 800,
                "reputation": {"hub": 15, "far_go": 20},
            },
            "failure_conditions": [
                {"type": "npc_dead", "target": "npc_far_go"},
                {"type": "time_limit", "days": 30},
            ],
        },
    }

func _load_player_quests() -> void:
    """Load player quest progress from save file."""
    var save_path = "user://quest_save.json"
    if FileAccess.file_exists(save_path):
        var file = FileAccess.open(save_path, FileAccess.READ)
        if file:
            var data = JSON.parse_string(file.get_as_text())
            if data.error == OK:
                _player_quests = data.result
                _restore_quest_states()
            file.close()

func _restore_quest_states() -> void:
    """Restore quest states from loaded data."""
    for quest_id in _player_quests:
        if quest_id in _quests:
            var saved = _player_quests[quest_id]
            var quest = _quests[quest_id]
            quest["state"] = saved.get("state", QuestState.HIDDEN)
            for obj in quest["objectives"]:
                var saved_obj = saved["objectives"].get(obj["id"], {})
                obj["progress"] = saved_obj.get("progress", 0)
                obj["completed"] = saved_obj.get("completed", false)

func _save_player_quests() -> void:
    """Save player quest progress to file."""
    var save_data = {}
    for quest_id in _player_quests:
        save_data[quest_id] = _player_quests[quest_id]
    
    var file = FileAccess.open("user://quest_save.json", FileAccess.WRITE)
    if file:
        file.store_string(JSON.stringify(save_data))
        file.close()

func start_quest(quest_id: String) -> bool:
    """Start a quest for the player."""
    if not _quests.has(quest_id):
        if debug_mode: print("QuestManager: Quest not found: ", quest_id)
        return false
    
    var quest = _quests[quest_id]
    if quest["state"] != QuestState.HIDDEN:
        if debug_mode: print("QuestManager: Quest already started: ", quest_id)
        return false
    
    quest["state"] = QuestState.ACTIVE
    _player_quests[quest_id] = {
        "state": QuestState.ACTIVE,
        "objectives": {},
        "chosen_path": "",
        "start_time": Time.get_unix_time_from_system(),
    }
    
    # Initialize objective progress
    for obj in quest["objectives"]:
        _player_quests[quest_id]["objectives"][obj["id"]] = {
            "progress": 0,
            "completed": false,
        }
    
    # Show first non-hidden objective
    _update_objective_visibility(quest_id)
    
    _save_player_quests()
    quest_started.emit(quest_id)
    
    if debug_mode: print("QuestManager: Started quest: ", quest_id)
    return true

func update_objective(quest_id: String, objective_id: String, progress: int = 1) -> void:
    """Update progress on an objective."""
    if not _player_quests.has(quest_id):
        return
    
    var player_quest = _player_quests[quest_id]
    if player_quest["state"] != QuestState.ACTIVE:
        return
    
    if not player_quest["objectives"].has(objective_id):
        return
    
    var obj_data = player_quest["objectives"][objective_id]
    if obj_data["completed"]:
        return
    
    var quest = _quests[quest_id]
    var obj_def = _find_objective(quest, objective_id)
    if not obj_def:
        return
    
    obj_data["progress"] = min(obj_data["progress"] + progress, obj_def["count"])
    
    if obj_data["progress"] >= obj_def["count"]:
        obj_data["completed"] = true
        objective_completed.emit(quest_id, objective_id)
        
        if debug_mode: print("QuestManager: Objective completed: ", objective_id)
        
        # Handle choice objectives
        if obj_def["type"] == ObjectiveType.CHOICE:
            # Choice is handled separately via make_choice()
            pass
        else:
            _check_quest_completion(quest_id)
    
    _save_player_quests()
    quest_updated.emit(quest_id, objective_id, obj_data["progress"])

func make_choice(quest_id: String, choice_id: String) -> bool:
    """Player makes a branching choice in a quest."""
    if not _player_quests.has(quest_id):
        return false
    
    var player_quest = _player_quests[quest_id]
    if player_quest["state"] != QuestState.ACTIVE:
        return false
    
    var quest = _quests[quest_id]
    var choice_obj: Dictionary = _find_objective(quest, "obj_choose_path")
    if not choice_obj or not choice_obj.has("choices"):
        choice_obj = _find_objective(quest, "obj_deal_with_raiders")
    if not choice_obj or not choice_obj.has("choices"):
        choice_obj = _find_objective(quest, "obj_caravan_fate")
    
    if not choice_obj or not choice_obj.has("choices"):
        return false
    
    var choice: Dictionary = {}
    for c in choice_obj["choices"]:
        if c["id"] == choice_id:
            choice = c
            break
    
    if not choice:
        if debug_mode: print("QuestManager: Choice not found: ", choice_id)
        return false
    
    # Check requirements
    if not _check_requirements(choice["requirements"]):
        if debug_mode: print("QuestManager: Requirements not met for choice: ", choice_id)
        return false
    
    # Apply requirements cost
    _apply_requirements_cost(choice["requirements"])
    
    # Apply reputation changes
    _apply_reputation_changes(choice.get("reputation_change", {}))
    
    # Store chosen path
    player_quest["chosen_path"] = choice_id
    
    # Mark choice objective as complete
    player_quest["objectives"][choice_obj["id"]]["completed"] = true
    player_quest["objectives"][choice_obj["id"]]["progress"] = 1
    objective_completed.emit(quest_id, choice_obj["id"])
    
    # Activate next objective in chosen path
    var next_obj_id = choice.get("next_objective", "")
    if next_obj_id:
        _activate_objective_chain(quest_id, next_obj_id)
    
    _save_player_quests()
    quest_updated.emit(quest_id, choice_obj["id"], 1)
    
    if debug_mode: print("QuestManager: Choice made: ", choice_id, " -> next: ", next_obj_id)
    return true

func _activate_objective_chain(quest_id: String, start_objective_id: String) -> void:
    """Activate a chain of objectives starting from given objective."""
    var quest = _quests[quest_id]
    var found = false
    
    for obj in quest["objectives"]:
        if found or obj["id"] == start_objective_id:
            found = true
            obj["hidden"] = false
            _update_objective_visibility(quest_id)
            break
    
    # Also activate subsequent objectives in the same path
    for obj in quest["objectives"]:
        if found and obj["id"] != start_objective_id:
            # Check if this objective belongs to the chosen path
            if _is_objective_in_path(quest, obj["id"], _player_quests[quest_id]["chosen_path"]):
                obj["hidden"] = false
            else:
                # Hide objectives from other paths
                obj["hidden"] = true

func _is_objective_in_path(quest: Dictionary, objective_id: String, chosen_path: String) -> bool:
    """Check if an objective belongs to the chosen path."""
    # Objectives after the choice that don't have a specific path prefix are shared
    var path_prefixes: Dictionary = {
        "choice_repair_purifier": ["obj_repair_purifier", "obj_install_chip"],
        "choice_trade_water": ["obj_trade_water", "obj_secure_route"],
        "choice_raid_necropolis": ["obj_raid_necropolis", "obj_loot_water"],
        "choice_eliminate": ["obj_kill_raiders", "obj_kill_leader"],
        "choice_negotiate": ["obj_negotiate_leader", "obj_escort_caravan"],
        "choice_pay_off": ["obj_pay_off"],
        "choice_rescue_survivors": ["obj_rescue_survivors", "obj_heal_survivors"],
        "choice_salvage_goods": ["obj_salvage_goods", "obj_escape_undetected"],
        "choice_investigate_cause": ["obj_investigate_cause", "obj_find_mutant_base"],
    }
    
    if chosen_path in path_prefixes:
        return objective_id in path_prefixes[chosen_path] or objective_id == "obj_report_back" or objective_id == "obj_report_carl" or objective_id == "obj_report_far_go"
    
    return true

func _update_objective_visibility(quest_id: String) -> void:
    """Update visibility of objectives based on completion."""
    if not _player_quests.has(quest_id):
        return
    
    var quest = _quests[quest_id]
    var player_quest = _player_quests[quest_id]
    
    var prev_completed = true
    for obj in quest["objectives"]:
        var obj_data = player_quest["objectives"].get(obj["id"], {})
        
        if prev_completed and not obj_data.get("completed", false):
            obj["hidden"] = false
            prev_completed = false
        elif obj_data.get("completed", false):
            obj["hidden"] = true
        else:
            obj["hidden"] = true

func _check_quest_completion(quest_id: String) -> void:
    """Check if all active objectives are complete."""
    if not _player_quests.has(quest_id):
        return
    
    var quest = _quests[quest_id]
    var player_quest = _player_quests[quest_id]
    
    var all_completed = true
    for obj in quest["objectives"]:
        var obj_data = player_quest["objectives"].get(obj["id"], {})
        # Only check non-hidden objectives that aren't choice objectives waiting for input
        if not obj["hidden"] and obj["type"] != ObjectiveType.CHOICE:
            if not obj_data.get("completed", false):
                all_completed = false
                break
    
    if all_completed:
        complete_quest(quest_id)

func complete_quest(quest_id: String, outcome: String = "success") -> void:
    """Complete a quest and grant rewards."""
    if not _player_quests.has(quest_id):
        return
    
    var player_quest = _player_quests[quest_id]
    if player_quest["state"] != QuestState.ACTIVE:
        return
    
    var quest = _quests[quest_id]
    player_quest["state"] = QuestState.COMPLETED
    player_quest["outcome"] = outcome
    player_quest["completion_time"] = Time.get_unix_time_from_system()
    
    # Grant rewards
    _grant_rewards(quest["rewards"])
    
    _save_player_quests()
    quest_completed.emit(quest_id, outcome)
    
    if debug_mode: print("QuestManager: Quest completed: ", quest_id, " outcome: ", outcome)

func fail_quest(quest_id: String, reason: String) -> void:
    """Fail a quest."""
    if not _player_quests.has(quest_id):
        return
    
    var player_quest = _player_quests[quest_id]
    if player_quest["state"] != QuestState.ACTIVE:
        return
    
    player_quest["state"] = QuestState.FAILED
    player_quest["failure_reason"] = reason
    
    _save_player_quests()
    quest_failed.emit(quest_id, reason)
    
    if debug_mode: print("QuestManager: Quest failed: ", quest_id, " reason: ", reason)

func _grant_rewards(rewards: Dictionary) -> void:
    """Grant quest rewards to player."""
    # This would integrate with CharacterSystem, Inventory, etc.
    # For now, emit signal for other systems to handle
    var eb = get_node_or_null("/root/EventBus")
    if not eb:
        return
    
    if rewards.has("xp"):
        eb.emit("xp_gained", [rewards["xp"]])
    if rewards.has("money"):
        eb.emit("money_gained", [rewards["money"]])
    if rewards.has("items"):
        for item_id in rewards["items"]:
            eb.emit("item_gained", [item_id, rewards["items"][item_id]])
    if rewards.has("reputation"):
        for faction in rewards["reputation"]:
            eb.emit("reputation_changed", [faction, rewards["reputation"][faction]])
    if rewards.has("perk"):
        eb.emit("perk_granted", [rewards["perk"]])

func _check_requirements(requirements: Dictionary) -> bool:
    """Check if player meets requirements."""
    if not requirements:
        return true
    
    # Check skills
    if requirements.has("skill_science"):
        if not _check_skill("science", requirements["skill_science"]):
            return false
    if requirements.has("skill_speech"):
        if not _check_skill("speech", requirements["skill_speech"]):
            return false
    if requirements.has("skill_sneak"):
        if not _check_skill("sneak", requirements["skill_sneak"]):
            return false
    
    # Check money - use GameManager's player_data
    if requirements.has("money"):
        var gm = get_node_or_null("/root/GameManager")
        var money = gm.player_data.get("caps", 0) if gm else 0
        if money < requirements["money"]:
            return false
    
    # Check items
    if requirements.has("items"):
        var inv = get_node_or_null("/root/Inventory")
        if inv:
            for item_id in requirements["items"]:
                var count = inv.get_item_count(item_id)
                if count < requirements["items"][item_id]:
                    return false
        else:
            return false
    
    # Combat requirement just means player must be able to fight
    if requirements.has("combat"):
        return true  # Always true if we're in a position to make the choice
    
    return true

func _check_skill(skill_name: String, required_value: int) -> bool:
    """Check if player has required skill level."""
    var cs = get_node_or_null("/root/CharacterSystem")
    if cs:
        return cs.get_skill(skill_name) >= required_value
    return false

func _apply_requirements_cost(requirements: Dictionary) -> void:
    """Apply costs for chosen option (money, items)."""
    if requirements.has("money"):
        var gm = get_node_or_null("/root/GameManager")
        if gm:
            gm.player_data["caps"] = gm.player_data.get("caps", 0) - requirements["money"]
    
    if requirements.has("items"):
        var inv = get_node_or_null("/root/Inventory")
        if inv:
            for item_id in requirements["items"]:
                inv.remove_item(item_id, requirements["items"][item_id])

func _apply_reputation_changes(changes: Dictionary) -> void:
    """Apply reputation changes."""
    var eb = get_node_or_null("/root/EventBus")
    if not eb:
        return
    for faction in changes:
        eb.emit("reputation_changed", [faction, changes[faction]])

func _find_objective(quest: Dictionary, objective_id: String) -> Variant:
    """Find objective definition by ID."""
    for obj in quest["objectives"]:
        if obj["id"] == objective_id:
            return obj
    return null

func get_quest_state(quest_id: String) -> int:
    """Get current state of a quest."""
    if _player_quests.has(quest_id):
        return _player_quests[quest_id]["state"]
    if _quests.has(quest_id):
        return _quests[quest_id]["state"]
    return QuestState.HIDDEN

func get_active_objectives(quest_id: String) -> Array:
    """Get list of active (visible, not completed) objectives for a quest."""
    var result = []
    if not _player_quests.has(quest_id):
        return result
    
    var quest = _quests[quest_id]
    var player_quest = _player_quests[quest_id]
    
    for obj in quest["objectives"]:
        var obj_data = player_quest["objectives"].get(obj["id"], {})
        if not obj["hidden"] and not obj_data.get("completed", false):
            var display_obj = obj.duplicate()
            display_obj["progress"] = obj_data.get("progress", 0)
            result.append(display_obj)
    
    return result

func get_available_choices(quest_id: String) -> Array:
    """Get available choices for a choice objective."""
    if not _player_quests.has(quest_id):
        return []
    
    var quest = _quests[quest_id]
    var choice_obj: Dictionary = _find_objective(quest, "obj_choose_path")
    if not choice_obj or not choice_obj.has("choices"):
        choice_obj = _find_objective(quest, "obj_deal_with_raiders")
    if not choice_obj or not choice_obj.has("choices"):
        choice_obj = _find_objective(quest, "obj_caravan_fate")
    
    if not choice_obj or not choice_obj.has("choices"):
        return []
    
    var choices = []
    for choice in choice_obj["choices"]:
        var available = _check_requirements(choice["requirements"])
        choices.append({
            "id": choice["id"],
            "text": choice["text"],
            "available": available,
            "requirements": choice["requirements"],
        })
    
    return choices

func get_quest_list(filter_state: int = -1) -> Array:
    """Get list of all quests, optionally filtered by state."""
    var result = []
    for quest_id in _quests:
        var quest = _quests[quest_id].duplicate()
        var state = get_quest_state(quest_id)
        quest["state"] = state
        quest["active_objectives"] = get_active_objectives(quest_id)
        
        if filter_state == -1 or state == filter_state:
            result.append(quest)
    
    return result

func is_quest_active(quest_id: String) -> bool:
    return get_quest_state(quest_id) == QuestState.ACTIVE

func is_quest_completed(quest_id: String) -> bool:
    return get_quest_state(quest_id) == QuestState.COMPLETED

func get_chosen_path(quest_id: String) -> String:
    if _player_quests.has(quest_id):
        return _player_quests[quest_id].get("chosen_path", "")
    return ""

# Event handlers for automatic objective updates
func _on_enemy_killed(enemy_type: String) -> void:
    """Handle enemy kill events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.KILL and obj["target"] == enemy_type:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], 1)

func _on_item_acquired(item_id: String, count: int) -> void:
    """Handle item acquisition events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.COLLECT and obj["target"] == item_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], count)

func _on_location_reached(location_id: String) -> void:
    """Handle location reached events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.REACH and obj["target"] == location_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], 1)

func _on_npc_talked(npc_id: String) -> void:
    """Handle NPC dialogue events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.TALK and obj["target"] == npc_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], 1)

func _on_item_crafted(item_id: String) -> void:
    """Handle crafting events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.CRAFT and obj["target"] == item_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], 1)

func _on_item_delivered(target_id: String, item_id: String, count: int) -> void:
    """Handle delivery events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.DELIVER and obj["target"] == target_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], count)

func _on_investigation_complete(target_id: String) -> void:
    """Handle investigation events."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for obj in quest["objectives"]:
            if obj["type"] == ObjectiveType.INVESTIGATE and obj["target"] == target_id:
                var obj_data = player_quest["objectives"].get(obj["id"], {})
                if not obj_data.get("completed", false):
                    update_objective(quest_id, obj["id"], 1)

func _on_npc_died(npc_id: String) -> void:
    """Check failure conditions on NPC death."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for condition in quest.get("failure_conditions", []):
            if condition["type"] == "npc_dead" and condition["target"] == npc_id:
                fail_quest(quest_id, "Ключевой персонаж погиб: " + npc_id)

func _on_location_destroyed(location_id: String) -> void:
    """Check failure conditions on location destruction."""
    for quest_id in _player_quests:
        var player_quest = _player_quests[quest_id]
        if player_quest["state"] != QuestState.ACTIVE:
            continue
        
        var quest = _quests[quest_id]
        for condition in quest.get("failure_conditions", []):
            if condition["type"] == "location_destroyed" and condition["target"] == location_id:
                fail_quest(quest_id, "Локация уничтожена: " + location_id)