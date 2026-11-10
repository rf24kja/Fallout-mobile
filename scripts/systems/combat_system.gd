class_name CombatSystem
extends Node

## Turn-based combat system (Fallout 1/2 style).
## Action Points, hit chance, damage types, critical hits, DT/DR, ammo, called shots.

signal combat_started(combat_data: Dictionary)
signal turn_changed(actor_id: String, ap: int)
signal action_performed(actor_id: String, action: String, target_id: String, result: Dictionary)
signal combat_ended(victor: String, rewards: Dictionary)

# Reference to cover system for line-of-fire checks
@onready var _cover_system = get_node_or_null("/root/CoverSystem")

enum DamageType {
	NORMAL = 0,
	LASER = 1,
	FIRE = 2,
	PLASMA = 3,
	ELECTRICAL = 4,
	EXPLOSIVE = 5,
	MELEE = 6
}

enum CombatResult {
	MISS = 0,
	HIT = 1,
	CRITICAL = 2
}

# Body parts for called shots
enum BodyPart {
	HEAD = 0,
	TORSO = 1,
	LEFT_ARM = 2,
	RIGHT_ARM = 3,
	LEFT_LEG = 4,
	RIGHT_LEG = 5,
	EYES = 6,
	GROIN = 7,
}

# Body part modifiers: {ap_cost_multiplier, accuracy_modifier, damage_multiplier, effects}
const BODY_PART_DATA: Dictionary = {
	BodyPart.HEAD: {"ap_mult": 1.4, "acc_mod": -20, "dmg_mult": 2.0, "effects": ["stun", "concussion"]},
	BodyPart.TORSO: {"ap_mult": 1.0, "acc_mod": 0, "dmg_mult": 1.0, "effects": []},
	BodyPart.LEFT_ARM: {"ap_mult": 1.2, "acc_mod": -10, "dmg_mult": 0.8, "effects": ["disarm", "cripple_arm"]},
	BodyPart.RIGHT_ARM: {"ap_mult": 1.2, "acc_mod": -10, "dmg_mult": 0.8, "effects": ["disarm", "cripple_arm"]},
	BodyPart.LEFT_LEG: {"ap_mult": 1.2, "acc_mod": -10, "dmg_mult": 0.8, "effects": ["knockdown", "cripple_leg"]},
	BodyPart.RIGHT_LEG: {"ap_mult": 1.2, "acc_mod": -10, "dmg_mult": 0.8, "effects": ["knockdown", "cripple_leg"]},
	BodyPart.EYES: {"ap_mult": 1.6, "acc_mod": -40, "dmg_mult": 2.5, "effects": ["blind", "cripple_eyes"]},
	BodyPart.GROIN: {"ap_mult": 1.2, "acc_mod": -15, "dmg_mult": 1.5, "effects": ["stun", "cripple_groin"]},
}
@export var base_ap: int = 5

@export var ap_per_agility: float = 0.5

var _participants: Array[Dictionary] = []
var _turn_order: Array[String] = []
var _current_turn_index: int = 0
var _combat_id: int = 0
var _is_active: bool = false
var _item_database

func _ready() -> void:
	set_process(false)
	_item_database = get_node_or_null("/root/ItemDatabase")

func start_combat(participants: Array) -> Dictionary:
	"""Start a new combat encounter.
	
	participants: Array of dicts with keys:
	- id: unique identifier
	- name: display name
	- team: "player" or "enemy"
	- hp, max_hp
	- ap, max_ap (optional, calculated from dexterity if not provided)
	- stats: {might, awareness, vigor, presence, intellect, dexterity, fortune}
	- skills: {small_guns, big_guns, energy_weapons, melee, unarmed, ...}
	- armor: {damage_resistance: {}, damage_threshold: {}}
	- weapon: {damage_min, damage_max, damage_type, ap_cost, range, skill, crit_chance, crit_multiplier, ammo_type, caliber, magazine_capacity, current_ammo}
	- position: Vector2 (for range calculations)
	"""
	_combat_id += 1
	_participants = []
	_turn_order = []
	
	for p in participants:
		var participant = p.duplicate(true)
		# Calculate derived stats if not provided
		if not participant.has("max_ap") or participant.max_ap <= 0:
			var agi = participant.stats.get("dexterity", 5)
			participant.max_ap = base_ap + int(agi * ap_per_agility)
		if not participant.has("ap"):
			participant.ap = participant.max_ap
		
		# Ensure required fields
		participant.id = participant.get("id", "combatant_" + str(_participants.size()))
		participant.team = participant.get("team", "enemy")
		participant.is_alive = true
		participant.status_effects = []
		participant.crippled_parts = []
		
		_participants.append(participant)
		_turn_order.append(participant.id)
	
	# Sort turn order by sequence (agility + perception for initiative)
	_turn_order.sort_custom(Callable(self, "_compare_initiative"))
	
	_current_turn_index = 0
	_is_active = true
	set_process(true)
	
	var combat_data = {
		"combat_id": _combat_id,
		"participants": _participants,
		"turn_order": _turn_order,
		"current_turn": _turn_order[_current_turn_index] if _turn_order.size() > 0 else ""
	}
	
	combat_started.emit(combat_data)
	_start_turn(_turn_order[_current_turn_index])
	
	return combat_data

