class_name TestDeathComponent extends Node

@export var target: Node
@export var health_component: HealthComponent


func _ready() -> void:
	health_component.death.connect(func() -> void:
		target.queue_free()
	)
