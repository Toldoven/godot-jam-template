class_name SingleHitHitboxComponent extends Area2D

signal hit(target: HurtboxComponent)

## target is used to calculate nearest hurtbox to this target
@export var target: Node2D = self
@export var damage_stats: DamageStats
@export var knockback_vector: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var component_list := get_overlapping_areas() as Array[Area2D]
	if component_list.size() == 0:
		return
	
	component_list.sort_custom(func(a: HurtboxComponent, b: HurtboxComponent) -> bool:
		return a.global_position.distance_squared_to(target.global_position) < b.global_position.distance_squared_to(target.global_position)
	)
	var closest_area := component_list[0]
	
	var hurtbox_component := closest_area as HurtboxComponent
	hit.emit(hurtbox_component)
	hurtbox_component.damage(damage_stats, knockback_vector)
	
	Utility.disable_collisions(self)