func _compare_initiative(a: String, b: String) -> bool:
	var pa = _get_participant(a)
	var pb = _get_participant(b)
	if not pa or not pb:
		return false
	var init_a = pa.stats.get("dexterity", 5) + pa.stats.get("awareness", 5)
	var init_b = pb.stats.get("dexterity", 5) + pb.stats.get("awareness", 5)
	if init_a == init_b:
		return false
	# Higher initiative acts first
	return init_a > init_b

func _get_participant(id: String) -> Variant:
	for p in _participants:
		if p.id == id:
			return p
	return null

func _start_turn(actor_id: String) -> void:
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		_end_turn()
		return
	
	# Reset AP for new turn
	actor.ap = actor.max_ap
	
	turn_changed.emit(actor_id, actor.ap)
	
	# If AI-controlled, take action after a brief delay
	if actor.team == "enemy":
		call_deferred("_ai_take_turn", actor_id)

func _ai_take_turn(actor_id: String) -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		_end_turn()
		return
	
	# Simple AI: find nearest enemy and attack
	var target_id = _find_nearest_enemy(actor_id)
	if target_id:
		# AI occasionally uses called shots
		if randi() % 4 == 0:
			var body_parts = [BodyPart.HEAD, BodyPart.TORSO, BodyPart.LEFT_LEG, BodyPart.RIGHT_LEG]
			var part = body_parts[randi() % body_parts.size()]
			_perform_called_shot(actor_id, target_id, part)
		else:
			_perform_attack(actor_id, target_id, "aimed")
	else:
		_end_turn()

func _find_nearest_enemy(actor_id: String) -> String:
	var actor = _get_participant(actor_id)
	if not actor:
		return ""
	
	var best_target = ""
	var best_dist = INF
	
	for p in _participants:
		if p.id == actor_id or not p.is_alive or p.team == actor.team:
			continue
		var dist = actor.position.distance_to(p.position)
		if dist < best_dist:
			best_dist = dist
			best_target = p.id
	
	return best_target

func perform_player_action(action: String, target_id: String = "", extra: Dictionary = {}) -> bool:
	"""Called by player UI to perform actions."""
	var actor_id = _turn_order[_current_turn_index] if _current_turn_index < _turn_order.size() else ""
	var actor = _get_participant(actor_id)
	
	if not actor or actor.team != "player" or not actor.is_alive:
		return false
	
	return _perform_player_action_internal(actor_id, action, target_id, extra)

func perform_attack_direct(attacker_id: String, target_id: String, aim_mode: String = "normal") -> bool:
	"""Direct attack for testing - bypasses turn system."""
	return _perform_attack(attacker_id, target_id, aim_mode)

func perform_called_shot_direct(attacker_id: String, target_id: String, body_part: int) -> bool:
	"""Direct called shot for testing."""
	return _perform_called_shot(attacker_id, target_id, body_part)

func _perform_player_action_internal(actor_id: String, action: String, target_id: String, extra: Dictionary) -> bool:
	match action:
		"attack":
			if target_id:
				return _perform_attack(actor_id, target_id, extra.get("aim_mode", "normal"))
		"called_shot":
			if target_id and extra.has("body_part"):
				return _perform_called_shot(actor_id, target_id, extra.body_part)
		"reload":
			return _perform_reload(actor_id)
		"use_item":
			return _perform_use_item(actor_id, extra.get("item_id", ""))
		"move":
			return _perform_move(actor_id, extra.get("position", Vector2.ZERO))
		"end_turn":
			_end_turn()
			return true
	
	return false

