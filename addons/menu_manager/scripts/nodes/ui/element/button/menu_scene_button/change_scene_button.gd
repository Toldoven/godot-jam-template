class_name MenuSceneButton extends Button

@export_file("*.tscn") var scene_path: String


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	SceneManager.change_scene_to_file(scene_path)
