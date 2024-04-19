class_name HitboxComponent extends Area2D

signal hit(target: HurtboxComponent)

@export var damage_stats: DamageStats
@export var knockback_vector: Vector2 = Vector2.ZERO


func quick_toogle() -> void:
	Utility.enable_collisions(self)
	await get_tree().create_timer(0.1).timeout
	Utility.disable_collisions(self)


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	
	if not area is HurtboxComponent:
		push_warning("Hurtbox entered something that is not a Hitbox. I'm not sure if this is supposed to happend. At: %s" % get_path())
		return
	
	var hurtbox_component := area as HurtboxComponent
	hit.emit(hurtbox_component)
	hurtbox_component.damage(damage_stats, knockback_vector)
