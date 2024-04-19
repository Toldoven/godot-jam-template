class_name MenuSceneButton extends CustomButton

@export_file("*.tscn") var scene_path: String

func _on_button_pressed() -> void:
	super()
	disabled = true
	SceneManager.change_scene_to_file(scene_path)
