class_name CoverSystem
extends Node2D

## Cover and Line-of-Fire System (Fallout 1/2 inspired)
## Determines obstruction levels between attacker and target for ranged combat.

signal cover_changed(attacker_id: String, target_id: String, cover_level: int)

enum CoverLevel {
	NONE = 0,        # Clear shot, no obstruction
	LIGHT = 1,       # Partial cover (crate, low wall) - accuracy penalty
	MEDIUM = 2,      # Significant cover (wall corner, pillar) - heavy penalty
	HEAVY = 3,       # Near-total cover (behind wall, through window) - extreme penalty
	BLOCKED = 4      # Completely blocked (solid wall) - cannot shoot
}

# Cover types from world geometry
const COVER_OBJECT_TYPES = [
	"crate", "barrel", "wall_low", "wall_half", "pillar", 
	"fence", "window", "doorway", "debris", "vehicle"
]

var _space_state: PhysicsDirectSpaceState2D
var _cover_objects: Array[Node2D] = []
var _debug_draw = false

func _ensure_space_state() -> bool:
	if _space_state:
		return true
	var world_2d = get_world_2d()
	if world_2d:
		_space_state = world_2d.direct_space_state
		return true
	return false

func _ready() -> void:
	call_deferred("_init_cover_system")

func _init_cover_system() -> void:
	_ensure_space_state()
	_find_cover_objects()

func _find_cover_objects() -> void:
	_cover_objects.clear()
	var root = get_tree().get_root()
	_find_cover_recursive(root)

func _find_cover_recursive(node: Node) -> void:
	if node is Node2D and node.get_meta("cover_type", "") != "":
		_cover_objects.append(node)
	for child in node.get_children():
		_find_cover_recursive(child)

func refresh_cover_objects() -> void:
	_find_cover_objects()

## Main public API: Check line of fire between two positions
## Returns CoverLevel enum indicating obstruction severity
func check_line_of_fire(attacker_pos: Vector2, target_pos: Vector2, attacker_id: String = "", target_id: String = "") -> int:
	var cover_level = _calculate_cover_level(attacker_pos, target_pos)
	
	if attacker_id != "" and target_id != "":
		cover_changed.emit(attacker_id, target_id, cover_level)
	
	if _debug_draw:
		_draw_debug_ray(attacker_pos, target_pos, cover_level)
	
	return cover_level

## Calculate cover level based on raycast intersections
func _calculate_cover_level(start: Vector2, end: Vector2) -> int:
	if not _ensure_space_state():
		return CoverLevel.NONE
	
	var query = PhysicsRayQueryParameters2D.create(start, end)
	query.collision_mask = 1  # Default layer - adjust for cover layers
	query.collide_with_areas = false
	query.collide_with_bodies = true
	query.hit_from_inside = false
	
	var result = _space_state.intersect_ray(query)
	
	if not result:
		return CoverLevel.NONE
	
	# Analyze what we hit
	var collider = result.collider
	var hit_pos = result.position
	var hit_normal = result.normal
	
	# Check if it's a cover object
	var cover_type = collider.get_meta("cover_type", "") if collider else ""
	
	if cover_type == "":
		# Solid wall or unknown obstruction
		return CoverLevel.BLOCKED
	
	# Determine cover level based on object type and hit geometry
	return _classify_cover(cover_type, start, end, hit_pos, hit_normal, collider)

func _classify_cover(cover_type: String, start: Vector2, end: Vector2, hit_pos: Vector2, hit_normal: Vector2, collider: Node2D) -> int:
	var dist_to_target = start.distance_to(end)
	var dist_to_hit = start.distance_to(hit_pos)
	var hit_ratio = dist_to_hit / dist_to_target if dist_to_target > 0 else 1.0
	
	# Base cover level by type
	var base_level = _get_base_cover_level(cover_type)
	
	# Adjust based on hit position (closer to attacker = more cover)
	if hit_ratio < 0.3:
		base_level = min(base_level + 1, CoverLevel.HEAVY)
	elif hit_ratio > 0.7:
		base_level = max(base_level - 1, CoverLevel.LIGHT)
	
	# Special handling for specific cover types
	match cover_type:
		"window":
			# Shooting through window - reduced cover if not shattered
			if collider.get_meta("shattered", false):
				return CoverLevel.LIGHT
			return CoverLevel.MEDIUM
		
		"doorway":
			# Doorway - depends on door state
			if collider.get_meta("open", false):
				return CoverLevel.LIGHT
			return CoverLevel.MEDIUM
		
		"fence":
			# Chain link or wire fence
			return CoverLevel.LIGHT
		
		"wall_low":
			# Low wall / sandbags
			return CoverLevel.MEDIUM
		
		"wall_half":
			# Half-height wall
			return CoverLevel.MEDIUM
	
	return base_level

