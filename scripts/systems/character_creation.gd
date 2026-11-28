class_name CharacterCreation
extends RefCounted

## Fallout 2 character creation (PHASE 1) — pure static rules engine.
##
## All numbers below are taken from the verified fallout2-ce sources:
##   - character_editor.cc:1892-1909, 3742-3759, 6741-6752 — SPECIAL base 5,
##     5 free points, min 1 / max 10.
##   - stat.cc:43-49 — stat clamping.
##   - trait_defs.h:7 — at most 2 traits.
##   - skill_defs.h:6-9 — exactly 3 tagged skills.
##   - skill.cc:78-97 — skill default values / stat modifiers.
##   - skill.cc:230-269 — skillGetValue().
##   - trait.cc:180-279 (trait stat effects), trait.cc:284-312 (trait skill effects).
##   - character_editor.cc:5681-5701 — skill points per level.
##
## The project keeps its original-IP SPECIAL key names (might/awareness/vigor/
## presence/intellect/dexterity/fortune) mapped onto STR/PER/END/CHA/INT/AGI/LUCK.

const SPECIAL_KEYS := [
	"might",       # STR
	"awareness",   # PER
	"vigor",       # END
	"presence",    # CHA
	"intellect",   # INT
	"dexterity",   # AGI
	"fortune",     # LUCK
]

const BASE_STAT := 5
const ALLOC_POINTS := 5
const MIN_STAT := 1
const MAX_STAT := 10
const MAX_TRAITS := 2
const REQUIRED_TAG_SKILLS := 3

## Total SPECIAL budget at creation: 7 stats * 5 base + 5 points to allocate.
const TOTAL_STAT_BUDGET := 40  # BASE_STAT * 7 + ALLOC_POINTS

const MAX_NAME_LENGTH := 24
const MIN_AGE := 1
const MAX_AGE := 999

## skill.cc:78-97. stat2 == "" means the skill depends on a single stat.
## baseValueMult is 1 for every Fallout 2 skill (invested points count 1x,
## and 2x for tagged skills — see skill.cc:230-269).
const SKILL_TABLE := {
	"small_guns": {"default_value": 5, "stat_modifier": 4, "stat1": "dexterity", "stat2": ""},
	"big_guns": {"default_value": 0, "stat_modifier": 2, "stat1": "dexterity", "stat2": ""},
	"energy_weapons": {"default_value": 0, "stat_modifier": 2, "stat1": "dexterity", "stat2": ""},
	"unarmed": {"default_value": 30, "stat_modifier": 2, "stat1": "dexterity", "stat2": "might"},
	"melee": {"default_value": 20, "stat_modifier": 2, "stat1": "dexterity", "stat2": "might"},
	"throwing": {"default_value": 0, "stat_modifier": 4, "stat1": "dexterity", "stat2": ""},
	"first_aid": {"default_value": 0, "stat_modifier": 2, "stat1": "awareness", "stat2": "intellect"},
	"doctor": {"default_value": 5, "stat_modifier": 1, "stat1": "awareness", "stat2": "intellect"},
	"sneak": {"default_value": 10, "stat_modifier": 1, "stat1": "awareness", "stat2": "dexterity"},
	"lockpick": {"default_value": 10, "stat_modifier": 1, "stat1": "awareness", "stat2": "dexterity"},
	"steal": {"default_value": 5, "stat_modifier": 3, "stat1": "dexterity", "stat2": ""},
	"traps": {"default_value": 0, "stat_modifier": 3, "stat1": "dexterity", "stat2": ""},
	"science": {"default_value": 0, "stat_modifier": 3, "stat1": "intellect", "stat2": ""},
	"repair": {"default_value": 0, "stat_modifier": 4, "stat1": "intellect", "stat2": ""},
	"speech": {"default_value": 0, "stat_modifier": 5, "stat1": "presence", "stat2": ""},
	"barter": {"default_value": 0, "stat_modifier": 4, "stat1": "presence", "stat2": ""},
	"gambling": {"default_value": 0, "stat_modifier": 5, "stat1": "fortune", "stat2": ""},
	"outdoorsman": {"default_value": 0, "stat_modifier": 2, "stat1": "vigor", "stat2": "intellect"},
}

