class_name HurtboxComponent extends Area2D

signal hit(damage_stats: DamageStats, knockback_vector: Vector2)

@export var health_component: HealthComponent

@export var velocity_component: VelocityComponent

@export var invincible: bool = false:
	set(value):
		invincible = value
		
		if invincible:
			Utility.disable_collisions.call_deferred(self)
		else:
			Utility.disable_collisions.call_deferred(self)

func damage(damage_stats: DamageStats, knockback_vector: Vector2) -> void:
	
	if invincible:
		return
		
	hit.emit(damage_stats, knockback_vector)
	
	if not is_instance_valid(health_component):
		push_error("Invalid HealthComponenet at %s" % get_path())
		return
		
	health_component.health -= damage_stats.damage_amount
		
	if not is_instance_valid(velocity_component):
		push_warning("Invalid VelocityComponent at %s" % get_path())
	else:
		velocity_component.knockback_velocity += damage_stats.knockback_amount * knockback_vector
