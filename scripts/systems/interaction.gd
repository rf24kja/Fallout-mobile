class_name InteractionManager
extends Node

## Global manager for interaction system.
## Handles interaction targeting, distance checks, and input routing.

signal interaction_target_changed(target: Node)
signal interaction_completed(target: Node)
signal interactable_nearby(interactable: Node)  # Emitted when an interactable enters range
signal interactable_far(interactable: Node)      # Emitted when an interactable leaves range

var _registered_interactables: Array[Node] = []
var _current_target: Node = null
var _player
var _camera
var _player_find_retry_count: int = 0
const MAX_PLAYER_FIND_RETRIES = 30

func _ready() -> void:
	var eb = get_node_or_null("/root/EventBus")
	if eb:
		eb.connect("player_moved", _on_player_moved.bind())
		eb.connect("scene_change_requested", _on_scene_change_requested.bind())

	# Also try to find player immediately (in case player doesn't move initially)
	await get_tree().create_timer(0.1).timeout
	_find_player_and_update()

func _on_scene_change_requested(scene_path: String) -> void:
	print("InteractionManager: scene change requested to ", scene_path)
	_player = null
	_current_target = null
	_player_find_retry_count = 0
	await get_tree().create_timer(0.1).timeout
	_find_player_and_update()

func _find_player_and_update() -> void:
	if _player and is_instance_valid(_player):
		_update_interaction_target()
		return
	
	# Try to find player with flexible path search
	_player = _find_player_node()
	if _player:
		print("InteractionManager: found player = ", _player, " at path = ", _player.get_path())
		_update_interaction_target()
	else:
		_player_find_retry_count += 1
		if _player_find_retry_count < MAX_PLAYER_FIND_RETRIES:
			print("InteractionManager: player not found, retrying... (", _player_find_retry_count, "/", MAX_PLAYER_FIND_RETRIES, ")")
			# Use timer-based delay instead of call_deferred to span Player initialization period
			await get_tree().create_timer(0.1).timeout
			_find_player_and_update()
		else:
			print("InteractionManager: failed to find player after ", MAX_PLAYER_FIND_RETRIES, " retries")

func _find_player_node() -> Node:
	# Try specific test_map path first
	var player = get_node_or_null("/root/TestMap/Player")
	if player and is_instance_valid(player):
		return player
	
	# Try current scene root
	var root = get_tree().get_root()
	if root:
		# Search in current scene children
		for i in range(root.get_child_count()):
			var child = root.get_child(i)
			if child.name == "TestMap" or child.name.ends_with("Map") or child.name == "World":
				player = child.get_node_or_null("Player")
				if player and is_instance_valid(player):
					return player
		# Fallback: search all children for Player
		for i in range(root.get_child_count()):
			var child = root.get_child(i)
			player = child.get_node_or_null("Player")
			if player and is_instance_valid(player):
				return player
	
	return null

func _on_player_moved(position: Vector2) -> void:
	if not _player or not is_instance_valid(_player):
		_player = _find_player_node()
		print("InteractionManager: found player via player_moved = ", _player, " class = ", _player.get_class() if _player else "null")
	if _player:
		_update_interaction_target()

func _update_interaction_target() -> void:
	if not _player:
		return
	
	print("InteractionManager: _update_interaction_target, player = ", _player, " interactables = ", _registered_interactables.size())
	
	var best_target: Node = null
	var best_distance = INF
	
	for interactable in _registered_interactables:
		print("InteractionManager: checking interactable = ", interactable, " class = ", interactable.get_class(), " parent = ", interactable.get_parent().name if interactable.get_parent() else "none")
		if interactable.can_interact(_player):
			# Use _get_global_position() since Interactable is a Node, not Node2D
			var interactable_pos = interactable._get_global_position()
			var dist = _player.global_position.distance_to(interactable_pos)
			if dist < best_distance:
				best_distance = dist
				best_target = interactable
	
	print("InteractionManager: best_target = ", best_target, " best_distance = ", best_distance, " current_target = ", _current_target)
	
	# Emit signals for nearby/far interactables
	var previous_target = _current_target
	
	if best_target != _current_target:
		_current_target = best_target
		interaction_target_changed.emit(_current_target)
	
	# Emit interactable_nearby when target becomes available
	if _current_target and _current_target != previous_target:
		interactable_nearby.emit(_current_target)
	# Emit interactable_far when target is lost
	elif previous_target and previous_target != _current_target:
		interactable_far.emit(previous_target)

func register_interactable(interactable: Node) -> void:
	if interactable not in _registered_interactables:
		_registered_interactables.append(interactable)
		# Check if this interactable is immediately in range
		if _player and interactable.can_interact(_player):
			interactable_nearby.emit(interactable)

func unregister_interactable(interactable: Node) -> void:
	_registered_interactables.erase(interactable)
	if _current_target == interactable:
		_current_target = null
		interaction_target_changed.emit(null)
		interactable_far.emit(interactable)

func get_current_target() -> Node:
	return _current_target

func attempt_interaction() -> bool:
	if _current_target and _player:
		return _current_target.interact(_player)
	return false

func clear_target() -> void:
	_current_target = null
	interaction_target_changed.emit(null)