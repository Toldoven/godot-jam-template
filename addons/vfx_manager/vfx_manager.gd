@tool
extends EditorPlugin

const AUTOLOAD_NAME = "VfxManager"


func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/vfx_manager/autoloads/vfx_manager/vfx_manager.tscn")


func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
