class_name CharacterSystem
extends Node

const CharacterCreationRules = preload("res://scripts/systems/character_creation.gd")

## Character progression system (Fallout 1/2 style).
## XP, levels, SPECIAL, skills, perks.

signal level_up(new_level: int, skill_points: int, perk_available: bool)
signal xp_gained(amount: int, total_xp: int)
signal stat_changed(stat: String, old_value: int, new_value: int)
signal skill_changed(skill: String, old_value: int, new_value: int)
signal perk_acquired(perk_id: String)

# XP curve: Fallout 2 cumulative formula
# Level 1: 0 XP
# Level 2: 1,000 XP  
# Level 3: 3,000 XP
# Level 4: 6,000 XP
# Level 5: 10,000 XP
# General: XP(level) = 1000 * level * (level - 1) / 2
static func xp_for_level(level: int) -> int:
	return 1000 * level * (level - 1) / 2

static func level_from_xp(xp: int) -> int:
	var level = 1
	while xp >= xp_for_level(level + 1):
		level += 1
	return level

# SPECIAL stat names (full names for display) — renamed for original IP
static var SPECIAL_NAMES = {
	"might": "Might",
	"awareness": "Awareness",
	"vigor": "Vigor",
	"presence": "Presence",
	"intellect": "Intellect",
	"dexterity": "Dexterity",
	"fortune": "Fortune"
}

# Skill definitions with base SPECIAL dependency.
# `default_value`, `stat_modifier`, `stat1`, `stat2` mirror the verified
# fallout2-ce table (skill.cc:78-97) and drive the vanilla skill formula
# (skill.cc:230-269) implemented in CharacterCreationRules.calculate_skills().
# `tag_bonus` is kept for older call sites but is no longer used to compute
# skill values (tagged skills now get +20 and double invested points).
static var SKILL_DEFS = {
	"small_guns": {"base_stat": "dexterity", "base_value": 5, "tag_bonus": 20, "default_value": 5, "stat_modifier": 4, "stat1": "dexterity", "stat2": ""},
	"big_guns": {"base_stat": "dexterity", "base_value": 0, "tag_bonus": 10, "default_value": 0, "stat_modifier": 2, "stat1": "dexterity", "stat2": ""},
	"energy_weapons": {"base_stat": "awareness", "base_value": 0, "tag_bonus": 10, "default_value": 0, "stat_modifier": 2, "stat1": "dexterity", "stat2": ""},
	"unarmed": {"base_stat": "dexterity", "base_value": 15, "tag_bonus": 20, "default_value": 30, "stat_modifier": 2, "stat1": "dexterity", "stat2": "might"},
	"melee": {"base_stat": "might", "base_value": 10, "tag_bonus": 20, "default_value": 20, "stat_modifier": 2, "stat1": "dexterity", "stat2": "might"},
	"throwing": {"base_stat": "dexterity", "base_value": 4, "tag_bonus": 10, "default_value": 0, "stat_modifier": 4, "stat1": "dexterity", "stat2": ""},
	"first_aid": {"base_stat": "awareness", "base_value": 10, "tag_bonus": 20, "default_value": 0, "stat_modifier": 2, "stat1": "awareness", "stat2": "intellect"},
	"doctor": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 10, "default_value": 5, "stat_modifier": 1, "stat1": "awareness", "stat2": "intellect"},
	"sneak": {"base_stat": "dexterity", "base_value": 5, "tag_bonus": 15, "default_value": 10, "stat_modifier": 1, "stat1": "awareness", "stat2": "dexterity"},
	"lockpick": {"base_stat": "awareness", "base_value": 10, "tag_bonus": 15, "default_value": 10, "stat_modifier": 1, "stat1": "awareness", "stat2": "dexterity"},
	"steal": {"base_stat": "dexterity", "base_value": 0, "tag_bonus": 10, "default_value": 5, "stat_modifier": 3, "stat1": "dexterity", "stat2": ""},
	"traps": {"base_stat": "intellect", "base_value": 10, "tag_bonus": 10, "default_value": 0, "stat_modifier": 3, "stat1": "dexterity", "stat2": ""},
	"science": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 15, "default_value": 0, "stat_modifier": 3, "stat1": "intellect", "stat2": ""},
	"repair": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 10, "default_value": 0, "stat_modifier": 4, "stat1": "intellect", "stat2": ""},
	"speech": {"base_stat": "presence", "base_value": 10, "tag_bonus": 15, "default_value": 0, "stat_modifier": 5, "stat1": "presence", "stat2": ""},
	"barter": {"base_stat": "presence", "base_value": 10, "tag_bonus": 10, "default_value": 0, "stat_modifier": 4, "stat1": "presence", "stat2": ""},
	"gambling": {"base_stat": "fortune", "base_value": 10, "tag_bonus": 10, "default_value": 0, "stat_modifier": 5, "stat1": "fortune", "stat2": ""},
	"outdoorsman": {"base_stat": "vigor", "base_value": 0, "tag_bonus": 10, "default_value": 0, "stat_modifier": 2, "stat1": "vigor", "stat2": "intellect"},
}

