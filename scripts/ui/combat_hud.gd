extends Control
class_name CombatHUD

## Mobile Combat HUD - Touch-friendly combat interface
## Shows AP/HP, hit chance, action buttons, and turn indicator

signal end_turn_pressed
signal action_selected(action_name: String, target_id: String)

# @onready node references - using get_node_or_null to avoid errors in headless/test scenes
var ap_bar: ProgressBar
var ap_label: Label
var hp_bar: ProgressBar
var hp_label: Label
var hit_chance_label: Label
var hit_chance_bar: ProgressBar
var end_turn_btn: Button
var action_buttons: GridContainer
var turn_indicator: Label
var current_actor_portrait: TextureRect
var weapon_panel: PanelContainer
var weapon_name: Label
var weapon_ammo: Label
var weapon_ap_cost: Label
var weapon_range: Label
var called_shot_btn: Button
var reload_btn: Button
var defend_btn: Button
var use_item_btn: Button

var _current_actor_id: String = ""
var _current_ap: int = 0
var _max_ap: int = 10
var _current_hp: int = 0
var _max_hp: int = 100
var _equipped_weapon: Dictionary = {}
var _target_data: Dictionary = {}

func _ready() -> void:
	# Safely get UI node references (may be null in test/headless scenes)
	ap_bar = get_node_or_null("APContainer/APBar")
	ap_label = get_node_or_null("APContainer/APLabel")
	hp_bar = get_node_or_null("HPContainer/HPBar")
	hp_label = get_node_or_null("HPContainer/HPLabel")
	hit_chance_label = get_node_or_null("HitChancePanel/HitChanceLabel")
	hit_chance_bar = get_node_or_null("HitChancePanel/HitChanceBar")
	end_turn_btn = get_node_or_null("ActionPanel/EndTurnButton")
	action_buttons = get_node_or_null("ActionPanel/ActionButtons")
	turn_indicator = get_node_or_null("TurnPanel/TurnLabel")
	current_actor_portrait = get_node_or_null("TurnPanel/ActorPortrait")
	weapon_panel = get_node_or_null("WeaponPanel")
	weapon_name = get_node_or_null("WeaponPanel/WeaponName")
	weapon_ammo = get_node_or_null("WeaponPanel/WeaponAmmo")
	weapon_ap_cost = get_node_or_null("WeaponPanel/WeaponAPCost")
	weapon_range = get_node_or_null("WeaponPanel/WeaponRange")
	called_shot_btn = get_node_or_null("ActionPanel/ActionButtons/CalledShotButton")
	reload_btn = get_node_or_null("ActionPanel/ActionButtons/ReloadButton")
	defend_btn = get_node_or_null("ActionPanel/ActionButtons/DefendButton")
	use_item_btn = get_node_or_null("ActionPanel/ActionButtons/UseItemButton")
	
	# Only connect signals if buttons exist
	if end_turn_btn:
		end_turn_btn.pressed.connect(_on_end_turn_pressed)
	if called_shot_btn:
		called_shot_btn.pressed.connect(_on_called_shot_pressed)
	if reload_btn:
		reload_btn.pressed.connect(_on_reload_pressed)
	if defend_btn:
		defend_btn.pressed.connect(_on_defend_pressed)
	if use_item_btn:
		use_item_btn.pressed.connect(_on_use_item_pressed)
	
	var cs = get_node_or_null("/root/CombatSystem")
	if cs:
		cs.turn_changed.connect(_on_turn_started)
		cs.combat_started.connect(_on_combat_started)
		cs.combat_ended.connect(_on_combat_ended)
	
var chs = get_node_or_null("/root/CharacterSystem")
 	if chs:
 		chs.stat_changed.connect(_on_stats_changed)
	
	hide()

func _on_combat_started(combat_data: Dictionary) -> void:
	show()
	_refresh_all()

func _on_combat_ended(victor: String) -> void:
	hide()

func _on_turn_started(actor_id: String, ap: int) -> void:
	_current_actor_id = actor_id
	_refresh_actor_info()
	_refresh_ap_hp()
	_refresh_weapon_info()
	_refresh_actions()
	
	var is_player = (actor_id == "player")
	end_turn_btn.disabled = not is_player
	called_shot_btn.disabled = not is_player
	reload_btn.disabled = not is_player
	defend_btn.disabled = not is_player
	use_item_btn.disabled = not is_player