func _perform_attack(attacker_id: String, target_id: String, aim_mode: String) -> bool:
	var attacker = _get_participant(attacker_id)
	var target = _get_participant(target_id)
	
	if not attacker or not target or not attacker.is_alive or not target.is_alive:
		return false
	
	var weapon = attacker.weapon
	if not weapon or weapon.size() == 0:
		print("No weapon equipped or empty weapon dict")
		return false
	
	var ap_cost = weapon.get("ap_cost", 5)
	if aim_mode == "aimed":
		ap_cost = int(ap_cost * 1.5)
	elif aim_mode == "burst":
		ap_cost = int(ap_cost * 2)
	
	if attacker.ap < ap_cost:
		print("Not enough AP")
		return false
	
	attacker.ap -= ap_cost
	
	# Calculate hit chance
	var hit_chance = _calculate_hit_chance(attacker, target, weapon, aim_mode)
	var roll = randi() % 100
	var is_critical = false
	var damage = 0
	var actual_damage = 0
	var result_type = CombatResult.MISS
	
	if roll < hit_chance:
		# Hit!
		result_type = CombatResult.HIT
		damage = _calculate_damage(attacker, target, weapon, aim_mode)
		
		# Critical check
		var crit_chance = weapon.get("crit_chance", 5) + attacker.stats.get("fortune", 5)
		if roll < crit_chance:
			result_type = CombatResult.CRITICAL
			is_critical = true
			damage = int(damage * weapon.get("crit_multiplier", 2.0))
		
		# Apply damage
		var ammo_type = weapon.get("ammo_type", "")
		actual_damage = _apply_damage(target, damage, weapon.get("damage_type", DamageType.NORMAL), ammo_type, weapon)
		target.hp = max(0, target.hp - actual_damage)
		
		if target.hp <= 0:
			target.is_alive = false
			_on_combatant_death(target_id, attacker_id)
	
	var result = {
		"attacker": attacker_id,
		"target": target_id,
		"result": result_type,
		"damage": actual_damage,
		"hit_chance": hit_chance,
		"roll": roll,
		"ap_cost": ap_cost,
		"is_critical": is_critical,
		"aim_mode": aim_mode
	}
	
	action_performed.emit(attacker_id, "attack", target_id, result)
	
	# Check combat end
	_check_combat_end()
	
	if attacker.ap < 5:  # Minimum AP for any action
		call_deferred("_end_turn")
	
	return true

func _perform_called_shot(attacker_id: String, target_id: String, body_part: int) -> bool:
	var attacker = _get_participant(attacker_id)
	var target = _get_participant(target_id)
	
	if not attacker or not target or not attacker.is_alive or not target.is_alive:
		return false
	
	var weapon = attacker.weapon
	if not weapon or weapon.size() == 0:
		return false
	
	# Validate body part
	if not BODY_PART_DATA.has(body_part):
		return false
	
	var part_data = BODY_PART_DATA[body_part]
	var ap_cost = int(weapon.get("ap_cost", 5) * part_data.ap_mult)
	
	if attacker.ap < ap_cost:
		return false
	
	attacker.ap -= ap_cost
	
	# Calculate hit chance with body part accuracy modifier
	var hit_chance = _calculate_hit_chance(attacker, target, weapon, "aimed")
	hit_chance += part_data.acc_mod
	hit_chance = clamp(hit_chance, 5, 95)
	
	var roll = randi() % 100
	var is_critical = false
	var damage = 0
	var actual_damage = 0
	var result_type = CombatResult.MISS
	var applied_effects = []
	
	if roll < hit_chance:
		# Hit!
		result_type = CombatResult.HIT
		damage = _calculate_damage(attacker, target, weapon, "aimed")
		damage = int(damage * part_data.dmg_mult)
		
		# Critical check
		var crit_chance = weapon.get("crit_chance", 5) + attacker.stats.get("fortune", 5)
		if roll < crit_chance:
			result_type = CombatResult.CRITICAL
			is_critical = true
			damage = int(damage * weapon.get("crit_multiplier", 2.0))
		
		# Apply damage with ammo modifiers
		var ammo_type = weapon.get("ammo_type", "")
		actual_damage = _apply_damage(target, damage, weapon.get("damage_type", DamageType.NORMAL), ammo_type, weapon)
		target.hp = max(0, target.hp - actual_damage)
		
		# Apply body part effects
		for effect in part_data.effects:
			_apply_body_part_effect(target, effect, body_part)
			applied_effects.append(effect)
		
		if target.hp <= 0:
			target.is_alive = false
			_on_combatant_death(target_id, attacker_id)
	
	var part_names = ["HEAD", "TORSO", "LEFT_ARM", "RIGHT_ARM", "LEFT_LEG", "RIGHT_LEG", "EYES", "GROIN"]
	var part_name = part_names[body_part] if body_part < part_names.size() else "UNKNOWN"
	
	var result = {
		"attacker": attacker_id,
		"target": target_id,
		"result": result_type,
		"damage": actual_damage,
		"hit_chance": hit_chance,
		"roll": roll,
		"ap_cost": ap_cost,
		"is_critical": is_critical,
		"body_part": body_part,
		"body_part_name": part_name,
		"effects_applied": applied_effects
	}
	
	action_performed.emit(attacker_id, "called_shot", target_id, result)
	
	_check_combat_end()
	
	if attacker.ap < 5:
		call_deferred("_end_turn")
	
	return true