# Perk definitions
static var PERK_DEFS = {
	"awareness": {
		"name": "Awareness",
		"description": "You can see the exact HP and equipment of any creature you target.",
		"level_req": 3,
		"stat_reqs": {"awareness": 5},
		"ranks": 1
	},
	"bonus_ht_h": {
		"name": "Bonus HtH Attacks",
		"description": "You get one extra unarmed/melee attack per round.",
		"level_req": 6,
		"stat_reqs": {"dexterity": 6, "might": 6},
		"ranks": 1
	},
	"bonus_ranged": {
		"name": "Bonus Ranged Damage",
		"description": "You do +2 damage per rank with ranged weapons.",
		"level_req": 3,
		"stat_reqs": {"awareness": 6},
		"ranks": 3
	},
	"toughness": {
		"name": "Toughness",
		"description": "You gain +10% Damage Resistance to all types per rank.",
		"level_req": 3,
		"stat_reqs": {"vigor": 6},
		"ranks": 3
	},
	"swift_learner": {
		"name": "Swift Learner",
		"description": "You gain +5% XP per rank.",
		"level_req": 3,
		"stat_reqs": {"intellect": 5},
		"ranks": 3
	},
	"action_boy": {
		"name": "Action Boy/Girl",
		"description": "You gain +1 Action Point per rank.",
		"level_req": 3,
		"stat_reqs": {"dexterity": 5},
		"ranks": 3
	},
	"lifegiver": {
		"name": "Lifegiver",
		"description": "You gain +4 Maximum HP per rank.",
		"level_req": 3,
		"stat_reqs": {"vigor": 4},
		"ranks": 3
	},
	"educated": {
		"name": "Educated",
		"description": "You gain +2 skill points per level per rank.",
		"level_req": 3,
		"stat_reqs": {"intellect": 6},
		"ranks": 1
	},
	"more_criticals": {
		"name": "More Criticals",
		"description": "You have a +5% better chance to score a critical hit per rank.",
		"level_req": 6,
		"stat_reqs": {"fortune": 6},
		"ranks": 3
	},
	"better_criticals": {
		"name": "Better Criticals",
		"description": "Your critical hits do +20% damage per rank.",
		"level_req": 9,
		"stat_reqs": {"fortune": 6},
		"ranks": 1
	},
	"sniper": {
		"name": "Sniper",
		"description": "Aimed shots have +20% hit chance and +20% critical chance.",
		"level_req": 9,
		"stat_reqs": {"awareness": 8, "dexterity": 8},
		"ranks": 1
	},
	"slayer": {
		"name": "Slayer",
		"description": "All successful melee/unarmed attacks are critical hits.",
		"level_req": 18,
		"stat_reqs": {"might": 8, "dexterity": 8},
		"ranks": 1
	},
}

var character_data: Dictionary = {}

func _ready() -> void:
	_init_default_character()

func _init_default_character() -> void:
	character_data = {
		"name": "Vault Dweller",
		"level": 1,
		"xp": 0,
		"xp_to_next": xp_for_level(2),
		"special": {
			"might": 5,
			"awareness": 5,
			"vigor": 5,
			"presence": 5,
			"intellect": 5,
			"dexterity": 5,
			"fortune": 5
		},
		"skills": {},
		"skill_bonus": {},
		"tag_skills": ["small_guns", "speech", "lockpick"],
		"traits": [],
		"perks": [],
		"available_perks": [],
		"skill_points_per_level": 5,
		"unspent_skill_points": 0,
		"unspent_perk_points": 0,
		"hp": 100,
		"max_hp": 100,
		"ap": 10,
		"max_ap": 10,
		"radiation": 0,
		"poison": 0
	}
	
	_recalculate_all()
	_update_available_perks()

func _recalculate_all() -> void:
	_recalculate_derived_stats()
	_recalculate_skills()
	_update_available_perks()