func _on_stats_changed(character_id: String, stats: Dictionary) -> void:
	if character_id == _current_actor_id or character_id == "player":
		_refresh_ap_hp()
		_refresh_weapon_info()

func _refresh_all() -> void:
	_refresh_actor_info()
	_refresh_ap_hp()
	_refresh_weapon_info()
	_refresh_actions()

func _refresh_actor_info() -> void:
	if _current_actor_id.is_empty():
		if turn_indicator:
			turn_indicator.text = "[color=gray]Ожидание...[/color]"
		if current_actor_portrait:
			current_actor_portrait.texture = null
		return
	
	var is_player = (_current_actor_id == "player")
	if turn_indicator:
		turn_indicator.bbcode_text = "[b]Ход: [/b]" + ("[color=green]ВЫ[/color]" if is_player else "[color=red]" + _current_actor_id + "[/color]")
	
	# Portrait would be set from character data
	# current_actor_portrait.texture = load_portrait(_current_actor_id)

func _refresh_ap_hp() -> void:
	if _current_actor_id == "player":
		var cs = get_node_or_null("/root/CharacterSystem")
		if cs:
			var char_data = cs.get_character_data("player")
			if char_data:
				_max_ap = char_data.get("action_points", 10)
				var combat_sys = get_node_or_null("/root/CombatSystem")
				_current_ap = combat_sys.get_current_ap() if combat_sys else _max_ap
				_max_hp = char_data.get("max_hp", 100)
				_current_hp = char_data.get("current_hp", _max_hp)
	else:
		var combat_sys = get_node_or_null("/root/CombatSystem")
		if combat_sys:
			var enemy_data = combat_sys.get_participant_data(_current_actor_id)
			if enemy_data:
				_max_ap = enemy_data.get("max_ap", 10)
				_current_ap = enemy_data.get("current_ap", _max_ap)
				_max_hp = enemy_data.get("max_hp", 100)
				_current_hp = enemy_data.get("current_hp", _max_hp)
	
	# Safely update UI if nodes exist
	if ap_bar:
		ap_bar.max_value = _max_ap
		ap_bar.value = _current_ap
	if ap_label:
		ap_label.text = "[b]Действия:[/b] [color=yellow]%d/%d[/color]" % [_current_ap, _max_ap]
	
	if hp_bar:
		hp_bar.max_value = _max_hp
		hp_bar.value = _current_hp
	if hp_label:
		var hp_color = "green" if _current_hp > _max_hp * 0.5 else ("yellow" if _current_hp > _max_hp * 0.25 else "red")
		hp_label.bbcode_text = "[b]Здоровье:[/b] [color=%s]%d/%d[/color]" % [hp_color, _current_hp, _max_hp]
	
	# Update AP bar color
	if ap_bar:
		if _current_ap <= 2:
			ap_bar.add_theme_color_override("fill_color", Color(1, 0.3, 0.3))
		elif _current_ap <= 4:
			ap_bar.add_theme_color_override("fill_color", Color(1, 0.8, 0.2))
		else:
			ap_bar.add_theme_color_override("fill_color", Color(0.3, 1, 0.3))

