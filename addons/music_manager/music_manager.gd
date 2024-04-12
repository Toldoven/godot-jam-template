@tool
extends EditorPlugin

const AUTOLOAD_NAME = "MusicManager"


func _enter_tree() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/music_manager/autoloads/music_manager/music_manager.tscn")


func _exit_tree() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
