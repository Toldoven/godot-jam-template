@icon("res://addons/menu_manager/icons/PauseMenu.svg")

class_name PauseMenu extends MenuContainer


func _init() -> void:
	super()
	process_mode = PROCESS_MODE_ALWAYS


func _ready() -> void:
	super()
	visible = get_tree().paused
	MenuEventBus.unpause_request.connect(unpause)


func unpause() -> void:
	var tree := get_tree()
	if not tree.paused:
		return
	tree.paused = false
	visible = false


func _input(event: InputEvent) -> void:
	# We only open or close the menu when the ui_cancel input is pressed
	if not event.is_action_pressed("ui_cancel"):
		return
		
	# If the pause menu is active and container has previous content
	# Then we don't want to exit the menu
	# We wan't to handle it with super instead to go to previous content
	if visible and has_previous():
		super(event)
		return
	
	var tree := get_tree()
	tree.paused = not tree.paused
	visible = tree.paused


# Don't want to keep the tree paused when the scene is changed
func _exit_tree() -> void:
	get_tree().paused = false