func _refresh_weapon_info() -> void:
 	if _current_actor_id != "player":
 		if weapon_panel:
 			weapon_panel.visible = false
 		return
 	
 	var weapon = _get_equipped_weapon()
 	if not weapon:
 		if weapon_panel:
 			weapon_panel.visible = false
 		return
 	
 	_equipped_weapon = weapon
 	if weapon_panel:
 		weapon_panel.visible = true
 	
 	var item_db = get_node_or_null("/root/ItemDatabase")
 	var def = null
 	if item_db and item_db.has_method("get_weapon_definition"):
 		def = item_db.get_weapon_definition(weapon.id)
 	
 	if weapon_name:
 		weapon_name.text = weapon.get("name", weapon.id)
 	
 	if def:
 		var ammo_type = weapon.get("ammo_type", "")
 		var ammo_count = 0
 		var inv = get_node_or_null("/root/Inventory")
 		if inv and ammo_type:
 			ammo_count = inv.get_item_count(ammo_type)
 		var mag_size = def.get("magazine_size", 0)
 		
 		if weapon_ammo:
 			if mag_size > 0:
 				weapon_ammo.bbcode_text = "[b]Боеприпасы:[/b] [color=cyan]%d/%d[/color] %s" % [ammo_count, mag_size, ammo_type]
 			else:
 				weapon_ammo.text = "[b]Боеприпасы:[/b] -"
 		
 		if weapon_ap_cost:
 			var ap_cost = def.get("ap_cost", 5)
 			weapon_ap_cost.bbcode_text = "[b]ОД за выстрел:[/b] [color=yellow]%d[/color]" % ap_cost
 		
 		if weapon_range:
 			var range_val = def.get("range", 20)
 			weapon_range.bbcode_text = "[b]Дальность:[/b] [color=cyan]%dм[/color]" % range_val
 		
 		# Update hit chance for current target
 		_update_hit_chance_display()
 	else:
 		if weapon_ammo:
 			weapon_ammo.text = "[b]Боеприпасы:[/b] -"
 		if weapon_ap_cost:
 			weapon_ap_cost.text = "[b]ОД за выстрел:[/b] -"
 		if weapon_range:
 			weapon_range.text = "[b]Дальность:[/b] -"

func _refresh_actions() -> void:
	var is_player = (_current_actor_id == "player")
	var has_weapon = not _equipped_weapon.is_empty()
	
	var inv = get_node_or_null("/root/Inventory")
	var has_ammo = false
	if has_weapon and inv:
		var ammo_type = _equipped_weapon.get("ammo_type", "")
		if ammo_type:
			has_ammo = inv.get_item_count(ammo_type) > 0
	
if called_shot_btn:
 		called_shot_btn.disabled = not (is_player and has_weapon)
 	if reload_btn:
 		reload_btn.disabled = not (is_player and has_weapon and has_ammo)
 	if defend_btn:
 		defend_btn.disabled = not is_player
 	if use_item_btn:
 		use_item_btn.disabled = not is_player
	
# Update button text with AP costs
 	if has_weapon:
 		var item_db = get_node_or_null("/root/ItemDatabase")
 		var def = null
 		if item_db and item_db.has_method("get_weapon_definition"):
 			def = item_db.get_weapon_definition(_equipped_weapon.id)
 		if def:
 			var aimed_ap = def.get("aimed_ap_cost", def.get("ap_cost", 5) + 2)
 			if called_shot_btn:
 				called_shot_btn.text = "Прицельный выстрел\n[color=yellow]%d ОД[/color]" % aimed_ap
 		else:
 			if called_shot_btn:
 				called_shot_btn.text = "Прицельный выстрел"
 	
 	if reload_btn:
 		reload_btn.text = "Перезарядка\n[color=yellow]2 ОД[/color]"
 	if defend_btn:
 		defend_btn.text = "Оборона\n[color=yellow]1 ОД[/color]"
 	if use_item_btn:
 		use_item_btn.text = "Предмет\n[color=yellow]2-4 ОД[/color]"

func _update_hit_chance_display(target_data: Dictionary = {}) -> void:
 	if not target_data.is_empty():
 		_target_data = target_data
 	
 	if _target_data.is_empty() or _current_actor_id != "player":
 		if hit_chance_label:
 			hit_chance_label.bbcode_text = "[b]Шанс попадания:[/b] [color=gray]—[/color]"
 		if hit_chance_bar:
 			hit_chance_bar.value = 0
 			hit_chance_bar.max_value = 100
 		return
 	
 	var chance = _calculate_hit_chance(_target_data)
 	if hit_chance_bar:
 		hit_chance_bar.max_value = 100
 		hit_chance_bar.value = chance
 	
 	var chance_color = "green" if chance >= 75 else ("yellow" if chance >= 50 else ("orange" if chance >= 25 else "red"))
 	if hit_chance_label:
 		hit_chance_label.bbcode_text = "[b]Шанс попадания:[/b] [color=%s]%d%%[/color]" % [chance_color, chance]
 	
 	# Update bar color
 	if hit_chance_bar:
 		if chance >= 75:
 			hit_chance_bar.add_theme_color_override("fill_color", Color(0.3, 1, 0.3))
 		elif chance >= 50:
 			hit_chance_bar.add_theme_color_override("fill_color", Color(1, 0.8, 0.2))
 		elif chance >= 25:
 			hit_chance_bar.add_theme_color_override("fill_color", Color(1, 0.5, 0.1))
 		else:
 			hit_chance_bar.add_theme_color_override("fill_color", Color(1, 0.2, 0.2))