func _get_base_cover_level(cover_type: String) -> int:
	match cover_type:
		"crate", "barrel", "debris": return CoverLevel.LIGHT
		"pillar", "vehicle": return CoverLevel.MEDIUM
		"wall_low", "wall_half", "window", "doorway": return CoverLevel.MEDIUM
		"fence": return CoverLevel.LIGHT
		"wall", "wall_solid": return CoverLevel.BLOCKED
	return CoverLevel.LIGHT

## Get accuracy penalty for a cover level
func get_accuracy_penalty(cover_level: int) -> int:
	match cover_level:
		CoverLevel.NONE: return 0
		CoverLevel.LIGHT: return -15
		CoverLevel.MEDIUM: return -30
		CoverLevel.HEAVY: return -50
		CoverLevel.BLOCKED: return -100  # Effectively impossible
	return 0

## Check if shot is possible (not completely blocked)
func can_shoot(cover_level: int) -> bool:
	return cover_level < CoverLevel.BLOCKED

## Get cover description for UI
func get_cover_description(cover_level: int) -> String:
	match cover_level:
		CoverLevel.NONE: return "Clear Shot"
		CoverLevel.LIGHT: return "Light Cover"
		CoverLevel.MEDIUM: return "Medium Cover"
		CoverLevel.HEAVY: return "Heavy Cover"
		CoverLevel.BLOCKED: return "Blocked"
	return "Unknown"

## Get visual representation for UI (icon name or color)
func get_cover_ui_color(cover_level: int) -> Color:
	match cover_level:
		CoverLevel.NONE: return Color(0.2, 0.8, 0.2, 1)    # Green
		CoverLevel.LIGHT: return Color(0.8, 0.8, 0.2, 1)   # Yellow
		CoverLevel.MEDIUM: return Color(0.9, 0.5, 0.1, 1)  # Orange
		CoverLevel.HEAVY: return Color(0.8, 0.2, 0.2, 1)   # Red
		CoverLevel.BLOCKED: return Color(0.4, 0.4, 0.4, 1) # Gray
	return Color(1, 1, 1, 1)

## Debug visualization
func _draw_debug_ray(start: Vector2, end: Vector2, cover_level: int) -> void:
	var color = get_cover_ui_color(cover_level)
	# This would be called from _draw() in a CanvasItem
	# For now, just print
	print("LOF Debug: ", start, " -> ", end, " | Cover: ", get_cover_description(cover_level))

## Helper: Check cover for combat participants
func check_combat_cover(attacker: Dictionary, target: Dictionary) -> int:
	var attacker_pos = attacker.get("position", Vector2.ZERO)
	var target_pos = target.get("position", Vector2.ZERO)
	var attacker_id = attacker.get("id", "")
	var target_id = target.get("id", "")
	return check_line_of_fire(attacker_pos, target_pos, attacker_id, target_id)

## Helper: Get all cover objects between two points (for detailed UI)
func get_cover_details(start: Vector2, end: Vector2) -> Array[Dictionary]:
	var details = []
	var query = PhysicsRayQueryParameters2D.create(start, end)
	query.collision_mask = 1
	query.collide_with_areas = false
	query.collide_with_bodies = true
	
	# Note: Godot 4 raycast only returns first hit
	# For multiple covers, we'd need multiple raycasts or shapecast
	var result = _space_state.intersect_ray(query)
	
	if result:
		var collider = result.collider
		details.append({
			"position": result.position,
			"normal": result.normal,
			"cover_type": collider.get_meta("cover_type", "") if collider else "unknown",
			"object_name": collider.name if collider else "unknown"
		})
	
	return details