func _apply_body_part_effect(target: Dictionary, effect: String, body_part: int) -> void:
	"""Apply status effect from called shot."""
	var status_effects = target.get("status_effects", [])
	
	match effect:
		"stun":
			status_effects.append({"type": "stun", "duration": 1, "source_part": body_part})
		"concussion":
			status_effects.append({"type": "concussion", "duration": 3, "accuracy_penalty": -20})
		"disarm":
			# Drop weapon - would need inventory integration
			status_effects.append({"type": "disarmed", "duration": 1})
		"cripple_arm":
			if body_part not in target.crippled_parts:
				target.crippled_parts.append(body_part)
			status_effects.append({"type": "crippled_arm", "duration": -1, "part": body_part})
		"knockdown":
			status_effects.append({"type": "knockdown", "duration": 1})
		"cripple_leg":
			if body_part not in target.crippled_parts:
				target.crippled_parts.append(body_part)
			status_effects.append({"type": "crippled_leg", "duration": -1, "part": body_part})
		"blind":
			status_effects.append({"type": "blind", "duration": 3, "accuracy_penalty": -40})
		"cripple_eyes":
			if body_part not in target.crippled_parts:
				target.crippled_parts.append(body_part)
			status_effects.append({"type": "crippled_eyes", "duration": -1, "part": body_part})
		"cripple_groin":
			if body_part not in target.crippled_parts:
				target.crippled_parts.append(body_part)
			status_effects.append({"type": "crippled_groin", "duration": -1, "part": body_part})
	
	target.status_effects = status_effects

func _calculate_hit_chance(attacker: Dictionary, target: Dictionary, weapon: Dictionary, aim_mode: String) -> int:
	var base_chance = 50
	var skill_name = weapon.get("skill", "small_guns")
	var skill = attacker.skills.get(skill_name, 0)
	
	# Base from skill
	base_chance += skill
	
	# Distance penalty
	var dist = attacker.position.distance_to(target.position)
	var range = weapon.get("range", 200)
	if dist > range:
		base_chance -= int((dist - range) * 2)
	
	# Cover / Line of Fire check
	if _cover_system:
		var cover_level = _cover_system.check_combat_cover(attacker, target)
		base_chance += _cover_system.get_accuracy_penalty(cover_level)
		
		# Pierce cover weapon effect
		var special_effects = weapon.get("special_effects", [])
		for effect in special_effects:
			if effect == "pierce_cover":
				# Reduce cover penalty by half
				base_chance -= _cover_system.get_accuracy_penalty(cover_level) / 2
	
	# Aim mode bonus
	match aim_mode:
		"aimed": base_chance += 20
		"burst": base_chance -= 15
	
	# Target size/evasion (simplified)
	var target_agi = target.stats.get("dexterity", 5)
	base_chance -= target_agi * 2
	
	# Awareness bonus
	base_chance += attacker.stats.get("awareness", 5) * 2
	
	# Crippled arm penalty
	if BodyPart.LEFT_ARM in target.crippled_parts or BodyPart.RIGHT_ARM in target.crippled_parts:
		base_chance -= 20
	
	# Blind penalty
	for effect in target.status_effects:
		if effect.type == "blind" or effect.type == "crippled_eyes":
			base_chance += effect.accuracy_penalty
	
	# Clamp
	return clamp(base_chance, 5, 95)