func _calculate_hit_chance(target_data: Dictionary) -> int:
	"""Calculate hit chance based on weapon, skills, distance, cover, called shot."""
	var base_chance = 50
	
	# Weapon skill
	if _equipped_weapon:
		var weapon_type = _equipped_weapon.get("skill_type", "small_guns")
		var cs = get_node_or_null("/root/CharacterSystem")
		if cs:
			var skill = cs.get_skill(weapon_type)
			base_chance += int(skill / 2)
	
	# Distance penalty
	var distance = target_data.get("distance", 10)
	var weapon_range = 20
	if _equipped_weapon:
		var idb = get_node_or_null("/root/ItemDatabase")
		if idb and idb.has_method("get_weapon_definition"):
			var def = idb.get_weapon_definition(_equipped_weapon.id)
			if def:
				weapon_range = def.get("range", 20)
	
	if distance > weapon_range:
		base_chance -= (distance - weapon_range) * 5
	elif distance > weapon_range * 0.5:
		base_chance -= (distance - weapon_range * 0.5) * 2
	
	# Cover penalty
	var cover = target_data.get("cover", 0)  # 0=none, 1=light, 2=medium, 3=heavy
	base_chance -= cover * 15
	
	# Target size modifier
	var target_size = target_data.get("size", "medium")
	match target_size:
		"small": base_chance -= 20
		"large": base_chance += 15
	
	# Called shot penalty (if aiming)
	if target_data.get("called_shot", false):
		base_chance -= 30
	
	# Target evasion/dexterity
	var target_agility = target_data.get("dexterity", 5)
	base_chance -= (target_agility - 5) * 2
	
	# Perks/traits
	var cs = get_node_or_null("/root/CharacterSystem")
	if cs and cs.has_perk("bonus_ranged_damage"):
		base_chance += 10
	
	# Lighting conditions
	var lighting = target_data.get("lighting", "normal")
	match lighting:
		"dark": base_chance -= 20
		"dim": base_chance -= 10
		"bright": base_chance += 5
	
	return clamp(base_chance, 5, 95)

func _on_end_turn_pressed() -> void:
	end_turn_pressed.emit()

func _on_called_shot_pressed() -> void:
	if _current_actor_id == "player" and not _equipped_weapon.is_empty():
		# Show called shot panel
		var csp = get_node_or_null("/root/CalledShotPanel")
		if csp and csp.has_method("show_for_weapon"):
			csp.show_for_weapon(_equipped_weapon)
		action_selected.emit("called_shot", _target_data.get("target_id", ""))

func _on_reload_pressed() -> void:
	if _current_actor_id == "player" and _equipped_weapon.get("ammo_type", ""):
		action_selected.emit("reload", _equipped_weapon.id)

func _on_defend_pressed() -> void:
	if _current_actor_id == "player":
		action_selected.emit("defend", "")

func _on_use_item_pressed() -> void:
	if _current_actor_id == "player":
		# Open inventory quick-use
		var iu = get_node_or_null("/root/InventoryUI")
		if iu and iu.has_method("show_quick_use"):
			iu.show_quick_use()
		action_selected.emit("use_item", "")

func _get_equipped_weapon() -> Dictionary:
	var inventory = get_node_or_null("/root/Inventory")
	if inventory and inventory.has_method("get_equipped_item"):
		return inventory.get_equipped_item("weapon_right") or inventory.get_equipped_item("weapon_left") or {}
	return {}

func show_target_info(target_id: String, target_data: Dictionary) -> void:
	"""Call when player selects a target."""
	if _current_actor_id == "player":
		_update_hit_chance_display(target_data)

func hide_target_info() -> void:
	_target_data = {}
	_update_hit_chance_display()