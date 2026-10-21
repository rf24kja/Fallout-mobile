class_name CombatEffects
extends Node

## Combat Visual Effects System
## Synchronized with combat simulation - pure presentation, no gameplay logic

signal effect_finished(effect_id: String)

# Effect types
enum EffectType {
	MUZZLE_FLASH,
	PROJECTILE_TRAIL,
	IMPACT_SPARK,
	IMPACT_BLOOD,
	CRITICAL_HIT,
	MISS_INDICATOR,
	DAMAGE_NUMBER,
	DEATH_ANIMATION,
	HIT_REACTION,
	SCREEN_SHAKE,
	CAMERA_ZOOM
}

# Pooled effect resources
var _effect_pool: Dictionary = {}
var _active_effects: Array = []
var _particle_materials: Dictionary = {}

# References
@onready var _viewport = get_viewport()

func _ready() -> void:
	_setup_particle_materials()

func _setup_particle_materials() -> void:
	# Create reusable particle process materials for different effect types
	# These would ideally be pre-created .tres files, but we create them here for portability
	
	# Muzzle flash - brief additive flash
	var muzzle_mat = GPUParticles2D.new()
	muzzle_mat.amount = 8
	muzzle_mat.lifetime = 0.05
	muzzle_mat.one_shot = true
	muzzle_mat.explosiveness = 1.0
	muzzle_mat.spread = 45
	muzzle_mat.initial_velocity = 200
	muzzle_mat.scale_amount = 0.5
	muzzle_mat.color_ramp = Gradient.new()
	var ramp = Gradient.new()
	ramp.add_point(0.0, Color(1, 0.9, 0.5, 1))
	ramp.add_point(0.5, Color(1, 0.5, 0.1, 0.8))
	ramp.add_point(1.0, Color(1, 0.2, 0.0, 0))
	muzzle_mat.color_ramp = ramp
	_particle_materials["muzzle_flash"] = muzzle_mat
	
	# Projectile trail
	var trail_mat = GPUParticles2D.new()
	trail_mat.amount = 20
	trail_mat.lifetime = 0.3
	trail_mat.one_shot = false
	trail_mat.spread = 10
	trail_mat.initial_velocity = 50
	trail_mat.scale_amount = 0.8
	trail_mat.scale = 0.3
	ramp = Gradient.new()
	ramp.add_point(0.0, Color(1, 0.8, 0.3, 0.8))
	ramp.add_point(1.0, Color(0.5, 0.3, 0.1, 0))
	trail_mat.color_ramp = ramp
	_particle_materials["projectile_trail"] = trail_mat
	
	# Impact spark
	var spark_mat = GPUParticles2D.new()
	spark_mat.amount = 12
	spark_mat.lifetime = 0.2
	spark_mat.one_shot = true
	spark_mat.explosiveness = 1.0
	spark_mat.spread = 360
	spark_mat.initial_velocity = 150
	spark_mat.gravity = Vector2(0, 100)
	spark_mat.scale_amount = 0.3
	ramp = Gradient.new()
	ramp.add_point(0.0, Color(1, 1, 0.5, 1))
	ramp.add_point(0.5, Color(1, 0.5, 0, 0.6))
	ramp.add_point(1.0, Color(0.5, 0.2, 0, 0))
	spark_mat.color_ramp = ramp
	_particle_materials["impact_spark"] = spark_mat
	
	# Blood impact
	var blood_mat = GPUParticles2D.new()
	blood_mat.amount = 15
	blood_mat.lifetime = 0.4
	blood_mat.one_shot = true
	blood_mat.explosiveness = 0.8
	blood_mat.spread = 120
	blood_mat.initial_velocity = 200
	blood_mat.gravity = Vector2(0, 200)
	blood_mat.scale_amount = 0.5
	ramp = Gradient.new()
	ramp.add_point(0.0, Color(0.6, 0, 0, 1))
	ramp.add_point(0.5, Color(0.4, 0, 0, 0.6))
	ramp.add_point(1.0, Color(0.2, 0, 0, 0))
	blood_mat.color_ramp = ramp
	_particle_materials["impact_blood"] = blood_mat
	
	# Critical hit flash
	var crit_mat = GPUParticles2D.new()
	crit_mat.amount = 25
	crit_mat.lifetime = 0.5
	crit_mat.one_shot = true
	crit_mat.explosiveness = 1.0
	crit_mat.spread = 360
	crit_mat.initial_velocity = 300
	crit_mat.gravity = Vector2(0, -50)
	crit_mat.scale_amount = 1.0
	ramp = Gradient.new()
	ramp.add_point(0.0, Color(1, 1, 0, 1))
	ramp.add_point(0.3, Color(1, 0.5, 0, 0.8))
	ramp.add_point(1.0, Color(1, 0, 0, 0))
	crit_mat.color_ramp = ramp
	_particle_materials["critical_hit"] = crit_mat

