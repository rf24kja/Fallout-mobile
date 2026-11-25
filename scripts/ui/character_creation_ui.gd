extends Control

const CharacterCreationRules = preload("res://scripts/systems/character_creation.gd")

## PHASE 1 character creation screen.
##
## Builds the whole UI in code (so it stays valid without scene edits), keeps a
## live preview of the vanilla Fallout 2 calculations, and only lets the player
## confirm a config that passes CharacterCreationRules.validate(). The confirmed
## config is applied through GameManager.apply_character_config() and the game
## then switches to the campaign root scene.

signal character_confirmed(config: Dictionary)
signal cancelled

const MAIN_MENU_SCENE := "res://scenes/ui/main_menu.tscn"
const CAMPAIGN_SCENE := "res://scenes/campaign/campaign_root.tscn"

const STAT_LABELS := {
	"might": "Might (STR)",
	"awareness": "Awareness (PER)",
	"vigor": "Vigor (END)",
	"presence": "Presence (CHA)",
	"intellect": "Intellect (INT)",
	"dexterity": "Dexterity (AGI)",
	"fortune": "Fortune (LUCK)",
}

const SKILL_LABELS := {
	"small_guns": "Small Guns",
	"big_guns": "Big Guns",
	"energy_weapons": "Energy Weapons",
	"unarmed": "Unarmed",
	"melee": "Melee Weapons",
	"throwing": "Throwing",
	"first_aid": "First Aid",
	"doctor": "Doctor",
	"sneak": "Sneak",
	"lockpick": "Lockpick",
	"steal": "Steal",
	"traps": "Traps",
	"science": "Science",
	"repair": "Repair",
	"speech": "Speech",
	"barter": "Barter",
	"gambling": "Gambling",
	"outdoorsman": "Outdoorsman",
}

const TRAIT_ORDER := [
	"gifted", "bruiser", "small_frame", "kamikaze", "heavy_handed",
	"fast_shot", "fast_metabolism", "finesse", "good_natured", "skilled",
]

const BUTTON_MIN_SIZE := Vector2(72, 60)
const ACTION_BUTTON_MIN_SIZE := Vector2(160, 64)

var config: Dictionary = CharacterCreationRules.create_default_config()

var _safe_area_root: Control = null
var _updating: bool = false

var name_edit: LineEdit = null
var gender_option: OptionButton = null
var age_spin: SpinBox = null
var remaining_label: Label = null
var preview_label: Label = null
var error_label: Label = null
var confirm_button: Button = null
var back_button: Button = null

var stat_value_labels: Dictionary = {}
var stat_plus_buttons: Dictionary = {}
var stat_minus_buttons: Dictionary = {}
var trait_buttons: Dictionary = {}
var tag_buttons: Dictionary = {}

# ---------------------------------------------------------------- lifecycle

func _ready() -> void:
	_build_ui()
	_apply_safe_area()
	refresh()

# ------------------------------------------------------------------- build

func _build_ui() -> void:
	_safe_area_root = Control.new()
	_safe_area_root.name = "SafeArea"
	_safe_area_root.set_anchors_preset(Control.PRESET_FULL_RECT)
	_safe_area_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_safe_area_root)

	var margin := MarginContainer.new()
	margin.name = "ContentMargin"
	margin.set_anchors_preset(Control.PRESET_FULL_RECT)
	margin.add_theme_constant_override("margin_left", 24)
	margin.add_theme_constant_override("margin_right", 24)
	margin.add_theme_constant_override("margin_top", 16)
	margin.add_theme_constant_override("margin_bottom", 16)
	_safe_area_root.add_child(margin)

	var root_box := VBoxContainer.new()
	root_box.name = "RootBox"
	root_box.add_theme_constant_override("separation", 12)
	margin.add_child(root_box)

	var title := Label.new()
	title.name = "Title"
	title.text = "CHARACTER CREATION"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 28)
	root_box.add_child(title)

	var scroll := ScrollContainer.new()
	scroll.name = "Scroll"
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root_box.add_child(scroll)

	var content := VBoxContainer.new()
	content.name = "Content"
	content.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	content.add_theme_constant_override("separation", 14)
	scroll.add_child(content)

	_build_identity_section(content)
	_build_special_section(content)
	_build_trait_section(content)
	_build_tag_section(content)
	_build_preview_section(content)
	_build_footer(root_box)

