class_name VelocityComponent extends Node

signal controlled_velocity_changed(new_velocity: Vector2)

@export var enabled: bool = true

@export var target: CharacterBody2D

@export var debug: bool = false

const knockback_velocity_smoothing_value: float = 15.0
# 0.0 controlled velocity is not affected
# 1.0 controlled speed can be fully negated by knockback  
@export_range(0.0, 1.0, 0.1) var knockback_penalty_amount: float = 0.3

# 0.0 knockback is applied as normal
# 1.0 knockback doesn't affect the body  
@export_range(0.0, 1.0, 0.1) var knockback_resistance: float = 0.0

# What should the length of the knockback vector be for penalty to be 100% active
const knockback_full_penalty_on_length: float = 100.0

var controlled_velocity: Vector2 = Vector2.ZERO:
	set(value):
		controlled_velocity = value
		controlled_velocity_changed.emit(value)
		

var knockback_velocity: Vector2 = Vector2.ZERO

var collided: bool = false

func _physics_process(delta: float) -> void:
	
	knockback_velocity = knockback_velocity.lerp(Vector2.ZERO, Utility.fi_lerp(delta, 10.0))
	
	if not enabled:
		return

	var knockback_penalty_strength := 1.0 - (minf(knockback_velocity.length(), knockback_full_penalty_on_length) / knockback_full_penalty_on_length) * knockback_penalty_amount
		
	var knockback_resistance_multiplier := 1.0 - knockback_resistance
	
	target.velocity = knockback_velocity * knockback_resistance_multiplier + controlled_velocity * knockback_penalty_strength
	
	collided = target.move_and_slide()
