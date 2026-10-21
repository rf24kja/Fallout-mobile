class_name InteractionManager
extends Node

## Global manager for interaction system.
## Handles interaction targeting, distance checks, and input routing.

signal interaction_target_changed(target: Node)
signal interaction_completed(target: Node)

var _registered_interactables: Array[Node] = []
var _current_target: Node = null
var _player
var _camera

func _ready() -> void:
	var eb = get_node_or_null("/root/EventBus")
	if eb:
		eb.connect("player_moved", _on_player_moved.bind())

func _on_player_moved(position: Vector2) -> void:
	if not _player:
		_player = get_node_or_null("/root/TestMap/Player")
		print("InteractionManager: found player = ", _player, " class = ", _player.get_class() if _player else "null")
	if _player:
		_update_interaction_target()

func _update_interaction_target() -> void:
	if not _player:
		return
	
	print("InteractionManager: _update_interaction_target, player = ", _player, " interactables = ", _registered_interactables.size())
	
	var best_target: Node = null
	var best_distance = INF
	
	for interactable in _registered_interactables:
		print("InteractionManager: checking interactable = ", interactable, " class = ", interactable.get_class())
		if interactable.can_interact(_player):
			# Use _get_global_position() since Interactable is a Node, not Node2D
			var interactable_pos = interactable._get_global_position()
			var dist = _player.global_position.distance_to(interactable_pos)
			if dist < best_distance:
				best_distance = dist
				best_target = interactable
	
	if best_target != _current_target:
		_current_target = best_target
		interaction_target_changed.emit(_current_target)

func register_interactable(interactable: Node) -> void:
	if interactable not in _registered_interactables:
		_registered_interactables.append(interactable)

func unregister_interactable(interactable: Node) -> void:
	_registered_interactables.erase(interactable)
	if _current_target == interactable:
		_current_target = null
		interaction_target_changed.emit(null)

func get_current_target() -> Node:
	return _current_target

func attempt_interaction() -> bool:
	if _current_target and _player:
		return _current_target.interact(_player)
	return false

func clear_target() -> void:
	_current_target = null
	interaction_target_changed.emit(null)