const SKILL_IDS := [
	"small_guns", "big_guns", "energy_weapons", "unarmed", "melee", "throwing",
	"first_aid", "doctor", "sneak", "lockpick", "steal", "traps",
	"science", "repair", "speech", "barter", "gambling", "outdoorsman",
]

const COMBAT_SKILLS := ["small_guns", "big_guns", "energy_weapons", "unarmed", "melee", "throwing"]
const NON_COMBAT_HEALING_SKILLS := ["first_aid", "doctor"]
const NON_COMBAT_SOCIAL_SKILLS := ["speech", "barter"]

## All 16 vanilla Fallout 2 traits (trait.cc:180-312, trait_defs.h:7).
## Every entry carries only effects that are verified in the fallout2-ce sources:
##   - stat / AP / sequence / carry / melee / crit modifiers — trait.cc:180-279
##   - One Hander to-hit — combat.cc:4404-4410
##   - Jinxed failure roll — combat.cc:3856-3862
##   - chem addiction / duration multipliers — trait.cc:180-279
## Bloody Mess is visual only (actions.cc:208-235) and Sex Appeal's reaction
## effect is NOT confirmed by the available sources — both are exposed as flags
## with no invented numeric coefficients.
const TRAIT_DEFS := {
	"gifted": {
		"name": "Gifted",
		"description": "All SPECIAL +1. All skills -10.",
		"special_mods": {"might": 1, "awareness": 1, "vigor": 1, "presence": 1, "intellect": 1, "dexterity": 1, "fortune": 1},
	},
	"bruiser": {
		"name": "Bruiser",
		"description": "Might +2, Action Points -2.",
		"special_mods": {"might": 2},
		"ap_modifier": -2,
	},
	"small_frame": {
		"name": "Small Frame",
		"description": "Dexterity +1, carry weight reduced by 10 per point of Might.",
		"special_mods": {"dexterity": 1},
		"carry_weight_per_might": -10,
	},
	"kamikaze": {
		"name": "Kamikaze",
		"description": "Sequence +5, armor class is always 0.",
		"sequence_modifier": 5,
		"armor_class_zeroed": true,
	},
	"heavy_handed": {
		"name": "Heavy Handed",
		"description": "Bonus melee damage +4, critical hit roll -30.",
		"melee_damage_modifier": 4,
		"critical_roll_modifier": -30,
	},
	"fast_shot": {
		"name": "Fast Shot",
		"description": "Ranged attacks costing more than 2 AP cost 1 AP less. Aimed shots are unavailable.",
		"ranged_ap_modifier": -1,
		"no_aimed_shots": true,
	},
	"fast_metabolism": {
		"name": "Fast Metabolism",
		"description": "Healing rate +2, radiation and poison resistance are 0.",
		"healing_rate_modifier": 2,
		"zero_poison_resistance": true,
		"zero_radiation_resistance": true,
	},
	"finesse": {
		"name": "Finesse",
		"description": "Critical chance +10.",
		"critical_chance_modifier": 10,
	},
	"good_natured": {
		"name": "Good Natured",
		"description": "Combat skills -10; First Aid, Doctor, Speech and Barter +15.",
	},
	"skilled": {
		"name": "Skilled",
		"description": "Skill points per level +5.",
		"skill_points_modifier": 5,
	},
	"one_handed": {
		"name": "One Hander",
		"description": "Two-handed weapons: -40 to hit. One-handed weapons: +20 to hit.",
		"two_handed_tohit_modifier": -40,
		"one_handed_tohit_modifier": 20,
	},
	"jinxed": {
		"name": "Jinxed",
		"description": "Misses by anyone near you have a 50% chance to become critical failures.",
		"jinxed": true,
	},
	"chem_reliant": {
		"name": "Chem Reliant",
		"description": "Addiction chance is doubled, withdrawal lasts half as long.",
		"addiction_chance_multiplier": 2.0,
		"withdrawal_duration_multiplier": 0.5,
	},
	"chem_resistant": {
		"name": "Chem Resistant",
		"description": "Addiction chance is halved, drug effects last half as long.",
		"addiction_chance_multiplier": 0.5,
		"drug_duration_multiplier": 0.5,
	},
	"bloody_mess": {
		"name": "Bloody Mess",
		"description": "Deaths are far gorier. Visual effect only — the vanilla sources give no numeric bonus.",
		"bloody_mess_visual": true,
	},
	"sex_appeal": {
		"name": "Sex Appeal",
		"description": "Reaction bonus with the opposite sex is not confirmed by the available vanilla sources; no numeric bonus is applied.",
		"sex_appeal_unverified": true,
	},
}

