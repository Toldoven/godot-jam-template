class_name MenuBackButton extends Button

@export var current_menu_content: MenuContent


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	if current_menu_content.menu_container.has_previous():
		current_menu_content.menu_container.set_content_to_previous()
	else:
		MenuEventBus.unpause_request.emit()