func _build_identity_section(parent: VBoxContainer) -> void:
	parent.add_child(_section_title("IDENTITY"))

	var identity := GridContainer.new()
	identity.name = "Identity"
	identity.columns = 2
	identity.add_theme_constant_override("h_separation", 12)
	identity.add_theme_constant_override("v_separation", 8)
	parent.add_child(identity)

	var name_label := Label.new()
	name_label.text = "Name"
	identity.add_child(name_label)

	name_edit = LineEdit.new()
	name_edit.name = "NameEdit"
	name_edit.text = str(config.get("name", "Vault Dweller"))
	name_edit.custom_minimum_size = Vector2(0, 60)
	name_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_edit.text_changed.connect(_on_name_changed)
	identity.add_child(name_edit)

	var gender_label := Label.new()
	gender_label.text = "Gender"
	identity.add_child(gender_label)

	gender_option = OptionButton.new()
	gender_option.name = "GenderOption"
	gender_option.custom_minimum_size = Vector2(0, 60)
	gender_option.add_item("Male", 0)
	gender_option.add_item("Female", 1)
	var gender_index := CharacterCreationRules.GENDERS.find(str(config.get("gender", "male")))
	gender_option.selected = gender_index if gender_index >= 0 else 0
	gender_option.item_selected.connect(_on_gender_selected)
	identity.add_child(gender_option)

	var age_label := Label.new()
	age_label.text = "Age"
	identity.add_child(age_label)

	age_spin = SpinBox.new()
	age_spin.name = "AgeSpin"
	age_spin.min_value = CharacterCreationRules.MIN_AGE
	age_spin.max_value = CharacterCreationRules.MAX_AGE
	age_spin.step = 1
	age_spin.value = int(config.get("age", 25))
	age_spin.custom_minimum_size = Vector2(0, 60)
	age_spin.value_changed.connect(_on_age_changed)
	identity.add_child(age_spin)

func _build_special_section(parent: VBoxContainer) -> void:
	parent.add_child(_section_title("SPECIAL"))

	remaining_label = Label.new()
	remaining_label.name = "RemainingPointsLabel"
	parent.add_child(remaining_label)

	var grid := GridContainer.new()
	grid.name = "SpecialGrid"
	grid.columns = 4
	grid.add_theme_constant_override("h_separation", 10)
	grid.add_theme_constant_override("v_separation", 8)
	parent.add_child(grid)

	for stat_key in CharacterCreationRules.SPECIAL_KEYS:
		var label := Label.new()
		label.name = "Label_" + str(stat_key)
		label.text = str(STAT_LABELS.get(stat_key, stat_key))
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		grid.add_child(label)

		var value_label := Label.new()
		value_label.name = "Value_" + str(stat_key)
		value_label.text = str(CharacterCreationRules.BASE_STAT)
		value_label.custom_minimum_size = Vector2(48, 0)
		value_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		grid.add_child(value_label)
		stat_value_labels[stat_key] = value_label

		var minus := Button.new()
		minus.name = "Minus_" + str(stat_key)
		minus.text = "-"
		minus.custom_minimum_size = BUTTON_MIN_SIZE
		minus.pressed.connect(_on_stat_minus.bind(str(stat_key)))
		grid.add_child(minus)
		stat_minus_buttons[stat_key] = minus

		var plus := Button.new()
		plus.name = "Plus_" + str(stat_key)
		plus.text = "+"
		plus.custom_minimum_size = BUTTON_MIN_SIZE
		plus.pressed.connect(_on_stat_plus.bind(str(stat_key)))
		grid.add_child(plus)
		stat_plus_buttons[stat_key] = plus

