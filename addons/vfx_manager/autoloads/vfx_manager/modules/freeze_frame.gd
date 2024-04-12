class_name FreezeFrame extends Node

@export var duration_frames: int = 4

@export var duration_frames_long: int = 8

const FRAME_DURATION_SEC = 1.0 / 60.0


func _freeze_frame(duration_frames: int) -> void:
	Engine.time_scale = 0.0
	await get_tree().create_timer(FRAME_DURATION_SEC * duration_frames, true, false, true).timeout
	Engine.time_scale = 1.0


func short() -> void:
	_freeze_frame(duration_frames)


func long() -> void:
	_freeze_frame(duration_frames_long)
