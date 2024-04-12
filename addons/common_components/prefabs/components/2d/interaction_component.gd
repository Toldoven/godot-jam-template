class_name InteractionComponent extends Area2D

signal interact
signal active
signal not_active

signal state_change(new_state: bool)

var is_active := false:
	set(value):
		is_active = value
		state_change.emit(is_active)
		if is_active:
			active.emit()
		else:
			not_active.emit()
