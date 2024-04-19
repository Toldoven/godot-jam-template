class_name ScreenFade extends Node

@export var _rect: ColorRect

var _tween: Tween = null


func fade_in_fast() -> void:
	if _tween:
		_tween.kill()
	
	_tween = create_tween()
	_tween.set_parallel(true)
	_tween.set_ease(Tween.EASE_IN)
	_tween.set_trans(Tween.TRANS_CUBIC)
	_tween.tween_property(_rect, "color", Color.BLACK, 0.4)
	_tween.tween_method(_change_fade_volume, 1.0, 0.0, 0.5)
	await _tween.finished
	
	
func fade_out_fast() -> void:
	if _tween:
		_tween.kill()
	
	_rect.color = Color(Color.BLACK, 0.4)
	_tween = create_tween()
	_tween.set_parallel(true)	
	_tween.set_trans(Tween.TRANS_EXPO)
	_tween.tween_property(_rect, "color", Color(Color.BLACK, 0.0), 0.2)
	_tween.tween_method(_change_fade_volume, 0.0, 1.0, 0.4)
	await _tween.finished
	

@onready var _fade_bus_index := AudioServer.get_bus_index("Fade")

func _change_fade_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(_fade_bus_index, linear_to_db(volume))