## Main API: Play an effect at world position
func play_effect(effect_type: int, position: Vector2, params: Dictionary = {}) -> String:
	var effect_id = "%s_%d" % [EffectType.keys()[effect_type], Time.get_ticks_msec()]
	
	match effect_type:
		EffectType.MUZZLE_FLASH:
			_play_muzzle_flash(position, params, effect_id)
		EffectType.PROJECTILE_TRAIL:
			_play_projectile_trail(position, params, effect_id)
		EffectType.IMPACT_SPARK:
			_play_impact_spark(position, params, effect_id)
		EffectType.IMPACT_BLOOD:
			_play_impact_blood(position, params, effect_id)
		EffectType.CRITICAL_HIT:
			_play_critical_hit(position, params, effect_id)
		EffectType.MISS_INDICATOR:
			_play_miss_indicator(position, params, effect_id)
		EffectType.DAMAGE_NUMBER:
			_play_damage_number(position, params, effect_id)
		EffectType.DEATH_ANIMATION:
			_play_death_animation(position, params, effect_id)
		EffectType.HIT_REACTION:
			_play_hit_reaction(position, params, effect_id)
		EffectType.SCREEN_SHAKE:
			_play_screen_shake(params, effect_id)
		EffectType.CAMERA_ZOOM:
			_play_camera_zoom(params, effect_id)
	
	return effect_id

