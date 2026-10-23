extends Control
class_name QuestLog

## Quest Log UI - displays active/completed quests and objectives

@onready var quest_list: VBoxContainer = $ScrollContainer/QuestList
@onready var quest_details: RichTextLabel = $DetailsPanel/QuestDetails
@onready var objective_list: VBoxContainer = $DetailsPanel/ScrollContainer/ObjectiveList
@onready var choice_panel: VBoxContainer = $DetailsPanel/ChoicePanel
@onready var close_btn: Button = $CloseButton

var _selected_quest_id: String = ""
var _quest_manager: QuestManager

func _ready() -> void:
    close_btn.pressed.connect(_on_close_pressed)
    _quest_manager = get_node_or_null("/root/QuestManager")
    if _quest_manager:
        _quest_manager.quest_started.connect(_on_quest_started)
        _quest_manager.quest_updated.connect(_on_quest_updated)
        _quest_manager.quest_completed.connect(_on_quest_completed)
        _quest_manager.quest_failed.connect(_on_quest_failed)
        _quest_manager.objective_completed.connect(_on_objective_completed)
    else:
        push_warning("QuestLog: QuestManager not found at /root/QuestManager")
    
    _refresh_quest_list()
    hide()

func _on_close_pressed() -> void:
    hide()

func _on_quest_started(quest_id: String) -> void:
    _refresh_quest_list()
    if is_visible():
        _select_quest(quest_id)

func _on_quest_updated(quest_id: String, objective_id: String, progress: int) -> void:
    _refresh_quest_list()
    if _selected_quest_id == quest_id:
        _show_quest_details(quest_id)

func _on_quest_completed(quest_id: String, outcome: String) -> void:
    _refresh_quest_list()
    if _selected_quest_id == quest_id:
        _show_quest_details(quest_id)

func _on_quest_failed(quest_id: String, reason: String) -> void:
    _refresh_quest_list()
    if _selected_quest_id == quest_id:
        _show_quest_details(quest_id)

func _on_objective_completed(quest_id: String, objective_id: String) -> void:
    if _selected_quest_id == quest_id:
        _show_quest_details(quest_id)

func show_quest_log() -> void:
    show()
    _refresh_quest_list()

func _refresh_quest_list() -> void:
    # Clear existing
    for child in quest_list.get_children():
        child.queue_free()
    
    if not _quest_manager:
        return
        
    var quests = _quest_manager.get_quest_list()
    for quest in quests:
        var btn = Button.new()
        btn.text = quest["title"]
        btn.tooltip_text = quest["description"]
        btn.custom_minimum_size = Vector2(0, 40)
        btn.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
        
        # Color by state - use integer values to avoid static enum access issues
        match quest["state"]:
            1: # ACTIVE
                btn.add_theme_color_override("font_color", Color(1, 1, 0.5))
            2: # COMPLETED
                btn.add_theme_color_override("font_color", Color(0.5, 1, 0.5))
            3: # FAILED
                btn.add_theme_color_override("font_color", Color(1, 0.5, 0.5))
            _:
                btn.add_theme_color_override("font_color", Color(0.7, 0.7, 0.7))
        
        btn.pressed.connect(_on_quest_selected.bind(quest["id"]))
        quest_list.add_child(btn)

func _on_quest_selected(quest_id: String) -> void:
    _selected_quest_id = quest_id
    _show_quest_details(quest_id)

func _show_quest_details(quest_id: String) -> void:
    if not _quest_manager:
        return
        
    var state = _quest_manager.get_quest_state(quest_id)
    if state == 0: # HIDDEN
        quest_details.bbcode_text = "[center]Этот квест еще не начат[/center]"
        _clear_objectives()
        _clear_choices()
        return
    
    var quest = null
    for q in _quest_manager.get_quest_list():
        if q["id"] == quest_id:
            quest = q
            break
    
    if not quest:
        return
    
    # Build details text
    var state_text = ""
    match state:
        1: # ACTIVE
            state_text = "[color=yellow]АКТИВЕН[/color]"
        2: # COMPLETED
            state_text = "[color=green]ЗАВЕРШЕН[/color]"
        3: # FAILED
            state_text = "[color=red]ПРОВАЛЕН[/color]"
    
    var chosen_path = _quest_manager.get_chosen_path(quest_id)
    var path_text = ""
    if chosen_path:
        path_text = "\n[color=cyan]Выбранный путь: [/color]" + _get_path_name(chosen_path)
    
    quest_details.bbcode_text = (
        "[b]" + quest["title"] + "[/b] " + state_text + "\n" +
        quest["description"] + path_text + "\n\n" +
        "[b]Награда:[/b]\n" + _format_rewards(quest.get("rewards", {}))
    )
    
    _show_objectives(quest_id)
    _show_choices(quest_id)

