extends Node

## Thin controller attached to scenes/campaign/campaign_root.tscn.
## preload() constants avoid depending on a rebuilt global class cache.
## Wires the campaign layer together and SOFT-loads the mobile controls scene:
## another agent may still be creating it, so a hard ext_resource dependency
## would break scene parsing (test_scene_parse_integrity.gd loads every .tscn).

const MOBILE_CONTROLS_PATH := "res://scenes/ui/mobile_controls.tscn"
const CampaignLoader = preload("res://scripts/campaign/campaign_loader.gd")
const CampaignQuests = preload("res://scripts/campaign/campaign_quests.gd")
const CampaignDialogues = preload("res://scripts/campaign/campaign_dialogues.gd")

@onready var world_map: Node = get_node_or_null("WorldMap")

var loader = CampaignLoader.new()
var quests = CampaignQuests.new()
var dialogues = CampaignDialogues.new()

var last_summary: Dictionary = {}


func _ready() -> void:
	last_summary = loader.load_all()
	_try_attach_mobile_controls()

	var qm := get_node_or_null("/root/QuestManager")
	var dm := get_node_or_null("/root/DialogueManager")
	var registered_quests: int = quests.register_original_quests(last_summary.get("quests", []), qm)
	var registered_dialogues: int = dialogues.register_original_dialogues(last_summary.get("dialogues", []), dm)
	print("CampaignRoot: source='%s' available=%s quests=%d dialogues=%d" % [
		str(last_summary.get("source", "")), str(last_summary.get("available", false)),
		registered_quests, registered_dialogues,
	])

	if world_map != null and world_map.has_method("build_from_data"):
		world_map.call("build_from_data", last_summary.get("locations", []), last_summary.get("maps", []))


func _try_attach_mobile_controls() -> void:
	if not ResourceLoader.exists(MOBILE_CONTROLS_PATH):
		return
	var packed: PackedScene = load(MOBILE_CONTROLS_PATH)
	if packed == null:
		return
	var instance := packed.instantiate()
	if instance != null:
		add_child(instance)
