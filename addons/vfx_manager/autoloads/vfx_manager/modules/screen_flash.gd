class_name ScreenFlash extends Node

@export var _rect: ColorRect

var _tween: Tween = null


func _screen_flash(start_transparency: float, duration_sec: float) -> void:
	if _tween:
		_tween.kill()
		
	_rect.color = Color(Color.WHITE, start_transparency)
	_tween = create_tween()
	_tween.tween_property(_rect, "color", Color.TRANSPARENT, duration_sec)


func short() -> void:
	_screen_flash(0.2, 0.2)
	
	
func short_lite() -> void:
	_screen_flash(0.1, 0.2)