func _build_trait_section(parent: VBoxContainer) -> void:
	parent.add_child(_section_title("TRAITS (optional, max %d)" % CharacterCreationRules.MAX_TRAITS))

	var grid := GridContainer.new()
	grid.name = "TraitGrid"
	grid.columns = 2
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 6)
	parent.add_child(grid)

	for trait_id in TRAIT_ORDER:
		var def: Dictionary = CharacterCreationRules.TRAIT_DEFS.get(trait_id, {})
		var check := CheckButton.new()
		check.name = "Trait_" + str(trait_id)
		check.text = str(def.get("name", trait_id))
		check.tooltip_text = str(def.get("description", ""))
		check.custom_minimum_size = Vector2(0, 60)
		check.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		check.toggled.connect(_on_trait_toggled.bind(str(trait_id)))
		grid.add_child(check)
		trait_buttons[trait_id] = check

func _build_tag_section(parent: VBoxContainer) -> void:
	parent.add_child(_section_title("TAG SKILLS (choose exactly %d)" % CharacterCreationRules.REQUIRED_TAG_SKILLS))

	var grid := GridContainer.new()
	grid.name = "TagGrid"
	grid.columns = 3
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 6)
	parent.add_child(grid)

	for skill_id in CharacterCreationRules.SKILL_IDS:
		var check := CheckButton.new()
		check.name = "Tag_" + str(skill_id)
		check.text = str(SKILL_LABELS.get(skill_id, skill_id))
		check.custom_minimum_size = Vector2(0, 60)
		check.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		check.toggled.connect(_on_tag_toggled.bind(str(skill_id)))
		grid.add_child(check)
		tag_buttons[skill_id] = check

func _build_preview_section(parent: VBoxContainer) -> void:
	parent.add_child(_section_title("PREVIEW"))

	preview_label = Label.new()
	preview_label.name = "PreviewLabel"
	preview_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	preview_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(preview_label)

	error_label = Label.new()
	error_label.name = "ErrorLabel"
	error_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	error_label.add_theme_color_override("font_color", Color(1.0, 0.35, 0.3))
	error_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	parent.add_child(error_label)

func _build_footer(parent: VBoxContainer) -> void:
	var footer := HBoxContainer.new()
	footer.name = "Footer"
	footer.add_theme_constant_override("separation", 12)
	footer.alignment = BoxContainer.ALIGNMENT_CENTER
	parent.add_child(footer)

	back_button = Button.new()
	back_button.name = "BackButton"
	back_button.text = "Back to Menu"
	back_button.custom_minimum_size = ACTION_BUTTON_MIN_SIZE
	back_button.pressed.connect(_on_back_pressed)
	footer.add_child(back_button)

	confirm_button = Button.new()
	confirm_button.name = "ConfirmButton"
	confirm_button.text = "Confirm"
	confirm_button.custom_minimum_size = ACTION_BUTTON_MIN_SIZE
	confirm_button.pressed.connect(_on_confirm_pressed)
	footer.add_child(confirm_button)

func _section_title(text: String) -> Label:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size", 20)
	return label

# -------------------------------------------------------------- safe area

func _apply_safe_area() -> void:
	var insets := _compute_safe_area_insets()
	if _safe_area_root == null:
		return
	_safe_area_root.offset_left = float(insets.position.x)
	_safe_area_root.offset_top = float(insets.position.y)
	_safe_area_root.offset_right = -float(insets.size.x)
	_safe_area_root.offset_bottom = -float(insets.size.y)

