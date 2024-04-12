@tool
extends EditorPlugin

const AUTOLOAD_NAME = "SfxManager"


func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/sfx_manager/autoloads/sfx_manager/sfx_manager.tscn")
	
	add_custom_project_setting("audio/sfx_manager/default_sfx_bus", "Master", TYPE_STRING_NAME)
	
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