func _recalculate_derived_stats() -> void:
	# Created characters carry trait-modified SPECIAL in `effective_special`;
	# legacy/default characters only have `special` (tests rely on this).
	var special: Dictionary = character_data.get("effective_special", character_data.special)
	var level = character_data.level
	var en = special.vigor
	var st = special.might
	var ag = special.dexterity
	var aw = special.awareness
	var lk = special.fortune
	
	# Fallout 2 Max HP: 15 + ST + EN*2 + (Lv-1)*(3+EN/2)
	# Level 1 has no HP level bonus; matches get_derived_stats() and vanilla reference.
	var hp_level_factor = max(0, level - 1)
	character_data.max_hp = 15 + st + en * 2 + hp_level_factor * (3 + int(en / 2))
	
	# Fallout 2 AP: 5 + AG/2 (round down) + trait modifiers (Bruiser: -2)
	var ap_modifier = 0
	if character_data.get("traits", []).has("bruiser"):
		ap_modifier -= 2
	character_data.max_ap = 5 + int(ag / 2) + ap_modifier
	
	# Fallout 2 derived stats
	# Healing Rate: EN/3 (round down)
	# Poison Resistance: EN * 5
	# Radiation Resistance: EN * 2 (base, +Armor applied elsewhere)
	# Sequence: PE * 2
	# Critical Chance: LK + trait/perk modifiers
	
	# Clamp current HP/AP
	character_data.hp = min(character_data.hp, character_data.max_hp)
	character_data.ap = min(character_data.ap, character_data.max_ap)

func _recalculate_skills() -> void:
	# Vanilla skillGetValue() (skill.cc:230-269) via the shared rules engine.
	# Created characters use trait-modified SPECIAL; legacy characters use base.
	var special: Dictionary = character_data.get("effective_special", character_data.get("special", {}))
	character_data.skills = CharacterCreationRules.calculate_skills(
		special,
		character_data.get("tag_skills", []),
		character_data.get("skill_bonus", {}),
		character_data.get("traits", [])
	)

func _update_available_perks() -> void:
	var available = []
	var level = character_data.level
	var special = character_data.special
	var current_perks = character_data.perks
	
	for perk_id in PERK_DEFS:
		var def = PERK_DEFS[perk_id]
		
		# Check if already maxed out
		var current_rank = 0
		for p in current_perks:
			if p.perk_id == perk_id:
				current_rank = p.rank
				break
		
		if current_rank >= def.ranks:
			continue
		
		# Check level requirement
		if level < def.level_req:
			continue
		
		# Check stat requirements
		var meets_reqs = true
		for stat in def.stat_reqs:
			if special[stat] < def.stat_reqs[stat]:
				meets_reqs = false
				break
		
		if meets_reqs:
			available.append({
				"perk_id": perk_id,
				"name": def.name,
				"description": def.description,
				"level_req": def.level_req,
				"stat_reqs": def.stat_reqs,
				"max_ranks": def.ranks,
				"current_rank": current_rank
			})
	
	character_data.available_perks = available

func add_xp(amount: int) -> void:
	var xp_bonus = 1.0
	# Check for Swift Learner perk
	for p in character_data.perks:
		if p.perk_id == "swift_learner":
			xp_bonus += p.rank * 0.05
	
	var final_amount = int(amount * xp_bonus)
	character_data.xp += final_amount
	
	var old_level = character_data.level
	character_data.level = level_from_xp(character_data.xp)
	character_data.xp_to_next = xp_for_level(character_data.level + 1) - character_data.xp
	
	xp_gained.emit(final_amount, character_data.xp)
	
	if character_data.level > old_level:
		_on_level_up(old_level, character_data.level)

func _on_level_up(old_level: int, new_level: int) -> void:
	print("Level up! ", old_level, " -> ", new_level)
	
	# HP gain on level up: 2 + VIG/2
	var hp_gain = 2 + int(character_data.special.vigor / 2)
	character_data.max_hp += hp_gain
	character_data.hp = character_data.max_hp
	
	# Skill points
	var sp = 5 + int(character_data.special.intellect / 2)
	# Educated perk
	for p in character_data.perks:
		if p.perk_id == "educated":
			sp += 2
	
	character_data.skill_points_per_level = sp
	character_data.unspent_skill_points += sp
	
	# Perk every 3 levels (3, 6, 9, 12, 15, 18)
	if new_level % 3 == 0:
		character_data.unspent_perk_points += 1
	
	_recalculate_derived_stats()
	_update_available_perks()
	
	level_up.emit(new_level, sp, character_data.unspent_perk_points > 0)

