class_name CharacterSystem
extends Node

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

# Skill definitions with base SPECIAL dependency
static var SKILL_DEFS = {
	"small_guns": {"base_stat": "dexterity", "base_value": 5, "tag_bonus": 20},
	"big_guns": {"base_stat": "dexterity", "base_value": 0, "tag_bonus": 10},
	"energy_weapons": {"base_stat": "awareness", "base_value": 0, "tag_bonus": 10},
	"unarmed": {"base_stat": "dexterity", "base_value": 15, "tag_bonus": 20},
	"melee": {"base_stat": "might", "base_value": 10, "tag_bonus": 20},
	"throwing": {"base_stat": "dexterity", "base_value": 4, "tag_bonus": 10},
	"first_aid": {"base_stat": "awareness", "base_value": 10, "tag_bonus": 20},
	"doctor": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 10},
	"sneak": {"base_stat": "dexterity", "base_value": 5, "tag_bonus": 15},
	"lockpick": {"base_stat": "awareness", "base_value": 10, "tag_bonus": 15},
	"steal": {"base_stat": "dexterity", "base_value": 0, "tag_bonus": 10},
	"traps": {"base_stat": "intellect", "base_value": 10, "tag_bonus": 10},
	"science": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 15},
	"repair": {"base_stat": "intellect", "base_value": 0, "tag_bonus": 10},
	"speech": {"base_stat": "presence", "base_value": 10, "tag_bonus": 15},
	"barter": {"base_stat": "presence", "base_value": 10, "tag_bonus": 10},
	"gambling": {"base_stat": "fortune", "base_value": 10, "tag_bonus": 10},
	"outdoorsman": {"base_stat": "vigor", "base_value": 0, "tag_bonus": 10},
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
	var special = character_data.special
	var level = character_data.level
	var en = special.vigor
	var st = special.might
	var ag = special.dexterity
	var aw = special.awareness
	var lk = special.fortune
	
	# Fallout 2 Max HP: 15 + ST + EN*2 + Lv*(3+EN/2)
	character_data.max_hp = 15 + st + en * 2 + level * (3 + int(en / 2))
	
	# Fallout 2 AP: 5 + AG/2 (round down)
	character_data.max_ap = 5 + int(ag / 2)
	
	# Fallout 2 derived stats
	# Healing Rate: EN/3 (round down)
	# Poison Resistance: EN * 5
	# Radiation Resistance: EN * 2 (base, +Armor applied elsewhere)
	# Sequence: PE * 2
	# Critical Chance: LK/2 + Perks
	
	# Clamp current HP/AP
	character_data.hp = min(character_data.hp, character_data.max_hp)
	character_data.ap = min(character_data.ap, character_data.max_ap)

func _recalculate_skills() -> void:
	var special = character_data.special
	var tag_skills = character_data.tag_skills
	var skill_bonus = character_data.get("skill_bonus", {})
	
	for skill_name in SKILL_DEFS:
		var def = SKILL_DEFS[skill_name]
		var base_stat = def.base_stat
		var base_value = def.base_value
		var tag_bonus = def.tag_bonus
		
		var skill_value = base_value + special[base_stat] * 2
		if skill_name in tag_skills:
			skill_value += tag_bonus
		# Invested skill points are stored separately so recalculation never wipes them
		skill_value += skill_bonus.get(skill_name, 0)
		
		character_data.skills[skill_name] = skill_value

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
	
	_recalculate_all()
	
	stat_changed.emit(SPECIAL_NAMES[stat], old, character_data.special[stat])
	return true

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
	
	# Fallout 2 Max HP: 15 + ST + EN*2 + Lv*(3+EN/2)
	var max_hp = 15 + st + en * 2 + level * (3 + int(en / 2))
	
	# Fallout 2 AP: 5 + AG/2 (round down)
	var max_ap = 5 + int(ag / 2)
	
	# Fallout 2 derived stats
	# Healing Rate: EN/3 (round down)
	# Poison Resistance: EN * 5
	# Radiation Resistance: EN * 2 (base, +Armor applied elsewhere)
	# Sequence: PE * 2
	# Critical Chance: LK/2
	# Carry Weight: 25 * ST
	# Melee Damage: ST/2 (round down)
	
	return {
		"max_hp": max_hp,
		"max_action_points": max_ap,
		"healing_rate": int(en / 3),
		"poison_resistance": en * 5,
		"radiation_resistance": en * 2,
		"sequence": aw * 2,
		"critical_chance": int(lk / 2),
		"carry_weight": st * 25,
		"melee_damage": int(st / 2)
	}

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
	_update_available_perks()