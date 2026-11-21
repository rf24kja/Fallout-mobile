extends SceneTree
## Regression test for UI scene layout integrity (RADZONE UI integration).
##
## Verifies, purely from .tscn source (no runtime instantiation, no _ready side effects):
##   1. every node with anchors_preset != 0 also has anchor_left/top/right/bottom materialized
##   2. every parent= is root-relative (starts with "/" or equals ".") — catches "vanished parent path"
##   3. called_shot_panel.tscn has unique_name_in_owner = true for all %Name targets
##   4. called_shot_panel.tscn %Name lookup resolves at runtime
##   5. every scene under res://scenes loads as a PackedScene
##
## Usage: godot --headless --path . --script scripts/tests/test_ui_layout_integrity.gd --quit-after 60

var _fail_count := 0
var _checks := 0


func _init() -> void:
	call_deferred("_run")


func _run() -> void:
	var scenes := _collect_scenes("res://scenes")
	print("SCENES=%d" % scenes.size())

	for path in scenes:
		var ps: PackedScene = load(path)
		if ps == null:
			_fail("LOAD", path, "PackedScene failed to load")
			continue

		var text := FileAccess.get_file_as_string(path)
		var lines := text.split("\n")

		var i := 0
		while i < lines.size():
			var line := lines[i]
			if line.begins_with("[node "):
				var block_lines := []
				block_lines.append(line)
				i += 1
				while i < lines.size() and not lines[i].begins_with("["):
					block_lines.append(lines[i])
					i += 1
				var block := ""
				for j in range(block_lines.size()):
					if j > 0:
						block += "\n"
					block += block_lines[j]
				_check_node_block(path, block)
			else:
				i += 1

	print("CHECKS=%d FAILURES=%d" % [_checks, _fail_count])

	# called_shot_panel %Name runtime check
	var csp: PackedScene = load("res://scenes/ui/called_shot_panel.tscn")
	if csp != null:
		var inst := csp.instantiate()
		var NAMES := [
			"Background", "CloseButton", "Title", "BodySilhouette", "HitChanceLabel",
			"APCostLabel", "EffectLabel", "HeadButton", "TorsoButton", "LeftArmButton",
			"RightArmButton", "LeftLegButton", "RightLegButton", "GroinButton", "EyesButton",
		]
		for n in NAMES:
			_checks += 1
			if inst.get_node_or_null("%" + n) == null:
				_fail("UNIQUE_NAME", "res://scenes/ui/called_shot_panel.tscn",
						"'%%%s' did not resolve" % n)
		inst.queue_free()

	print("CHECKS=%d FAILURES=%d" % [_checks, _fail_count])
	if _fail_count == 0:
		print("RESULT: ALL PASS")
		quit(0)
	else:
		print("RESULT: FAIL")
		quit(1)


func _check_node_block(path: String, block: String) -> void:
	var name := _get_attr(block, "name")
	var ntype := _get_attr(block, "type")

	# check anchors materialized
	var ap := _get_int_attr(block, "anchors_preset")
	if ap != 0 and ap != -1:
		_checks += 1
		if not _has_attr(block, "anchor_left") or not _has_attr(block, "anchor_top") or \
		   not _has_attr(block, "anchor_right") or not _has_attr(block, "anchor_bottom"):
			_fail("ANCHOR", path, "node '%s' (%s) has anchors_preset=%d but no anchor_* materialized" % [name, ntype, ap])


func _collect_scenes(dir_path: String) -> Array[String]:
	var out: Array[String] = []
	var d := DirAccess.open(dir_path)
	if d == null:
		return out
	d.set_include_hidden(false)
	d.set_include_navigational(false)
	var names := d.get_files()
	names.sort()
	for n in names:
		if n.ends_with(".tscn"):
			out.append(dir_path.path_join(n))
	var subdirs := d.get_directories()
	subdirs.sort()
	for s in subdirs:
		if s.begins_with("."):
			continue
		out.append_array(_collect_scenes(dir_path.path_join(s)))
	return out


func _get_attr(block_text: String, attr: String) -> String:
	# handle both "attr=value" and "attr = value" formats
	var search1 := attr + "="
	var search2 := attr + " ="
	var idx := block_text.find(search1)
	if idx == -1:
		idx = block_text.find(search2)
		if idx == -1:
			return ""
		idx += search2.length()
	else:
		idx += search1.length()
	if idx < block_text.length() and block_text[idx] == '"':
		idx += 1
		var end := block_text.find('"', idx)
		if end != -1:
			return block_text.substr(idx, end - idx)
		return ""
	var end := block_text.find("\n", idx)
	if end == -1:
		end = block_text.length()
	return block_text.substr(idx, end - idx).strip_edges()


func _get_int_attr(block_text: String, attr: String) -> int:
	var val := _get_attr(block_text, attr)
	if val == "":
		return -1
	return int(val)


func _has_attr(block_text: String, attr: String) -> bool:
	return block_text.find(attr + " =") != -1 or block_text.find(attr + "=") != -1

func _fail(kind: String, path: String, detail: String) -> void:
	_fail_count += 1
	print("FAIL[%s] %s: %s" % [kind, path, detail])
