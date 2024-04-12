@tool
@icon("res://addons/menu_manager/icons/MenuContainer.svg")

class_name MenuContainer extends Control

@export var default_content: PackedScene:
	get:
		return default_content
	set(value):
		default_content = value
		_set_default_content()
		
		
var previous_content: MenuContent = null


func has_previous() -> bool:
	return previous_content != null


func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_cancel"):
		return
	
	set_content_to_previous.call_deferred()


func _set_default_content() -> void:
	
	for child in get_children():
		child.queue_free()
	
	if default_content == null:
		return
		
	var instance := default_content.instantiate() as MenuContent
	add_child(instance)	
	
	if Engine.is_editor_hint():
		return
	
	instance.menu_container = self


func _ready() -> void:
	_set_default_content()


func set_content_packed(packed_scene: PackedScene, to_previous: bool = false) -> void:
	var instance := packed_scene.instantiate()
	
	if not instance is MenuContent:
		push_error("Error while instanciating a packed menu content: instance is not a MenuContent")
		return
		
	set_content(instance as MenuContent, to_previous)


func set_content(new_content: MenuContent, to_previous: bool = false) -> void:
	if get_children().size() != 1:
		push_error("Expected menu container to have exactly one element")
		return
	
	var current_content := get_child(0)
	
	if not current_content is MenuContent:
		push_error("Current content is not MenuContent")
		return
		
	if new_content.is_inside_tree():
		push_error("Error while setting menu container content: Content node is expected to be outside of tree")
		return
		
	remove_child(current_content)
	
	new_content.menu_container = self
	
	if not to_previous:
		previous_content = current_content
	else:
		previous_content = null
	
	add_child(new_content)


func set_content_to_previous() -> void:
	if previous_content == null:
		return
	
	set_content(previous_content, true)
