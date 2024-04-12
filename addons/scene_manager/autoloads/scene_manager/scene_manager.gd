extends Node


func change_scene_to_file(path: String) -> void:
	await VfxManager.screen_fade.fade_out()
	get_tree().change_scene_to_file(path)
	await VfxManager.screen_fade.fade_in()


func change_scene_to_packed(scene: PackedScene) -> void:
	await VfxManager.screen_fade.fade_out()
	get_tree().change_scene_to_packed(scene)
	await VfxManager.screen_fade.fade_in()


func reload_current_scene() -> void:
	await VfxManager.screen_fade.fade_out()
	get_tree().reload_current_scene()
	await VfxManager.screen_fade.fade_in()
