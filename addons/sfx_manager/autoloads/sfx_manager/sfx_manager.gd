@tool

extends Node


func play_sfx(sound_effect: SoundEffect, override_bus: StringName = &"") -> AudioStreamPlayer:
	var player := AudioStreamPlayer.new()
	add_child(player)
	sound_effect.apply_to_player(player)
	player.bus = _get_sfx_bus(override_bus)
	player.finished.connect(player.queue_free)
	player.play()
	return player


func play_sfx_2d(sound_effect: SoundEffect, global_position: Vector2, override_bus: StringName = &"") -> AudioStreamPlayer2D:
	var player := AudioStreamPlayer2D.new()
	add_child(player)
	player.global_position = global_position
	sound_effect.apply_to_player(player)
	player.bus = _get_sfx_bus(override_bus)
	player.finished.connect(player.queue_free)
	player.play()
	return player


func play_sfx_3d(sound_effect: SoundEffect, global_position: Vector3, override_bus: StringName = &"") -> AudioStreamPlayer3D:
	var player := AudioStreamPlayer3D.new()
	add_child(player)
	player.global_position = global_position
	sound_effect.apply_to_player(player)
	player.bus = _get_sfx_bus(override_bus)
	player.finished.connect(player.queue_free)
	player.play()
	return player


func _get_sfx_bus(override_bus: StringName) -> StringName:
	if override_bus == &"":
		return default_sfx_bus()
	else:
		return override_bus


func default_sfx_bus() -> StringName:
	return ProjectSettings.get_setting("audio/sfx_manager/default_sfx_bus", &"Master")


func get_variance(variance: float) -> float:
	return randf_range(-variance, variance)