const GENDERS := ["male", "female"]

# ---------------------------------------------------------------- constructors

static func create_default_config(character_name: String = "Vault Dweller") -> Dictionary:
	var special := {}
	for key in SPECIAL_KEYS:
		special[key] = BASE_STAT
	return {
		"name": character_name,
		"gender": "male",
		"age": 25,
		"special": special,
		"remaining_points": ALLOC_POINTS,
		"traits": [],
		"tag_skills": [],
		"skill_bonus": {},
	}

# ------------------------------------------------------------- point allocation

static func used_points(config: Dictionary) -> int:
	return sum_special(config) - BASE_STAT * SPECIAL_KEYS.size()

static func sum_special(config: Dictionary) -> int:
	var special: Dictionary = config.get("special", {})
	var total := 0
	for key in SPECIAL_KEYS:
		total += int(special.get(key, BASE_STAT))
	return total

## Remaining allocatable points are always derived from the total budget so the
## counter can never drift from the actual SPECIAL values.
static func remaining_points(config: Dictionary) -> int:
	return TOTAL_STAT_BUDGET - sum_special(config)

static func get_stat(config: Dictionary, stat: String) -> int:
	return int(config.get("special", {}).get(stat, BASE_STAT))

static func can_increase(config: Dictionary, stat: String) -> bool:
	if not SPECIAL_KEYS.has(stat):
		return false
	if get_stat(config, stat) >= MAX_STAT:
		return false
	return remaining_points(config) > 0

static func can_decrease(config: Dictionary, stat: String) -> bool:
	if not SPECIAL_KEYS.has(stat):
		return false
	return get_stat(config, stat) > MIN_STAT

static func increase(config: Dictionary, stat: String) -> bool:
	if not can_increase(config, stat):
		return false
	var special: Dictionary = config.get("special", {})
	special[stat] = get_stat(config, stat) + 1
	config["special"] = special
	config["remaining_points"] = remaining_points(config)
	return true

static func decrease(config: Dictionary, stat: String) -> bool:
	if not can_decrease(config, stat):
		return false
	var special: Dictionary = config.get("special", {})
	special[stat] = get_stat(config, stat) - 1
	config["special"] = special
	config["remaining_points"] = remaining_points(config)
	return true

# -------------------------------------------------------------------- traits

static func toggle_trait(config: Dictionary, trait_id: String) -> bool:
	if not TRAIT_DEFS.has(trait_id):
		return false
	var traits: Array = config.get("traits", [])
	if traits.has(trait_id):
		traits.erase(trait_id)
		config["traits"] = traits
		return true
	if traits.size() >= MAX_TRAITS:
		return false
	traits.append(trait_id)
	config["traits"] = traits
	return true

# --------------------------------------------------------------- tag skills

static func toggle_tag_skill(config: Dictionary, skill_id: String) -> bool:
	if not SKILL_TABLE.has(skill_id):
		return false
	var tags: Array = config.get("tag_skills", [])
	if tags.has(skill_id):
		tags.erase(skill_id)
		config["tag_skills"] = tags
		return true
	if tags.size() >= REQUIRED_TAG_SKILLS:
		return false
	tags.append(skill_id)
	config["tag_skills"] = tags
	return true

# -------------------------------------------------------------- validation