func _play_muzzle_flash(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var particles = _get_pooled_particles("muzzle_flash")
	if not particles:
		return
	
	var weapon_type = params.get("weapon_type", "pistol")
	var direction = params.get("direction", Vector2.RIGHT)
	
	particles.global_position = pos
	particles.rotation = direction.angle()
	particles.emitting = true
	
	# Auto-cleanup
	await get_tree().create_timer(0.1).timeout
	particles.emitting = false
	_return_to_pool("muzzle_flash", particles)
	effect_finished.emit(effect_id)

func _play_projectile_trail(start_pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var end_pos = params.get("target_position", start_pos + Vector2(100, 0))
	var projectile_type = params.get("projectile_type", "bullet")
	
	# Create line trail using Line2D or particles along path
	var trail = GPUParticles2D.new()
	var mat = _particle_materials["projectile_trail"].duplicate()
	trail.process_material = mat
	trail.global_position = start_pos
	trail.emitting = true
	add_child(trail)
	
	# Animate along path
	var tween = create_tween()
	tween.tween_property(trail, "global_position", end_pos, 0.3)
	tween.tween_callback(_cleanup_trail.bind(trail, effect_id))

func _cleanup_trail(trail: GPUParticles2D, effect_id: String) -> void:
	trail.emitting = false
	await get_tree().create_timer(0.5).timeout
	trail.queue_free()
	effect_finished.emit(effect_id)

func _play_impact_spark(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var particles = _get_pooled_particles("impact_spark")
	if not particles:
		return
	
	particles.global_position = pos
	var angle = params.get("angle", 0)
	particles.rotation = angle
	particles.emitting = true
	
	await get_tree().create_timer(0.3).timeout
	particles.emitting = false
	_return_to_pool("impact_spark", particles)
	effect_finished.emit(effect_id)

func _play_impact_blood(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var particles = _get_pooled_particles("impact_blood")
	if not particles:
		return
	
	particles.global_position = pos
	var angle = params.get("angle", -90) * (PI / 180)
	particles.rotation = angle
	particles.emitting = true
	
	await get_tree().create_timer(0.5).timeout
	particles.emitting = false
	_return_to_pool("impact_blood", particles)
	effect_finished.emit(effect_id)

func _play_critical_hit(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var particles = _get_pooled_particles("critical_hit")
	if not particles:
		return
	
	particles.global_position = pos
	particles.emitting = true
	
	# Add screen flash
	_play_screen_flash(Color(1, 1, 0, 0.3), 0.15)
	
	await get_tree().create_timer(0.6).timeout
	particles.emitting = false
	_return_to_pool("critical_hit", particles)
	effect_finished.emit(effect_id)

func _play_miss_indicator(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	# Show "MISS" text floating up
	var label = Label.new()
	label.text = "MISS"
	label.add_theme_font_size_override("font_size", 24)
	label.add_theme_color_override("font_color", Color(0.8, 0.8, 0.2, 1))
	label.global_position = pos
	add_child(label)
	
	var tween = create_tween()
	tween.tween_property(label, "global_position:y", pos.y - 50, 0.8)
	tween.tween_property(label, "modulate:a", 0, 0.8)
	tween.tween_callback(label.queue_free.bind())
	tween.tween_callback(effect_finished.bind(effect_id))

func _play_damage_number(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var damage = params.get("damage", 0)
	var is_critical = params.get("critical", false)
	var is_heal = params.get("heal", false)
	
	var label = Label.new()
	label.text = str(damage)
	label.add_theme_font_size_override("font_size", is_critical ? 32 : 24)
	
	if is_critical:
		label.add_theme_color_override("font_color", Color(1, 0.8, 0, 1))
		label.add_theme_constant_override("outline_size", 2)
		label.add_theme_color_override("outline_color", Color(1, 0.3, 0, 1))
	elif is_heal:
		label.add_theme_color_override("font_color", Color(0.2, 1, 0.2, 1))
	else:
		label.add_theme_color_override("font_color", Color(1, 0.3, 0.3, 1))
	
	label.global_position = pos
	add_child(label)
	
	var tween = create_tween()
	tween.tween_property(label, "global_position:y", pos.y - 60, 1.0)
	tween.tween_property(label, "modulate:a", 0, 0.8)
	tween.tween_callback(label.queue_free.bind())
	tween.tween_callback(effect_finished.bind(effect_id))

func _play_death_animation(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	var death_type = params.get("death_type", "normal")  # normal, explosion, disintegrate, gib
	
	match death_type:
		"explosion":
			_play_explosion_death(pos, effect_id)
		"disintegrate":
			_play_disintegrate_death(pos, effect_id)
		"gib":
			_play_gib_death(pos, effect_id)
		_:
			_play_normal_death(pos, effect_id)

func _play_normal_death(pos: Vector2, effect_id: String) -> void:
	# Simple fade and collapse
	var sprite = Sprite2D.new()
	sprite.texture = _get_death_sprite()
	sprite.global_position = pos
	sprite.modulate = Color(1, 1, 1, 1)
	add_child(sprite)
	
	var tween = create_tween()
	tween.tween_property(sprite, "rotation", 1.5, 0.5)
	tween.tween_property(sprite, "modulate:a", 0, 1.0)
	tween.tween_property(sprite, "scale", Vector2(0.5, 0.5), 1.0)
	tween.tween_callback(sprite.queue_free.bind())
	tween.tween_callback(effect_finished.bind(effect_id))

func _play_explosion_death(pos: Vector2, effect_id: String) -> void:
	# Particle explosion
	var particles = GPUParticles2D.new()
	var mat = GPUParticles2D.new()
	mat.amount = 50
	mat.lifetime = 1.0
	mat.one_shot = true
	mat.explosiveness = 1.0
	mat.spread = 360
	mat.initial_velocity = 300
	mat.gravity = Vector2(0, 100)
	mat.scale_amount = 1.0
	var ramp = Gradient.new()
	ramp.add_point(0.0, Color(1, 0.8, 0.2, 1))
	ramp.add_point(0.5, Color(1, 0.3, 0, 0.6))
	ramp.add_point(1.0, Color(0.2, 0.1, 0, 0))
	mat.color_ramp = ramp
	particles.process_material = mat
	particles.global_position = pos
	particles.emitting = true
	add_child(particles)
	
	await get_tree().create_timer(1.5).timeout
	particles.queue_free()
	effect_finished.emit(effect_id)

func _play_disintegrate_death(pos: Vector2, effect_id: String) -> void:
	# Energy weapon disintegration
	var particles = GPUParticles2D.new()
	var mat = GPUParticles2D.new()
	mat.amount = 30
	mat.lifetime = 0.8
	mat.one_shot = true
	mat.spread = 360
	mat.initial_velocity = 200
	mat.gravity = Vector2(0, -100)
	mat.scale_amount = 0.5
	var ramp = Gradient.new()
	ramp.add_point(0.0, Color(0.2, 0.8, 1, 1))
	ramp.add_point(0.5, Color(0.5, 0.3, 1, 0.6))
	ramp.add_point(1.0, Color(0.1, 0, 0.5, 0))
	mat.color_ramp = ramp
	particles.process_material = mat
	particles.global_position = pos
	particles.emitting = true
	add_child(particles)
	
	# Screen flash
	_play_screen_flash(Color(0.2, 0.5, 1, 0.4), 0.2)
	
	await get_tree().create_timer(1.0).timeout
	particles.queue_free()
	effect_finished.emit(effect_id)

func _play_gib_death(pos: Vector2, effect_id: String) -> void:
	# Explosive gibs - multiple body parts
	for i in range(6):
		var gib = Sprite2D.new()
		gib.texture = _get_gib_sprite(i)
		gib.global_position = pos + Vector2(randf_range(-10, 10), randf_range(-10, 10))
		gib.rotation = randf_range(0, TAU)
		add_child(gib)
		
		var tween = create_tween()
		tween.tween_property(gib, "global_position", pos + Vector2(randf_range(-100, 100), randf_range(-150, -50)), 1.0)
		tween.tween_property(gib, "rotation", randf_range(-4, 4), 1.0)
		tween.tween_property(gib, "modulate:a", 0, 1.0)
		tween.tween_callback(gib.queue_free.bind())
	
	await get_tree().create_timer(1.5).timeout
	effect_finished.emit(effect_id)

func _play_hit_reaction(pos: Vector2, params: Dictionary, effect_id: String) -> void:
	# Brief sprite flash/knockback for hit target
	var target_sprite = params.get("target_sprite")
	if target_sprite:
		var original_modulate = target_sprite.modulate
		var original_pos = target_sprite.global_position
		var knockback = params.get("knockback", Vector2(10, 0))
		
		target_sprite.modulate = Color(1, 0.3, 0.3, 1)
		target_sprite.global_position += knockback
		
		await get_tree().create_timer(0.1).timeout
		target_sprite.modulate = original_modulate
		await get_tree().create_timer(0.1).timeout
		target_sprite.global_position = original_pos
	
	effect_finished.emit(effect_id)

func _play_screen_shake(params: Dictionary, effect_id: String) -> void:
	var intensity = params.get("intensity", 5.0)
	var duration = params.get("duration", 0.2)
	var frequency = params.get("frequency", 30.0)
	
	if _viewport:
		_viewport.camera2d_offset = Vector2.ZERO
		_viewport.set_camera_2d_shake(intensity, duration, frequency)
	
	await get_tree().create_timer(duration + 0.1).timeout
	effect_finished.emit(effect_id)

func _play_camera_zoom(params: Dictionary, effect_id: String) -> void:
	var zoom_amount = params.get("zoom", 1.2)
	var duration = params.get("duration", 0.15)
	
	if _viewport and _viewport.canvas_transform:
		var original_zoom = _viewport.canvas_transform.get_scale()
		var target_zoom = original_zoom * zoom_amount
		
		var tween = create_tween()
		tween.tween_property(_viewport, "canvas_transform", Transform2D(0, target_zoom, Vector2.ZERO), duration)
		tween.tween_property(_viewport, "canvas_transform", Transform2D(0, original_zoom, Vector2.ZERO), duration)
		tween.tween_callback(effect_finished.bind(effect_id))

func _play_screen_flash(color: Color, duration: float) -> void:
	var canvas = CanvasModulate.new()
	canvas.color = color
	add_child(canvas)
	
	var tween = create_tween()
	tween.tween_property(canvas, "color:a", 0, duration)
	tween.tween_callback(canvas.queue_free.bind())

func _get_pooled_particles(type_name: String) -> GPUParticles2D:
	if not _effect_pool.has(type_name):
		_effect_pool[type_name] = []
	
	if _effect_pool[type_name].size() > 0:
		return _effect_pool[type_name].pop_back()
	
	# Create new
	var particles = GPUParticles2D.new()
	var mat = _particle_materials[type_name].duplicate()
	particles.process_material = mat
	add_child(particles)
	return particles

func _return_to_pool(type_name: String, particles: GPUParticles2D) -> void:
	particles.emitting = false
	particles.visible = false
	if _effect_pool.has(type_name):
		_effect_pool[type_name].append(particles)

func _get_death_sprite() -> Texture2D:
	# Placeholder - would load from asset
	return null

func _get_gib_sprite(index: int) -> Texture2D:
	# Placeholder - would load from asset
	return null

## Called from CombatSystem when actions resolve
func on_attack_result(attacker_pos: Vector2, target_pos: Vector2, result: Dictionary) -> void:
	var is_hit = result.result in [CombatSystem.CombatResult.HIT, CombatSystem.CombatResult.CRITICAL]
	var is_critical = result.result == CombatSystem.CombatResult.CRITICAL
	var damage = result.get("damage", 0)
	var weapon_type = result.get("weapon_type", "pistol")
	var damage_type = result.get("damage_type", 0)
	
	# Muzzle flash at attacker
	play_effect(EffectType.MUZZLE_FLASH, attacker_pos, {"weapon_type": weapon_type, "direction": (target_pos - attacker_pos).normalized()})
	
	if is_hit:
		# Projectile trail
		play_effect(EffectType.PROJECTILE_TRAIL, attacker_pos, {"target_position": target_pos, "projectile_type": weapon_type})
		
		# Impact at target
		if damage_type == 1 or damage_type == 2 or damage_type == 6:  # Energy types
			play_effect(EffectType.IMPACT_SPARK, target_pos, {"angle": randf_range(0, TAU)})
		else:
			play_effect(EffectType.IMPACT_BLOOD, target_pos, {"angle": randf_range(-120, -60) * (PI / 180)})
		
		# Damage number
		play_effect(EffectType.DAMAGE_NUMBER, target_pos, {"damage": damage, "critical": is_critical})
		
		# Hit reaction
		play_effect(EffectType.HIT_REACTION, target_pos, {"target_sprite": result.get("target_sprite")})
		
		if is_critical:
			play_effect(EffectType.CRITICAL_HIT, target_pos, {})
			play_effect(EffectType.SCREEN_SHAKE, Vector2.ZERO, {"intensity": 8, "duration": 0.3})
			play_effect(EffectType.CAMERA_ZOOM, Vector2.ZERO, {"zoom": 1.15, "duration": 0.1})
	else:
		# Miss indicator
		play_effect(EffectType.MISS_INDICATOR, target_pos, {})

func on_death(target_pos: Vector2, death_type: String = "normal") -> void:
	play_effect(EffectType.DEATH_ANIMATION, target_pos, {"death_type": death_type})
	play_effect(EffectType.SCREEN_SHAKE, Vector2.ZERO, {"intensity": 10, "duration": 0.4})

func set_debug_mode(enabled: bool) -> void:
	# Toggle effect visibility for debugging/performance
	for effects in _effect_pool.values():
		for p in effects:
			p.visible = enabled
	for e in _active_effects:
		e.visible = enabled