func _calculate_damage(attacker: Dictionary, target: Dictionary, weapon: Dictionary, aim_mode: String) -> int:
	var dmg_min = weapon.get("damage_min", 10)
	var dmg_max = weapon.get("damage_max", 20)
	var base_damage = randi() % (dmg_max - dmg_min + 1) + dmg_min
	
	# Strength bonus for melee
	if weapon.get("damage_type") == DamageType.MELEE:
		base_damage += attacker.stats.get("might", 5) * 2
	
	# Burst fire: multiple shots, each with reduced accuracy
	if aim_mode == "burst":
		var burst_shots = weapon.get("burst_shots", 3)
		var burst_penalty = weapon.get("burst_accuracy_penalty", 0.15)
		# For simplicity, return single shot damage; actual burst handled in attack
	
	return base_damage

func _apply_damage(target: Dictionary, damage: int, damage_type: int, ammo_type: String, weapon: Dictionary = {}) -> int:
	var armor = target.get("armor", {})
	
	# First, apply damage type override if ammo specifies it
	var final_damage_type = damage_type
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def and ammo_def.damage_type_override >= 0:
			final_damage_type = ammo_def.damage_type_override
	
	# Get base DT/DR for the final damage type
	var dr = armor.get("damage_resistance", {}).get(str(final_damage_type), 0)
	var dt = armor.get("damage_threshold", {}).get(str(final_damage_type), 0)
	
	# Apply ammo modifiers if present
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def:
			# Damage modifier
			damage = int(damage * ammo_def.damage_modifier)
			# DT modifier (JHP increases DT effectiveness, AP reduces it)
			dt = int(dt * ammo_def.dt_modifier)
			# DR modifier
			dr = int(dr * ammo_def.dr_modifier)
	
	# Apply weapon special effects for DT reduction
	var special_effects = weapon.get("special_effects", [])
	for effect in special_effects:
		if effect.begins_with("ignore_"):
			var percent_str = effect.get_slice("_", 1)
			if percent_str.is_valid_int():
				var ignore_percent = percent_str.to_int()
				dt = int(dt * (100 - ignore_percent) / 100)
		# pierce_cover is handled in hit chance calculation
	
	# Fallout 2 Formula: Apply DT first, then DR
	# final_damage = max(1, (raw_damage * dmg_mod - DT * dt_mod) * (1 - DR * dr_mod / 100))
	var after_dt = damage - dt
	var after_dr = int(after_dt * (100 - dr) / 100)
	var final = max(1, after_dr)  # Fallout 2: minimum 1 damage if hit
	
	return final

func _perform_reload(actor_id: String) -> bool:
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		return false
	
	var weapon = actor.weapon
	if not weapon:
		return false
	
	var ap_cost = weapon.get("reload_ap_cost", 3)
	if actor.ap < ap_cost:
		return false
	
	actor.ap -= ap_cost
	# Reload logic: refill current_ammo from inventory
	var caliber = weapon.get("caliber", "")
	if caliber != "" and _item_database:
		# Would integrate with inventory to find and consume ammo
		weapon.current_ammo = weapon.get("magazine_capacity", 0)
	
	action_performed.emit(actor_id, "reload", "", {"ap_cost": ap_cost, "ammo_type": caliber})
	
	if actor.ap < 5:
		call_deferred("_end_turn")
	return true

func _perform_use_item(actor_id: String, item_id: String) -> bool:
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		return false
	
	var ap_cost = 4
	if actor.ap < ap_cost:
		return false
	
	actor.ap -= ap_cost
	# Item use logic would integrate with Inventory system
	action_performed.emit(actor_id, "use_item", "", {"item_id": item_id, "ap_cost": ap_cost})
	
	if actor.ap < 5:
		call_deferred("_end_turn")
	return true

func _perform_move(actor_id: String, position: Vector2) -> bool:
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		return false
	
	# Fallout 2: Move 1 hex = 1 AP, crippled leg = 2 AP
	var ap_cost = 1
	if BodyPart.LEFT_LEG in actor.crippled_parts or BodyPart.RIGHT_LEG in actor.crippled_parts:
		ap_cost = 2
	
	if actor.ap < ap_cost:
		return false
	
	actor.ap -= ap_cost
	actor.position = position
	action_performed.emit(actor_id, "move", "", {"position": position, "ap_cost": ap_cost})
	
	if actor.ap < 5:
		call_deferred("_end_turn")
	return true