static func validate(config: Dictionary) -> Dictionary:
	var errors: Array = []
	var name := str(config.get("name", "")).strip_edges()
	if name.is_empty():
		errors.append("Character name is required.")
	elif name.length() > MAX_NAME_LENGTH:
		errors.append("Character name is longer than %d characters." % MAX_NAME_LENGTH)

	if not GENDERS.has(str(config.get("gender", ""))):
		errors.append("Gender must be one of: %s." % ", ".join(GENDERS))

	var age := int(config.get("age", 0))
	if age < MIN_AGE or age > MAX_AGE:
		errors.append("Age must be between %d and %d." % [MIN_AGE, MAX_AGE])

	var special: Dictionary = config.get("special", {})
	for key in SPECIAL_KEYS:
		if not special.has(key):
			errors.append("SPECIAL stat '%s' is missing." % key)
			continue
		var value := int(special[key])
		if value < MIN_STAT or value > MAX_STAT:
			errors.append("%s must be between %d and %d." % [key, MIN_STAT, MAX_STAT])

	var remaining := remaining_points(config)
	if remaining > 0:
		errors.append("%d SPECIAL point(s) left to allocate." % remaining)
	elif remaining < 0:
		errors.append("SPECIAL allocation exceeds the budget by %d point(s)." % -remaining)

	var traits: Array = config.get("traits", [])
	if traits.size() > MAX_TRAITS:
		errors.append("At most %d traits are allowed." % MAX_TRAITS)
	var seen_traits := {}
	for trait_id in traits:
		var tid := str(trait_id)
		if not TRAIT_DEFS.has(tid):
			errors.append("Unknown trait '%s'." % tid)
		elif seen_traits.has(tid):
			errors.append("Trait '%s' selected twice." % tid)
		else:
			seen_traits[tid] = true

	var tags: Array = config.get("tag_skills", [])
	if tags.size() != REQUIRED_TAG_SKILLS:
		errors.append("Exactly %d tag skills are required (selected %d)." % [REQUIRED_TAG_SKILLS, tags.size()])
	var seen_tags := {}
	for skill_id in tags:
		var sid := str(skill_id)
		if not SKILL_TABLE.has(sid):
			errors.append("Unknown tag skill '%s'." % sid)
		elif seen_tags.has(sid):
			errors.append("Tag skill '%s' selected twice." % sid)
		else:
			seen_tags[sid] = true

	return {"ok": errors.is_empty(), "errors": errors}

# ------------------------------------------------------------- calculations

## Effective SPECIAL after trait stat modifiers (clamped to 1..10, stat.cc:43-49).
static func effective_special(config: Dictionary) -> Dictionary:
	var result := {}
	for key in SPECIAL_KEYS:
		result[key] = get_stat(config, key)
	var traits: Array = config.get("traits", [])
	for trait_id in traits:
		var def: Dictionary = TRAIT_DEFS.get(str(trait_id), {})
		var mods: Dictionary = def.get("special_mods", {})
		for key in mods:
			if result.has(key):
				result[key] = int(result[key]) + int(mods[key])
	for key in SPECIAL_KEYS:
		result[key] = clampi(int(result[key]), MIN_STAT, MAX_STAT)
	return result

static func trait_skill_modifier(skill_id: String, traits: Array) -> int:
	var modifier := 0
	for trait_id in traits:
		match str(trait_id):
			"gifted":
				modifier -= 10
			"good_natured":
				if COMBAT_SKILLS.has(skill_id):
					modifier -= 10
				elif NON_COMBAT_HEALING_SKILLS.has(skill_id) or NON_COMBAT_SOCIAL_SKILLS.has(skill_id):
					modifier += 15
	return modifier

## skill.cc:230-269 — skillGetValue():
##   value = default + statModifier * (stat1 + stat2) + invested
##   if tagged: value += invested + 20
##   value += trait modifiers
##   value clamped to 0..300
static func calculate_skills(special: Dictionary, tag_skills: Array, skill_bonus: Dictionary, traits: Array) -> Dictionary:
	var skills := {}
	for skill_id in SKILL_IDS:
		var def: Dictionary = SKILL_TABLE[skill_id]
		var stat1 := str(def.get("stat1", ""))
		var stat2 := str(def.get("stat2", ""))
		var stat_sum := int(special.get(stat1, BASE_STAT))
		if not stat2.is_empty():
			stat_sum += int(special.get(stat2, BASE_STAT))
		var invested := int(skill_bonus.get(skill_id, 0))
		var value := int(def.get("default_value", 0)) + int(def.get("stat_modifier", 0)) * stat_sum + invested
		if tag_skills.has(skill_id):
			value += invested + 20
		value += trait_skill_modifier(skill_id, traits)
		skills[skill_id] = clampi(value, 0, 300)
	return skills

