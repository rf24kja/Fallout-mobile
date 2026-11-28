extends SceneTree

## Regression test: every .tscn under res://scenes must load with all of the nodes
## its [node ...] headers declare.
##
## Godot 4 does not error on an unknown property line in a .tscn; it silently
## swallows the line AND the following [node] header, so a scene can lose nodes at
## load time with no parse error. This bit the UI when `add_theme_*_override(...)`
## method-call syntax was used in .tscn files (the correct serialization is the
## `theme_override_*/*` property), and when `anchors_preset` was used without
## explicit `anchor_*` values (the preset property is inert at load time).
##
## Run: godot --headless --path . --script scripts/tests/test_scene_parse_integrity.gd --quit-after 60

var _out: Array = []
var _checked := 0

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	await process_frame
	_walk("res://scenes")
	var bad := 0
	for e in _out:
		if e["declared"] != e["parsed"]:
			bad += 1
			print("FAIL\t", e["file"], "\tdeclared=", e["declared"],
				"\tparsed=", e["parsed"], "\tmissing=", e["missing"])
		else:
			print("OK\t", e["file"], "\t", e["declared"])
	print("SCENES_CHECKED=", _checked, " MISMATCH=", bad)
	print("RESULT: ", "ALL PASS" if bad == 0 else "FAIL")
	quit(0 if bad == 0 else 1)

func _walk(dir_path: String) -> void:
	var d := DirAccess.open(dir_path)
	if d == null:
		return
	d.list_dir_begin()
	var name := d.get_next()
	while name != "":
		var full: String = dir_path + "/" + name
		if d.current_is_dir():
			if not name.begins_with("."):
				_walk(full)
		elif name.ends_with(".tscn"):
			_check(full)
		name = d.get_next()
	d.list_dir_end()

func _check(path: String) -> void:
	var txt := FileAccess.get_file_as_string(path)
	if txt.is_empty():
		return
	_checked += 1
	var declared: Array = []
	for line in txt.split("\n"):
		if line.begins_with("[node "):
			var m := RegEx.new()
			m.compile('name="([^"]+)"')
			var res := m.search(line)
			if res != null:
				declared.append(res.get_string(1))
	var ps = load(path)
	if ps == null:
		_out.append({"file": path, "declared": declared.size(),
			"parsed": -1, "missing": "LOAD_FAIL"})
		return
	var st: SceneState = ps.get_state()
	var parsed: Array = []
	for i in st.get_node_count():
		parsed.append(String(st.get_node_name(i)))
	var missing: Array = []
	for d in declared:
		if not parsed.has(d):
			missing.append(d)
	_out.append({"file": path, "declared": declared.size(),
		"parsed": parsed.size(), "missing": str(missing)})
