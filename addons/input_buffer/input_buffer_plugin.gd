@tool
extends EditorPlugin

const AUTOLOAD_NAME = "InputBuffer"


func _enter_tree() -> void:
	add_custom_project_setting("input_buffer/input_buffer/buffer_ms", 150, TYPE_INT)	
	add_custom_project_setting("input_buffer/input_buffer/action_list", PackedStringArray([]), TYPE_PACKED_STRING_ARRAY)
	add_custom_project_setting("input_buffer/input_buffer/test", [], TYPE_ARRAY, PROPERTY_HINT_TYPE_STRING, "%d:" % ["SoundEffect"])

	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/input_buffer/input_buffer.gd")

	var error: int = ProjectSettings.save()
	if error:
		push_error("Encountered error %d when saving project settings." % error)


func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)


func add_custom_project_setting(name: String, default_value: Variant, type: int, hint: int = PROPERTY_HINT_NONE, hint_string: String = "") -> void:

	if ProjectSettings.has_setting(name):
		return

	var setting_info: Dictionary = {
		"name": name,
		"type": type,
		"hint": hint,
		"hint_string": hint_string
	}

	ProjectSettings.set_setting(name, default_value)
	ProjectSettings.add_property_info(setting_info)
	ProjectSettings.set_initial_value(name, default_value)