## Skill points per level: character_editor.cc:5681-5701.
## 5 + 2*INT + Educated*2 + Skilled*5 - Gifted*5, clamped to 0..99.
static func skill_points_per_level(effective: Dictionary, perks: Array, traits: Array) -> int:
	var intellect := int(effective.get("intellect", BASE_STAT))
	var educated := 0
	# CharacterSystem stores perks as Dictionaries with a "perk_id" key
	# (see character_system.gd::get_perk_rank()), tests pass plain strings.
	for perk_entry in perks:
		var pid := str(perk_entry)
		if perk_entry is Dictionary:
			pid = str((perk_entry as Dictionary).get("perk_id", ""))
		if pid == "educated":
			educated += 1
	var gifted := 1 if traits.has("gifted") else 0
	var skilled := 1 if traits.has("skilled") else 0
	var sp := 5 + 2 * intellect + educated * 2 + skilled * 5 - gifted * 5
	return clampi(sp, 0, 99)

## stat.cc:554-578 — derived stats, plus the trait modifiers of trait.cc:180-279.
## `special` must already contain the trait SPECIAL modifiers (effective_special);
## `base_special` is the pre-trait allocation and is only used where vanilla
## subtracts the BASE stat (Small Frame carry weight, Kamikaze armor class).
static func derive_stats(special: Dictionary, traits: Array, level: int = 1, base_special: Dictionary = {}) -> Dictionary:
	if base_special.is_empty():
		base_special = special

	var st := int(special.get("might", BASE_STAT))
	var en := int(special.get("vigor", BASE_STAT))
	var ag := int(special.get("dexterity", BASE_STAT))
	var aw := int(special.get("awareness", BASE_STAT))
	var lk := int(special.get("fortune", BASE_STAT))
	var base_st := int(base_special.get("might", st))
	var base_ag := int(base_special.get("dexterity", ag))

	var ap_modifier := 0
	var sequence_modifier := 0
	var healing_rate_modifier := 0
	var zero_poison := false
	var zero_radiation := false
	var carry_weight_per_might := 0
	var melee_damage_modifier := 0
	var critical_roll_modifier := 0
	var critical_chance_modifier := 0
	var ranged_ap_modifier := 0
	var no_aimed_shots := false
	var armor_class_zeroed := false
	var two_handed_tohit_modifier := 0
	var one_handed_tohit_modifier := 0
	var jinxed := false
	var addiction_chance_multiplier := 1.0
	var withdrawal_duration_multiplier := 1.0
	var drug_duration_multiplier := 1.0
	var bloody_mess_visual := false
	var sex_appeal_unverified := false

	# Trait effects are additive (verified in trait.cc:180-279). Only the
	# projectile AP reduction of Fast Shot is conditional at combat time, so the
	# modifier is exposed to the combat system instead of being baked in here.
	for trait_id in traits:
		var tdef: Dictionary = TRAIT_DEFS.get(str(trait_id), {})
		ap_modifier += int(tdef.get("ap_modifier", 0))
		sequence_modifier += int(tdef.get("sequence_modifier", 0))
		healing_rate_modifier += int(tdef.get("healing_rate_modifier", 0))
		carry_weight_per_might += int(tdef.get("carry_weight_per_might", 0))
		melee_damage_modifier += int(tdef.get("melee_damage_modifier", 0))
		critical_roll_modifier += int(tdef.get("critical_roll_modifier", 0))
		critical_chance_modifier += int(tdef.get("critical_chance_modifier", 0))
		ranged_ap_modifier += int(tdef.get("ranged_ap_modifier", 0))
		two_handed_tohit_modifier += int(tdef.get("two_handed_tohit_modifier", 0))
		one_handed_tohit_modifier += int(tdef.get("one_handed_tohit_modifier", 0))
		addiction_chance_multiplier *= float(tdef.get("addiction_chance_multiplier", 1.0))
		withdrawal_duration_multiplier *= float(tdef.get("withdrawal_duration_multiplier", 1.0))
		drug_duration_multiplier *= float(tdef.get("drug_duration_multiplier", 1.0))
		if bool(tdef.get("zero_poison_resistance", false)):
			zero_poison = true
		if bool(tdef.get("zero_radiation_resistance", false)):
			zero_radiation = true
		if bool(tdef.get("no_aimed_shots", false)):
			no_aimed_shots = true
		if bool(tdef.get("armor_class_zeroed", false)):
			armor_class_zeroed = true
		if bool(tdef.get("jinxed", false)):
			jinxed = true
		if bool(tdef.get("bloody_mess_visual", false)):
			bloody_mess_visual = true
		if bool(tdef.get("sex_appeal_unverified", false)):
			sex_appeal_unverified = true

	# stat.cc:554-578 — HP/level is 2 + EN/2 (Lifegiver adds 4 per rank at level-up).
	var hp_per_level: int = 2 + int(en / 2)

	var derived := {
		# HP = 15 + ST + 2*EN, plus (level-1) * (2 + EN/2)
		"max_hp": 15 + st + en * 2 + max(0, level - 1) * hp_per_level,
		"hp_per_level": hp_per_level,
		# AP = 5 + AG/2, plus trait modifiers (Bruiser -2)
		"max_action_points": 5 + int(ag / 2) + ap_modifier,
		# Healing = max(EN/3, 1) (+ Fast Metabolism 2)
		"healing_rate": max(1, int(en / 3)) + healing_rate_modifier,
		"poison_resistance": 0 if zero_poison else en * 5,
		"radiation_resistance": 0 if zero_radiation else en * 2,
		# Sequence = 2*PE (+ Kamikaze 5)
		"sequence": aw * 2 + sequence_modifier,
		# Critical chance = LK (+ Finesse 10)
		"critical_chance": lk + critical_chance_modifier,
		# Carry = 25 + ST*25; Small Frame subtracts 10 * BASE Might.
		"carry_weight": 25 + base_st * 25 + carry_weight_per_might * base_st,
		# Melee = max(ST-5, 1) (+ Heavy Handed 4)
		"melee_damage": max(1, st - 5) + melee_damage_modifier,
		# Armor class = AG. Kamikaze removes only the base AGI contribution, it
		# does not zero the other derived stats (trait.cc:180-279).
		"armor_class": ag - (base_ag if armor_class_zeroed else 0),
		"armor_class_zeroed": armor_class_zeroed,
		"critical_roll_modifier": critical_roll_modifier,
		"critical_chance_modifier": critical_chance_modifier,
		"ranged_ap_modifier": ranged_ap_modifier,
		"ranged_ap_threshold": 2,
		"aimed_shots_allowed": not no_aimed_shots,
		"two_handed_tohit_modifier": two_handed_tohit_modifier,
		"one_handed_tohit_modifier": one_handed_tohit_modifier,
		"jinxed": jinxed,
		"addiction_chance_multiplier": addiction_chance_multiplier,
		"withdrawal_duration_multiplier": withdrawal_duration_multiplier,
		"drug_duration_multiplier": drug_duration_multiplier,
		"bloody_mess_visual": bloody_mess_visual,
		"sex_appeal_unverified": sex_appeal_unverified,
		"skill_points_per_level": 0,
	}
	return derived

static func calculate(config: Dictionary) -> Dictionary:
	var effective := effective_special(config)
	var traits: Array = config.get("traits", [])
	var tags: Array = config.get("tag_skills", [])
	var skill_bonus: Dictionary = config.get("skill_bonus", {})
	var skills := calculate_skills(effective, tags, skill_bonus, traits)

	var derived := derive_stats(effective, traits, 1, config.get("special", {}))
	derived["skill_points_per_level"] = skill_points_per_level(effective, [], traits)

	return {
		"special_effective": effective,
		"skills": skills,
		"derived": derived,
	}
