class_name MenuBackButton extends CustomButton

@export var current_menu_content: MenuContent

func _on_button_pressed() -> void:
	super()
	if current_menu_content.menu_container.has_previous():
		current_menu_content.menu_container.set_content_to_previous()
	else:
		MenuEventBus.unpause_request.emit()