func spend_skill_point(skill_name: String) -> bool:
	if not character_data.skills.has(skill_name):
		return false
	if character_data.unspent_skill_points <= 0:
		return false
	if character_data.skills[skill_name] >= 200:
		return false
	
	var old = character_data.skills[skill_name]
	character_data.skills[skill_name] += 1
	character_data.skill_bonus[skill_name] = character_data.skill_bonus.get(skill_name, 0) + 1
	character_data.unspent_skill_points -= 1
	
	skill_changed.emit(skill_name, old, character_data.skills[skill_name])
	return true

func spend_skill_points(skill_name: String, amount: int) -> bool:
	if character_data.unspent_skill_points < amount:
		return false
	
	var new_val = character_data.skills[skill_name] + amount
	if new_val > 200:
		amount = 200 - character_data.skills[skill_name]
		if amount <= 0:
			return false
		new_val = 200
	
	var old = character_data.skills[skill_name]
	character_data.skills[skill_name] = new_val
	character_data.skill_bonus[skill_name] = character_data.skill_bonus.get(skill_name, 0) + amount
	character_data.unspent_skill_points -= amount
	
	skill_changed.emit(skill_name, old, new_val)
	return true

func acquire_perk(perk_id: String) -> bool:
	if character_data.unspent_perk_points <= 0:
		return false
	
	# Find perk in available
	var perk_info = null
	for p in character_data.available_perks:
		if p.perk_id == perk_id:
			perk_info = p
			break
	
	if not perk_info:
		return false
	
	# Check current rank
	var current_rank = 0
	for p in character_data.perks:
		if p.perk_id == perk_id:
			current_rank = p.rank
			break
	
	var def = PERK_DEFS[perk_id]
	if current_rank >= def.ranks:
		return false
	
	# Add or update perk
	var found = false
	for p in character_data.perks:
		if p.perk_id == perk_id:
			p.rank += 1
			found = true
			break
	
	if not found:
		character_data.perks.append({"perk_id": perk_id, "rank": 1})
	
	character_data.unspent_perk_points -= 1
	_update_available_perks()
	
	perk_acquired.emit(perk_id)
	return true

func improve_special(stat: String, amount: int = 1) -> bool:
	if not character_data.special.has(stat):
		return false
	if character_data.special[stat] >= 10:
		return false
	
	var old = character_data.special[stat]
	character_data.special[stat] = min(10, old + amount)
	# Keep the trait-modified view in sync so skills/derived stats use the new value.
	if character_data.has("effective_special"):
		var eff: Dictionary = character_data.effective_special
		eff[stat] = clampi(old + amount, 1, 10)
	
	_recalculate_all()
	
	stat_changed.emit(SPECIAL_NAMES[stat], old, character_data.special[stat])
	return true

## Apply a completed character-creation config (PHASE 1).
## `calculated` is the result of CharacterCreationRules.calculate(config); passing it
## in keeps the UI preview and the actual character identical.
func apply_created_character(config: Dictionary, calculated: Dictionary) -> void:
	_init_default_character()

	var base_special := {}
	var config_special: Dictionary = config.get("special", {})
	for key in CharacterCreationRules.SPECIAL_KEYS:
		base_special[key] = clampi(int(config_special.get(key, CharacterCreationRules.BASE_STAT)), CharacterCreationRules.MIN_STAT, CharacterCreationRules.MAX_STAT)

	var effective: Dictionary = calculated.get("special_effective", {})
	if effective.is_empty():
		effective = base_special.duplicate(true)

	character_data["name"] = str(config.get("name", "Vault Dweller")).strip_edges()
	character_data["gender"] = str(config.get("gender", "male"))
	character_data["age"] = int(config.get("age", 25))
	character_data["special"] = base_special
	character_data["effective_special"] = effective.duplicate(true)
	character_data["traits"] = (config.get("traits", []) as Array).duplicate()
	character_data["tag_skills"] = (config.get("tag_skills", []) as Array).duplicate()
	character_data["skill_bonus"] = (config.get("skill_bonus", {}) as Dictionary).duplicate(true)
	character_data["level"] = 1
	character_data["xp"] = 0
	character_data["xp_to_next"] = xp_for_level(2)
	character_data["perks"] = []
	character_data["unspent_skill_points"] = 0
	character_data["unspent_perk_points"] = 0

	var skills: Dictionary = calculated.get("skills", {})
	if skills.is_empty():
		skills = CharacterCreationRules.calculate_skills(
			effective,
			character_data.tag_skills,
			character_data.skill_bonus,
			character_data.traits
		)
	character_data["skills"] = skills.duplicate(true)

	var derived: Dictionary = calculated.get("derived", {})
	_recalculate_derived_stats()
	if not derived.is_empty():
		character_data["max_hp"] = int(derived.get("max_hp", character_data.max_hp))
		character_data["max_ap"] = int(derived.get("max_action_points", character_data.max_ap))
		character_data["derived"] = derived.duplicate(true)
		character_data["skill_points_per_level"] = int(derived.get("skill_points_per_level", character_data.get("skill_points_per_level", 5)))
	character_data["hp"] = character_data.max_hp
	character_data["ap"] = character_data.max_ap

	_update_available_perks()

