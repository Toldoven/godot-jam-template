@tool

class_name VolumeSlider extends HSlider

@export var audio_bus: StringName = &"":
	set(value):
		audio_bus = value
		update_bus_index()

@onready var audio_bus_index: int = -1

func update_bus_index() -> void:
	audio_bus_index = AudioServer.get_bus_index(audio_bus)
	update_configuration_warnings()


func _get_configuration_warnings() -> PackedStringArray:
	if audio_bus_index == -1:
		if audio_bus == &"":
			return ["Specify an audio bus in the exported properties"]
		else:
			return ["Audio bus '%s' doesn't exist" % audio_bus]
	else:
		return []


func _ready() -> void:	
	update_bus_index()
	
	max_value = 1
	step = 0.01
	
	if audio_bus_index != -1:
		value = db_to_linear(AudioServer.get_bus_volume_db(audio_bus_index))
	
	value_changed.connect(_on_value_changed)	


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_index, linear_to_db(value))