func _show_objectives(quest_id: String) -> void:
    _clear_objectives()
    
    if not _quest_manager:
        return
        
    var objectives = _quest_manager.get_active_objectives(quest_id)
    for obj in objectives:
        var hbox = HBoxContainer.new()
        
        var checkbox = CheckBox.new()
        checkbox.disabled = true
        checkbox.button_pressed = obj.get("progress", 0) >= obj["count"]
        hbox.add_child(checkbox)
        
        var label = Label.new()
        var progress_text = ""
        if obj["count"] > 1:
            progress_text = " ([color=yellow]" + str(obj.get("progress", 0)) + "/" + str(obj["count"]) + "[/color])"
        label.bbcode_text = obj["description"] + progress_text
        label.autowrap_mode = TextServer.AUTOWRAP_WORD
        label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
        hbox.add_child(label)
        
        hbox.custom_minimum_size = Vector2(0, 30)
        objective_list.add_child(hbox)

func _show_choices(quest_id: String) -> void:
    _clear_choices()
    
    if not _quest_manager:
        return
        
    var choices = _quest_manager.get_available_choices(quest_id)
    if choices.is_empty():
        return
    
    var label = Label.new()
    label.bbcode_text = "[b]Выберите действие:[/b]"
    choice_panel.add_child(label)
    
    for choice in choices:
        var btn = Button.new()
        btn.text = choice["text"]
        btn.custom_minimum_size = Vector2(0, 35)
        btn.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
        
        if not choice["available"]:
            btn.disabled = true
            btn.tooltip_text = "Недоступно: не выполнены требования"
        
        btn.pressed.connect(_on_choice_selected.bind(quest_id, choice["id"]))
        choice_panel.add_child(btn)

func _on_choice_selected(quest_id: String, choice_id: String) -> void:
    if _quest_manager and _quest_manager.make_choice(quest_id, choice_id):
        _show_quest_details(quest_id)

func _clear_objectives() -> void:
    for child in objective_list.get_children():
        child.queue_free()

func _clear_choices() -> void:
    for child in choice_panel.get_children():
        child.queue_free()

func _format_rewards(rewards: Dictionary) -> String:
    var lines = []
    if rewards.has("xp"):
        lines.append("  Опыт: " + str(rewards["xp"]))
    if rewards.has("money"):
        lines.append("  Колпачки: " + str(rewards["money"]))
    if rewards.has("items"):
        for item_id in rewards["items"]:
            lines.append("  " + item_id + " x" + str(rewards["items"][item_id]))
    if rewards.has("reputation"):
        for faction in rewards["reputation"]:
            lines.append("  Репутация (" + faction + "): " + str(rewards["reputation"][faction]))
    if rewards.has("perk"):
        lines.append("  Перк: " + rewards["perk"])
    if rewards.has("discount"):
        for npc in rewards["discount"]:
            lines.append("  Скидка у " + npc + ": " + str(int(rewards["discount"][npc] * 100)) + "%")
    return "\n".join(lines) if lines else "  Нет"

func _get_path_name(choice_id: String) -> String:
    match choice_id:
        "choice_repair_purifier": return "Ремонт очистителя"
        "choice_trade_water": return "Торговля водой"
        "choice_raid_necropolis": return "Налет на Некрополис"
        "choice_eliminate": return "Уничтожение бандитов"
        "choice_negotiate": return "Переговоры"
        "choice_pay_off": return "Выкуп"
        "choice_rescue_survivors": return "Спасение выживших"
        "choice_salvage_goods": return "Мародерство"
        "choice_investigate_cause": return "Расследование"
        _: return choice_id