func get_skill(skill_name: String) -> int:
	return character_data.skills.get(skill_name, 0)

func get_special(stat: String) -> int:
	return character_data.special.get(stat, 5)

func get_perk_rank(perk_id: String) -> int:
	for p in character_data.perks:
		if p.perk_id == perk_id:
			return p.rank
	return 0

func has_perk(perk_id: String) -> bool:
	return get_perk_rank(perk_id) > 0

func get_available_perks() -> Array:
	return character_data.available_perks

func get_character_sheet() -> Dictionary:
	return {
		"name": character_data.name,
		"level": character_data.level,
		"xp": character_data.xp,
		"xp_to_next": character_data.xp_to_next,
		"special": character_data.special,
		"skills": character_data.skills,
		"tag_skills": character_data.tag_skills,
		"perks": character_data.perks,
		"available_perks": character_data.available_perks,
		"unspent_skill_points": character_data.unspent_skill_points,
		"unspent_perk_points": character_data.unspent_perk_points,
		"hp": character_data.hp,
		"max_hp": character_data.max_hp,
		"ap": character_data.ap,
		"max_ap": character_data.max_ap
	}

func get_derived_stats(stats: Dictionary) -> Dictionary:
	"""Get derived stats for given SPECIAL values without modifying character data."""
	var special = stats
	var level = 1  # Default level for calculation
	var en = special.get("vigor", 5)
	var st = special.get("might", 5)
	var ag = special.get("dexterity", 5)
	var aw = special.get("awareness", 5)
	var lk = special.get("fortune", 5)
	
	# Fallout 2 Max HP: 15 + ST + EN*2 + Lv*(3+EN/2) [Lv = level-1 for HP at level]
	var hp_level_factor = max(0, level - 1)
	var max_hp = 15 + st + en * 2 + hp_level_factor * (3 + int(en / 2))
	
	# Fallout 2 AP: 5 + AG/2 (round down)
	var max_ap = 5 + int(ag / 2)
	
	# Fallout 2 derived stats
	# Healing Rate: EN/3 (round down)
	# Poison Resistance: EN * 5
	# Radiation Resistance: EN * 2 (base, +Armor applied elsewhere)
	# Sequence: PE * 2
	# Critical Chance: LK% (Fallout 2 base = Luck%)
	# Carry Weight: 25 + ST * 25
	# Melee Damage: max(1, ST - 5)
	
	return {
		"max_hp": max_hp,
		"max_action_points": max_ap,
		"healing_rate": int(en / 3),
		"poison_resistance": en * 5,
		"radiation_resistance": en * 2,
		"sequence": aw * 2,
		"critical_chance": lk,  # Fallout 2: base = Luck%
		"carry_weight": 25 + st * 25,  # Fallout 2: 25 + ST*25
		"melee_damage": max(1, st - 5)  # Fallout 2: max(1, ST-5)
	}

func get_save_data() -> Dictionary:
	"""Return a deep copy of the character state for save/load symmetry."""
	return character_data.duplicate(true)

func load_save_data(data: Dictionary) -> void:
	character_data = data
	# Do not recalculate derived stats here: saved max_hp/max_ap include level-up
	# bonuses that the plain formula would wipe out.
	
	# Ensure all required fields exist (for v1 migration compatibility)
	if not character_data.has("tag_skills"):
		character_data.tag_skills = []
	if not character_data.has("unspent_skill_points"):
		character_data.unspent_skill_points = 0
	if not character_data.has("unspent_perk_points"):
		character_data.unspent_perk_points = 0
	if not character_data.has("skill_bonus"):
		character_data.skill_bonus = {}
	if not character_data.has("perks"):
		character_data.perks = []
	if not character_data.has("available_perks"):
		character_data.available_perks = []
	if not character_data.has("skills"):
		character_data.skills = {}
	if not character_data.has("traits"):
		character_data.traits = []
	# Created characters store trait-modified SPECIAL separately; older saves and
	# default characters fall back to the base SPECIAL values.
	if not character_data.has("effective_special"):
		character_data.effective_special = (character_data.get("special", {}) as Dictionary).duplicate(true)
	_update_available_perks()