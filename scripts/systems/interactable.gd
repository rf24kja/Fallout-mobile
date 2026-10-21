class_name Interactable
extends Node

## Base component for all interactable objects in the world.
## Attach to any Node2D to make it interactable.

signal interaction_started(interactor: Node)
signal interaction_ended(interactor: Node)

@export var interaction_radius: float = 64.0
@export var interaction_name: String = "Interact"
@export var requires_line_of_sight: bool = true
@export var can_interact_through_obstacles: bool = false

var is_active: bool = true
var _interaction_manager

func _ready() -> void:
	_interaction_manager = get_node_or_null("/root/InteractionManager")
	if _interaction_manager:
		_interaction_manager.register_interactable(self)

func _exit_tree() -> void:
	if _interaction_manager:
		_interaction_manager.unregister_interactable(self)

func _get_global_position() -> Vector2:
	# Get global position from parent Node2D
	var parent = get_parent()
	if parent and parent is Node2D:
		return parent.global_position
	return Vector2.ZERO

func _get_rid() -> RID:
	var parent = get_parent()
	if parent and parent.has_method("get_rid"):
		return parent.get_rid()
	return RID()

func _get_world_2d() -> World2D:
	var parent = get_parent()
	if parent and parent.has_method("get_world_2d"):
		return parent.get_world_2d()
	# Fallback
	return get_viewport().world_2d

func can_interact(interactor: Node) -> bool:
	if not is_active:
		print("can_interact: is_active=false")
		return false
	if not interactor:
		print("can_interact: interactor=null")
		return false
	
	# Check if interactor is a Node2D (has global_position property)
	if not interactor is Node2D:
		print("can_interact: interactor is not Node2D, class = ", interactor.get_class())
		return false
	
	var interactable_pos = _get_global_position()
	var interactor_pos = interactor.global_position
	var distance = interactable_pos.distance_to(interactor_pos)
	print("can_interact: interactable_pos=", interactable_pos, " interactor_pos=", interactor_pos, " distance=", distance, " radius=", interaction_radius)
	if distance > interaction_radius:
		print("can_interact: distance > radius")
		return false
	
	if requires_line_of_sight and not can_interact_through_obstacles:
		print("can_interact: checking line of sight")
		return _check_line_of_sight(interactor)
	
	print("can_interact: returning true")
	return true

func _check_line_of_sight(interactor: Node) -> bool:
	# Handle zero distance case
	var interactor_pos = interactor.global_position
	var interactable_pos = _get_global_position()
	if interactor_pos.distance_to(interactable_pos) < 1.0:
		return true
	
	var space_state = _get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(interactable_pos, interactor_pos)
	query.collision_mask = 1
	query.exclude = [_get_rid(), interactor.get_rid()]
	var result = space_state.intersect_ray(query)
	return result.is_empty()

func interact(interactor: Node) -> bool:
	if not can_interact(interactor):
		return false
	
	print("Interactable.interact: emitting interaction_started for ", name, " (instance: ", get_instance_id(), ") parent: ", get_parent().name if get_parent() else "none")
	print("Interactable: signal connections count = ", get_signal_connection_list("interaction_started").size())
	interaction_started.emit(interactor)
	_on_interact(interactor)
	return true

func _on_interact(interactor: Node) -> void:
	## Override in derived classes
	pass

func set_active(active: bool) -> void:
	is_active = active

func get_interaction_prompt() -> String:
	return interaction_name