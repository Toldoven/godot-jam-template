@tool
extends EditorPlugin

const AUTOLOAD_NAME = "SceneManager"


func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/scene_manager/autoloads/scene_manager/scene_manager.tscn")


func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