func _end_turn() -> void:
	if not _is_active:
		return
	
	_current_turn_index += 1
	
	# Skip dead participants
	while _current_turn_index < _turn_order.size():
		var next_id = _turn_order[_current_turn_index]
		var next_actor = _get_participant(next_id)
		if next_actor and next_actor.is_alive:
			break
		_current_turn_index += 1
	
	if _current_turn_index >= _turn_order.size():
		_current_turn_index = 0
		# New round - could add round-based effects here
		# Decay status effects
		for p in _participants:
			if p.is_alive:
				var new_effects = []
				for effect in p.status_effects:
					if effect.duration > 0:
						effect.duration -= 1
						if effect.duration > 0:
							new_effects.append(effect)
					elif effect.duration == -1:
						# Permanent effect (crippled)
						new_effects.append(effect)
				p.status_effects = new_effects
	
	_check_combat_end()
	
	if _is_active and _current_turn_index < _turn_order.size():
		_start_turn(_turn_order[_current_turn_index])

func _on_combatant_death(dead_id: String, killer_id: String) -> void:
	print("Combatant died: ", dead_id, " killed by: ", killer_id)
	_check_combat_end()

func _check_combat_end() -> void:
	var player_alive = false
	var enemy_alive = false
	
	for p in _participants:
		if p.is_alive:
			if p.team == "player":
				player_alive = true
			else:
				enemy_alive = true
	
	if not player_alive or not enemy_alive:
		_is_active = false
		set_process(false)
		
		var victor = "enemy" if not player_alive else "player"
		var rewards = _calculate_rewards(victor)
		combat_ended.emit(victor, rewards)

func _calculate_rewards(victor: String) -> Dictionary:
	var xp_total = 0
	var loot = []
	
	for p in _participants:
		if not p.is_alive and p.team != victor:
			xp_total += p.get("xp_value", 50)
	
	return {"xp": xp_total, "loot": loot}

func get_current_actor() -> Variant:
	if _current_turn_index < _turn_order.size():
		return _get_participant(_turn_order[_current_turn_index])
	return null

func get_combat_state() -> Dictionary:
	return {
		"is_active": _is_active,
		"combat_id": _combat_id,
		"participants": _participants,
		"turn_order": _turn_order,
		"current_turn_index": _current_turn_index,
		"current_actor_id": _turn_order[_current_turn_index] if _current_turn_index < _turn_order.size() else ""
	}

func get_participant_data(actor_id: String) -> Dictionary:
	var participant = _get_participant(actor_id)
	if participant:
		return participant.duplicate(true)
	return {}

func get_current_ap() -> int:
	var current_actor = get_current_actor()
	if current_actor:
		return current_actor.get("ap", 0)
	return 0

func force_end_combat() -> void:
	_is_active = false
	set_process(false)

# Test helper: calculate_damage with all parameters for unit testing
func calculate_damage_test(raw_damage: int, ammo_type: String, target_armor: Dictionary, damage_type: int = DamageType.NORMAL, weapon: Dictionary = {}) -> int:
	"""Test helper for DT/DR calculation with ammo modifiers."""
	var damage = raw_damage
	
	# First, apply damage type override if ammo specifies it
	var final_damage_type = damage_type
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def and ammo_def.damage_type_override >= 0:
			final_damage_type = ammo_def.damage_type_override
	
	# Get base DT/DR for the final damage type
	var dr = target_armor.get("damage_resistance", {}).get(str(final_damage_type), 0)
	var dt = target_armor.get("damage_threshold", {}).get(str(final_damage_type), 0)
	
	if ammo_type != "" and _item_database:
		var ammo_def = _item_database.get_item(ammo_type)
		if ammo_def:
			damage = int(damage * ammo_def.damage_modifier)
			dt = int(dt * ammo_def.dt_modifier)
			dr = int(dr * ammo_def.dr_modifier)
	
	# Apply weapon special effects for DT reduction
	var special_effects = weapon.get("special_effects", [])
	for effect in special_effects:
		if effect.begins_with("ignore_"):
			var percent_str = effect.get_slice("_", 1)
			if percent_str.is_valid_int():
				var ignore_percent = percent_str.to_int()
				dt = int(dt * (100 - ignore_percent) / 100)
	
	var after_dr = int(damage * (100 - dr) / 100)
	return max(0, after_dr - dt)