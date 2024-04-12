@tool
@icon("res://addons/sfx_manager/icons/SoundEffectMeta.svg")

class_name SoundEffectMeta extends Resource

@export_category("Volume")

@export_range(-80.0, 24.0, 0.1) var volume_db: float = 0.0:
	set(value):
		if volume_db == value:
			return
		volume_db = value
		emit_changed()

@export_range(0.0, 24.0, 0.1) var volume_variance_db: float = 0.0:
	set(value):
		if volume_variance_db == value:
			return
		volume_variance_db = value
		emit_changed()

@export_category("Pitch")

@export_range(0.01, 4.0, 0.01) var pitch_scale: float = 1.0:
	set(value):
		if pitch_scale == value:
			return
		pitch_scale = value
		emit_changed()

@export_range(0.0, 1.0, 0.05) var pitch_variance: float:
	set(value):
		if pitch_variance == value:
			return
		pitch_variance = value
		emit_changed()
		
func get_volume_db() -> float:
	return volume_db + SfxManager.get_variance(volume_variance_db)
	
func get_pitch_scale() -> float:
	return pitch_scale + SfxManager.get_variance(pitch_variance)