## Same logic as scripts/ui/mobile_controls.gd: returns zero insets in headless
## mode and converts physical pixels to design (1280x720) pixels otherwise.
func _compute_safe_area_insets() -> Rect2i:
	var zero := Rect2i(0, 0, 0, 0)
	if not DisplayServer.has_method("get_display_safe_area"):
		return zero
	var safe: Rect2i = DisplayServer.get_display_safe_area()
	if safe.size.x <= 0 or safe.size.y <= 0:
		return zero

	var window_size := DisplayServer.window_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		if DisplayServer.has_method("screen_get_size"):
			window_size = DisplayServer.screen_get_size()
	if window_size.x <= 0 or window_size.y <= 0:
		return zero

	var design_size := get_viewport_rect().size
	if design_size.x <= 0 or design_size.y <= 0:
		design_size = Vector2(1280, 720)
	var ratio := Vector2(design_size.x / float(window_size.x), design_size.y / float(window_size.y))

	var left := float(safe.position.x) * ratio.x
	var top := float(safe.position.y) * ratio.y
	var right := float(window_size.x - (safe.position.x + safe.size.x)) * ratio.x
	var bottom := float(window_size.y - (safe.position.y + safe.size.y)) * ratio.y

	return Rect2i(
		Vector2i(int(maxf(left, 0.0)), int(maxf(top, 0.0))),
		Vector2i(int(maxf(right, 0.0)), int(maxf(bottom, 0.0)))
	)

# ---------------------------------------------------------------- refresh

## Re-read the widgets into the config, then rebuild every derived label.
func refresh() -> void:
	if _updating:
		return
	_updating = true
	_sync_identity_from_widgets()

	for stat_key in CharacterCreationRules.SPECIAL_KEYS:
		var value := CharacterCreationRules.get_stat(config, str(stat_key))
		var value_label: Label = stat_value_labels.get(stat_key, null)
		if value_label:
			value_label.text = str(value)
		var plus: Button = stat_plus_buttons.get(stat_key, null)
		if plus:
			plus.disabled = not CharacterCreationRules.can_increase(config, str(stat_key))
		var minus: Button = stat_minus_buttons.get(stat_key, null)
		if minus:
			minus.disabled = not CharacterCreationRules.can_decrease(config, str(stat_key))

	var traits: Array = config.get("traits", [])
	for trait_id in trait_buttons:
		var check: CheckButton = trait_buttons[trait_id]
		check.button_pressed = traits.has(trait_id)

	var tags: Array = config.get("tag_skills", [])
	for skill_id in tag_buttons:
		var check: CheckButton = tag_buttons[skill_id]
		check.button_pressed = tags.has(skill_id)

	var remaining := CharacterCreationRules.remaining_points(config)
	if remaining_label:
		remaining_label.text = "Points left: %d" % remaining

	var calculated: Dictionary = CharacterCreationRules.calculate(config)
	if preview_label:
		preview_label.text = _build_preview_text(calculated)

	var validation: Dictionary = CharacterCreationRules.validate(config)
	if error_label:
		var errors: Array = validation.get("errors", [])
		error_label.text = "\n".join(errors)
	if confirm_button:
		confirm_button.disabled = not bool(validation.get("ok", false))

	_updating = false

func _build_preview_text(calculated: Dictionary) -> String:
	var effective: Dictionary = calculated.get("special_effective", {})
	var derived: Dictionary = calculated.get("derived", {})
	var skills: Dictionary = calculated.get("skills", {})

	var lines: Array = []
	lines.append("HP %d   AP %d   AC %d   Sequence %d   Crit %d%%" % [
		int(derived.get("max_hp", 0)),
		int(derived.get("max_action_points", 0)),
		int(derived.get("armor_class", 0)),
		int(derived.get("sequence", 0)),
		int(derived.get("critical_chance", 0)),
	])
	lines.append("Carry %d   Melee %d   Healing %d   Rad %d%%   Poison %d%%   SP/level %d" % [
		int(derived.get("carry_weight", 0)),
		int(derived.get("melee_damage", 0)),
		int(derived.get("healing_rate", 0)),
		int(derived.get("radiation_resistance", 0)),
		int(derived.get("poison_resistance", 0)),
		int(derived.get("skill_points_per_level", 0)),
	])

	var stat_parts: Array = []
	for stat_key in CharacterCreationRules.SPECIAL_KEYS:
		stat_parts.append("%s %d" % [str(STAT_LABELS.get(stat_key, stat_key)), int(effective.get(stat_key, 0))])
	lines.append(", ".join(stat_parts))

	var skill_parts: Array = []
	for skill_id in CharacterCreationRules.SKILL_IDS:
		skill_parts.append("%s %d" % [str(SKILL_LABELS.get(skill_id, skill_id)), int(skills.get(skill_id, 0))])
	lines.append(", ".join(skill_parts))
	return "\n".join(lines)

