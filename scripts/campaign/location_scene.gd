class_name LocationScene
extends Node2D

## Builds a REAL playable 2D scene from flexible importer map data.
##
## Expected (all keys optional, defaults are headless-safe):
## {
##   width: int, height: int,
##   tiles:    [ {x,y,w,h,color} | [x,y,w,h] | {position:[x,y]} ],
##   critters: [ {id,x,y} | "critter_id" ],
##   items:    [ {id,x,y} | "item_id" ],
##   scenery:  [ {id,x,y,w,h,color} ],
##   exits:    [ {to/id,x,y,label,requires} | "location_id" ]
## }
##
## No textures are loaded — ColorRect markers and simple collision shapes work
## in a headless SceneTree with no renderer dependency. Even with no markers
## the result is non-empty: ground + boundary + spawn + a fallback exit.

signal exit_interacted(to_id: String)

const DEFAULT_WIDTH := 1280.0
const DEFAULT_HEIGHT := 720.0
const MAX_MARKERS := 256  # guard against bloated/garbage map data

var location: Dictionary = {}
var map_data: Dictionary = {}
var world_map: Node = null

var _built: bool = false


func configure(p_location: Dictionary, p_map_data: Dictionary) -> void:
	location = p_location.duplicate(true)
	map_data = p_map_data.duplicate(true)
	_clear_built_children()
	_build()
	_built = true


func set_world_map(pm: Node) -> void:
	world_map = pm


func is_configured() -> bool:
	return _built


func _clear_built_children() -> void:
	for child in get_children():
		child.queue_free()


func _num(v: Variant, fallback: float = 0.0) -> float:
	if v == null:
		return fallback
	if v is float or v is int:
		return float(v)
	if v is String and (v as String).is_valid_float():
		return float(v)
	return fallback


func _str(v: Variant) -> String:
	if v == null:
		return ""
	return v if v is String else str(v)


func _color(v: Variant, default: Color) -> Color:
	if v is Color:
		return v
	if v is String:
		var c := Color.html(str(v))
		return c
	return default


func _build() -> void:
	var width := maxf(1.0, _num(map_data.get("width", DEFAULT_WIDTH), DEFAULT_WIDTH))
	var height := maxf(1.0, _num(map_data.get("height", DEFAULT_HEIGHT), DEFAULT_HEIGHT))

	# 1. Ground — a real ColorRect sized to the map.
	var ground := ColorRect.new()
	ground.name = "Ground"
	ground.color = _color(map_data.get("ground_color", "#3b3a32"), Color(0.23, 0.23, 0.20))
	ground.position = Vector2.ZERO
	ground.size = Vector2(width, height)
	ground.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(ground)

	# 2. Collision boundary — StaticBody2D with a rectangular shape.
	var boundary := StaticBody2D.new()
	boundary.name = "Boundary"
	var shape := CollisionShape2D.new()
	var rect := RectangleShape2D.new()
	rect.size = Vector2(width, height)
	shape.shape = rect
	shape.position = Vector2(width / 2.0, height / 2.0)
	boundary.add_child(shape)
	add_child(boundary)

	# 3. Player spawn point — prefer explicit spawn, else map center-left.
	var spawn := Node2D.new()
	spawn.name = "PlayerSpawn"
	var sx := _num(map_data.get("spawn_x", map_data.get("spawn", {}).get("x", 0.0)) if map_data.get("spawn", null) is Dictionary else map_data.get("spawn_x", 0.0), 0.0)
	var sy := _num(map_data.get("spawn_y", 0.0), 0.0)
	if map_data.get("spawn", null) is Dictionary:
		var sp: Dictionary = map_data["spawn"]
		sx = _num(sp.get("x", sx), sx)
		sy = _num(sp.get("y", sy), sy)
	spawn.position = Vector2(sx, sy)
	add_child(spawn)

	# 4. Tiles / scenery / critters / items as simple colored markers.
	_make_markers("Tiles", map_data.get("tiles", []), Color(0.35, 0.30, 0.22), width, height, true)
	_make_markers("Scenery", map_data.get("scenery", []), Color(0.40, 0.38, 0.30), width, height, false)
	_make_markers("Critters", map_data.get("critters", location.get("npcs", [])), Color(0.75, 0.25, 0.20), width, height, false)
	_make_markers("Items", map_data.get("items", location.get("items", [])), Color(0.85, 0.75, 0.30), width, height, false)

	# 5. Exit markers — interactive areas that travel through WorldMap.
	var exits: Array = []
	var raw_exits: Variant = map_data.get("exits", location.get("exits", []))
	if raw_exits is Array:
		exits = raw_exits
	elif raw_exits is Dictionary:
		exits = [raw_exits]
	var used := 0
	for i in range(exits.size()):
		if used >= MAX_MARKERS:
			break
		var entry: Variant = exits[i]
		var to_id := ""
		var px := width - 60.0
		var py := height / 2.0 + (i - exits.size() / 2.0) * 48.0
		var label_text := ""
		if entry is Dictionary:
			var ed: Dictionary = entry
			to_id = _str(ed.get("to", ed.get("id", ed.get("target", ""))))
			px = _num(ed.get("x", px), px)
			py = _num(ed.get("y", py), py)
			label_text = _str(ed.get("label", ed.get("name", to_id)))
		else:
			to_id = _str(entry)
			label_text = to_id
		if label_text.is_empty():
			label_text = "EXIT " + str(i + 1)
		_make_exit(to_id, label_text, Vector2(px, py), used)
		used += 1

	# Fallback: never produce an empty world graph marker set.
	if exits.is_empty():
		_make_exit("", "EXIT", Vector2(width - 60.0, height / 2.0), 0)


