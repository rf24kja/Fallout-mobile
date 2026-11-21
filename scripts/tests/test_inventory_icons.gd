extends SceneTree

## Integration test: RADZONE item icons wired into the live inventory data.
##
## Verifies that every item whose icon_path points at a real RADZONE PNG:
##   - resolves through ItemDatabase (the same path inventory_ui.gd uses)
##   - loads as a Texture2D with non-zero dimensions
##   - carries real alpha (transparent background, not an opaque crop)
## Also verifies each integrated icon is used by exactly one item
## ("one object, one ID") and reports how many items still fall back to
## the procedural placeholder in inventory_ui.gd.

const MAPPED := {
	"combat_knife": "res://art/production/painterly_v3/items/combat_knife.png",
	"combat_shotgun": "res://art/production/painterly_v3/items/combat_shotgun.png",
	"hunting_rifle": "res://art/production/painterly_v3/items/hunting_rifle.png",
	"gas_mask": "res://art/production/painterly_v3/items/gas_mask.png",
	"lockpick_set": "res://art/production/painterly_v3/items/lockpick_set.png",
	"laser_pistol": "res://art/production/painterly_v4/wave01/objects/weapons/laser_pistol.png",
	"pump_shotgun": "res://art/production/painterly_v4/wave01/objects/weapons/pump_shotgun.png",
}

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	await process_frame
	var db = ItemDatabase.new()
	db._ready()

	var ok := true
	var seen := {}

	for item_id in MAPPED:
		var def = db.get_item(item_id)
		if def == null:
			print("FAIL: ", item_id, " not found in ItemDatabase")
			ok = false
			continue
		if def.icon_path != MAPPED[item_id]:
			print("FAIL: ", item_id, " icon_path=", def.icon_path, " expected ", MAPPED[item_id])
			ok = false
			continue
		if not ResourceLoader.exists(def.icon_path):
			print("FAIL: ", item_id, " icon resource missing: ", def.icon_path)
			ok = false
			continue
		var tex = load(def.icon_path)
		if not (tex is Texture2D):
			print("FAIL: ", item_id, " icon is not a Texture2D: ", def.icon_path)
			ok = false
			continue
		if tex.get_width() <= 0 or tex.get_height() <= 0:
			print("FAIL: ", item_id, " icon has zero dimensions")
			ok = false
			continue
		var img = tex.get_image()
		if img != null and img.detect_alpha() == Image.ALPHA_NONE:
			print("FAIL: ", item_id, " icon has no alpha channel: ", def.icon_path)
			ok = false
			continue
		if seen.has(def.icon_path):
			print("FAIL: icon reused by ", seen[def.icon_path], " and ", item_id, ": ", def.icon_path)
			ok = false
			continue
		seen[def.icon_path] = item_id
		print("PASS: ", item_id, " -> ", def.icon_path, " (", tex.get_width(), "x", tex.get_height(), ")")

	var total := 0
	var with_icon := 0
	var broken := []
	for item in db.get_all_items():
		total += 1
		var p: String = item.icon_path
		if p != "" and ResourceLoader.exists(p):
			with_icon += 1
		elif p != "" and not ResourceLoader.exists(p):
			broken.append(item.item_id)
	print("SUMMARY: %d/%d items resolve to a real icon; %d still point at missing files" % [with_icon, total, broken.size()])

	db.free()
	if ok:
		print("RESULT: ALL PASS")
		quit(0)
	else:
		print("RESULT: FAILURES")
		quit(1)
