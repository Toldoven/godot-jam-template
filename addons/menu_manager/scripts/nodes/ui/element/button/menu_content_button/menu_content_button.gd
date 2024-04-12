class_name MenuContentButton extends Button

@export var current_menu_content: MenuContent
@export var change_to_menu_content_packed: PackedScene


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	current_menu_content.menu_container.set_content_packed.call_deferred(change_to_menu_content_packed)