func _make_markers(group_name: String, entries: Variant, default_color: Color, width: float, height: float, use_tiles: bool) -> void:
	if not (entries is Array):
		return
	var root := Node2D.new()
	root.name = group_name
	add_child(root)
	var count := 0
	for entry in entries:
		if count >= MAX_MARKERS:
			break
		var x := 0.0
		var y := 0.0
		var w := 24.0
		var h := 24.0
		var col := default_color
		if entry is Dictionary:
			var d: Dictionary = entry
			x = _num(d.get("x", d.get("position_x", 0.0)), 0.0)
			y = _num(d.get("y", d.get("position_y", 0.0)), 0.0)
			if d.get("position", null) is Array and (d["position"] as Array).size() >= 2:
				x = _num((d["position"] as Array)[0], x)
				y = _num((d["position"] as Array)[1], y)
			if use_tiles:
				w = _num(d.get("w", d.get("width", w)), w)
				h = _num(d.get("h", d.get("height", h)), h)
				col = _color(d.get("color", col), col)
		elif entry is Array and (entry as Array).size() >= 2:
			x = _num((entry as Array)[0], 0.0)
			y = _num((entry as Array)[1], 0.0)
			if use_tiles and (entry as Array).size() >= 4:
				w = _num((entry as Array)[2], w)
				h = _num((entry as Array)[3], h)
		x = clampf(x, 0.0, maxf(0.0, width - w))
		y = clampf(y, 0.0, maxf(0.0, height - h))
		var marker := ColorRect.new()
		marker.name = "%s_%d" % [group_name, count]
		marker.color = col
		marker.position = Vector2(x, y)
		marker.size = Vector2(w, h)
		marker.mouse_filter = Control.MOUSE_FILTER_IGNORE
		root.add_child(marker)
		count += 1


func _make_exit(to_id: String, label_text: String, pos: Vector2, index: int) -> void:
	var exit := Area2D.new()
	exit.name = "Exit_%d" % index
	exit.position = pos
	var shape := CollisionShape2D.new()
	var rect := RectangleShape2D.new()
	rect.size = Vector2(48.0, 48.0)
	shape.shape = rect
	exit.add_child(shape)
	var label := Label.new()
	label.name = "Label"
	label.text = label_text
	label.position = Vector2(-40.0, 32.0)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	exit.add_child(label)
	exit.set_meta("to_id", to_id)
	exit.connect("input_event", Callable(self, "_on_exit_input").bind(to_id))
	add_child(exit)


func _on_exit_input(_viewport: Object, _event: Object, _shape_idx: int, to_id: String) -> void:
	interact_exit(to_id)


## Programmatic interaction hook (also used by mobile controls / tests).
func interact_exit(to_id: String) -> void:
	if to_id.is_empty():
		return
	exit_interacted.emit(to_id)
	if world_map != null and is_instance_valid(world_map) and world_map.has_method("travel_to"):
		world_map.call("travel_to", to_id)


func get_exit_ids() -> Array:
	var result: Array = []
	for child in get_children():
		if child is Area2D and child.has_meta("to_id"):
			result.append(str(child.get_meta("to_id")))
	return result
