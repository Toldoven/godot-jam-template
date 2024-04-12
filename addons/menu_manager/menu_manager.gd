@tool
extends EditorPlugin

const MENU_EVENT_BUS_AUTOLOAD_NAME = "MenuEventBus"


func _enter_tree() -> void:
	add_autoload_singleton(MENU_EVENT_BUS_AUTOLOAD_NAME, "res://addons/menu_manager/autoloads/menu_event_bus/menu_event_bus.gd")


func _exit_tree() -> void:
	remove_autoload_singleton(MENU_EVENT_BUS_AUTOLOAD_NAME)
