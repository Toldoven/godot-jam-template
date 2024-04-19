class_name MenuContentButton extends CustomButton

@export var current_menu_content: MenuContent
@export var change_to_menu_content_packed: PackedScene


func _on_button_pressed() -> void:
	super()
	current_menu_content.menu_container.set_content_packed.call_deferred(change_to_menu_content_packed)
