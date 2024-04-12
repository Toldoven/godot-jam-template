class_name InteractionManager extends Area2D

var active_component: InteractionComponent = null

func _physics_process(_delta: float) -> void:
	var component_list := get_overlapping_areas() as Array[Area2D]
	if component_list.size() == 0:
		return
	component_list.sort_custom(func(a: InteractionComponent, b: InteractionComponent) -> bool:
		return a.position.distance_squared_to(position) > b.position.distance_squared_to(position)
	)
	var closest_area := component_list[0] as InteractionComponent
	closest_area.is_active = true
	active_component = closest_area


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and active_component != null:
		active_component.interact.emit()


func _on_area_exited(area: InteractionComponent) -> void:
	if area.is_active:
		area.is_active = false
		active_component = null
