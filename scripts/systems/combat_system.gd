class_name CombatSystem
extends Node

## Turn-based combat system (Fallout 1/2 style).
## Action Points, hit chance, damage types, critical hits.

signal combat_started(combat_data: Dictionary)
signal turn_changed(actor_id: String, ap: int)
signal action_performed(actor_id: String, action: String, target_id: String, result: Dictionary)
signal combat_ended(victor: String, rewards: Dictionary)

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

@export var base_ap: int = 10
@export var ap_per_agility: float = 0.5

var _participants: Array[Dictionary] = []
var _turn_order: Array[String] = []
var _current_turn_index: int = 0
var _combat_id: int = 0
var _is_active: bool = false

func _ready() -> void:
	set_process(false)

func start_combat(participants: Array) -> Dictionary:
	"""Start a new combat encounter.
	
	participants: Array of dicts with keys:
	- id: unique identifier
	- name: display name
	- team: "player" or "enemy"
	- hp, max_hp
	- ap, max_ap (optional, calculated from agility if not provided)
	- stats: {strength, perception, endurance, charisma, intelligence, agility, luck}
	- skills: {small_guns, big_guns, energy_weapons, melee, unarmed, ...}
	- armor: {damage_resistance: {}, damage_threshold: {}}
	- weapon: {damage_min, damage_max, damage_type, ap_cost, range, skill, crit_chance, crit_multiplier}
	- position: Vector2 (for range calculations)
	"""
	_combat_id += 1
	_participants = []
	_turn_order = []
	
	for p in participants:
		var participant = p.duplicate(true)
		print("CombatSystem.start_combat: participant = ", participant)
		print("CombatSystem.start_combat: participant.weapon = ", participant.weapon)
		# Calculate derived stats if not provided
		if not participant.has("max_ap") or participant.max_ap <= 0:
			var agi = participant.stats.get("agility", 5)
			participant.max_ap = base_ap + int(agi * ap_per_agility)
		if not participant.has("ap"):
			participant.ap = participant.max_ap
		
		# Ensure required fields
		participant.id = participant.get("id", "combatant_" + str(_participants.size()))
		participant.team = participant.get("team", "enemy")
		participant.is_alive = true
		participant.status_effects = []
		
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
	var init_a = pa.stats.get("agility", 5) + pa.stats.get("perception", 5)
	var init_b = pb.stats.get("agility", 5) + pb.stats.get("perception", 5)
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

func _perform_player_action_internal(actor_id: String, action: String, target_id: String, extra: Dictionary) -> bool:
	match action:
		"attack":
			if target_id:
				return _perform_attack(actor_id, target_id, extra.get("aim_mode", "normal"))
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
	print("_perform_attack: attacker_id = ", attacker_id, " attacker = ", attacker)
	print("_perform_attack: attacker.weapon = ", weapon)
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
		damage = _calculate_damage(attacker, target, weapon)
		
		# Critical check
		var crit_chance = weapon.get("crit_chance", 5) + attacker.stats.get("luck", 5)
		if roll < crit_chance:
			result_type = CombatResult.CRITICAL
			is_critical = true
			damage = int(damage * weapon.get("crit_multiplier", 2.0))
		
		# Apply damage
		actual_damage = _apply_damage(target, damage, weapon.get("damage_type", DamageType.NORMAL))
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
		"is_critical": is_critical
	}
	
	action_performed.emit(attacker_id, "attack", target_id, result)
	
	# Check combat end
	_check_combat_end()
	
	if attacker.ap < 5:  # Minimum AP for any action
		call_deferred("_end_turn")
	
	return true

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
	
	# Aim mode bonus
	match aim_mode:
		"aimed": base_chance += 20
		"burst": base_chance -= 15
	
	# Target size/evasion (simplified)
	var target_agi = target.stats.get("agility", 5)
	base_chance -= target_agi * 2
	
	# Perception bonus
	base_chance += attacker.stats.get("perception", 5) * 2
	
	# Clamp
	return clamp(base_chance, 5, 95)

func _calculate_damage(attacker: Dictionary, target: Dictionary, weapon: Dictionary) -> int:
	var dmg_min = weapon.get("damage_min", 10)
	var dmg_max = weapon.get("damage_max", 20)
	var base_damage = randi() % (dmg_max - dmg_min + 1) + dmg_min
	
	# Strength bonus for melee
	if weapon.get("damage_type") == DamageType.MELEE:
		base_damage += attacker.stats.get("strength", 5) * 2
	
	return base_damage

func _apply_damage(target: Dictionary, damage: int, damage_type: int) -> int:
	var armor = target.get("armor", {})
	var dr = armor.get("damage_resistance", {}).get(str(damage_type), 0)
	var dt = armor.get("damage_threshold", {}).get(str(damage_type), 0)
	
	# Damage Resistance reduces damage by percentage
	var after_dr = int(damage * (100 - dr) / 100)
	# Damage Threshold subtracts flat amount
	var final = max(0, after_dr - dt)
	
	return final

func _perform_reload(actor_id: String) -> bool:
	var actor = _get_participant(actor_id)
	if not actor or not actor.is_alive:
		return false
	
	var ap_cost = 3
	if actor.ap < ap_cost:
		return false
	
	actor.ap -= ap_cost
	# Reload logic would go here (ammo management)
	action_performed.emit(actor_id, "reload", "", {"ap_cost": ap_cost})
	
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
	
	var ap_cost = 2
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
	
	_check_combat_end()
	
	if _is_active and _current_turn_index < _turn_order.size():
		_start_turn(_turn_order[_current_turn_index])

func _on_combatant_death(dead_id: String, killer_id: String) -> void:
	print("Combatant died: ", dead_id, " killed by: ", killer_id)
	# XP reward would go here
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
			# Loot drops would go here
	
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

func force_end_combat() -> void:
	_is_active = false
	set_process(false)