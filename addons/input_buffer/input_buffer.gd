extends Node

var _buffer_ms: int = 150

var _timestamps: Dictionary = {}

var _actions: PackedStringArray = PackedStringArray([])


func _init() -> void:
	_buffer_ms = ProjectSettings.get_setting("input_buffer/input_buffer/buffer_ms", 150) as int
	_actions = ProjectSettings.get_setting("input_buffer/input_buffer/action_list", PackedStringArray([])) as PackedStringArray


func _input(event: InputEvent) -> void:
	if not event.is_pressed() or event.is_echo():
		return
	
	for action: String in _actions:
		if not event.is_action_pressed(action):
			continue
		_timestamps[action] = Time.get_ticks_msec()	


func is_action_buffered(action: String) -> bool:
	return Time.get_ticks_msec() - _timestamps.get(action, 0) < _buffer_ms


func is_action_buffered_or_pressed(action: String) -> bool:
	return is_action_buffered(action) or Input.is_action_pressed(action)