# ---------------------------------------------------------------- handlers

func _sync_identity_from_widgets() -> void:
	if name_edit:
		config["name"] = name_edit.text.strip_edges()
	if gender_option and gender_option.selected >= 0 and gender_option.selected < CharacterCreationRules.GENDERS.size():
		config["gender"] = CharacterCreationRules.GENDERS[gender_option.selected]
	if age_spin:
		config["age"] = int(age_spin.value)

func _on_name_changed(_new_text: String) -> void:
	refresh()

func _on_gender_selected(_index: int) -> void:
	refresh()

func _on_age_changed(_value: float) -> void:
	refresh()

func _on_stat_plus(stat_key: String) -> void:
	CharacterCreationRules.increase(config, stat_key)
	refresh()

func _on_stat_minus(stat_key: String) -> void:
	CharacterCreationRules.decrease(config, stat_key)
	refresh()

func _on_trait_toggled(pressed: bool, trait_id: String) -> void:
	if _updating:
		return
	var traits: Array = config.get("traits", [])
	if pressed and not traits.has(trait_id):
		if not CharacterCreationRules.toggle_trait(config, trait_id):
			refresh()
			return
	elif not pressed and traits.has(trait_id):
		CharacterCreationRules.toggle_trait(config, trait_id)
	refresh()

func _on_tag_toggled(pressed: bool, skill_id: String) -> void:
	if _updating:
		return
	var tags: Array = config.get("tag_skills", [])
	if pressed and not tags.has(skill_id):
		if not CharacterCreationRules.toggle_tag_skill(config, skill_id):
			refresh()
			return
	elif not pressed and tags.has(skill_id):
		CharacterCreationRules.toggle_tag_skill(config, skill_id)
	refresh()

func _on_confirm_pressed() -> void:
	_sync_identity_from_widgets()
	var validation: Dictionary = CharacterCreationRules.validate(config)
	if not bool(validation.get("ok", false)):
		if error_label:
			error_label.text = "\n".join(validation.get("errors", []))
		return

	var game_manager := get_node_or_null("/root/GameManager")
	if game_manager and game_manager.has_method("apply_character_config"):
		if not bool(game_manager.apply_character_config(config)):
			if error_label:
				error_label.text = "The character configuration was rejected."
			return

	character_confirmed.emit(config)
	var event_bus := get_node_or_null("/root/EventBus")
	if event_bus:
		event_bus.emit("scene_change_requested", [CAMPAIGN_SCENE])

func _on_back_pressed() -> void:
	cancelled.emit()
	var event_bus := get_node_or_null("/root/EventBus")
	if event_bus:
		event_bus.emit("scene_change_requested", [MAIN_MENU_SCENE])

# ---------------------------------------------------------------- helpers

## Replace the working config (used by tests and by a future "continue" flow).
func set_config(new_config: Dictionary) -> void:
	config = new_config
	# Suppress widget-signal refreshes while the widgets are being populated so
	# they cannot overwrite the config with stale values.
	_updating = true
	if name_edit:
		name_edit.text = str(config.get("name", ""))
	if gender_option:
		var gender_index := CharacterCreationRules.GENDERS.find(str(config.get("gender", "male")))
		gender_option.selected = gender_index if gender_index >= 0 else 0
	if age_spin:
		age_spin.value = int(config.get("age", 25))
	_updating = false
	refresh()

func get_config() -> Dictionary:
	return config

func is_confirm_enabled() -> bool:
	return confirm_button != null and not confirm_button.disabled
