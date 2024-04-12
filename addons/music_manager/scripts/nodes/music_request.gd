class_name MusicRequest extends Node

@export var autoplay: bool = true
@export var stream: AudioStream
@export var delay_sec: float = 0.0

@export var request_stop: bool = false


func request() -> void:
	
	if request_stop:
		MusicManager.stop_music_with_fade()
		return
	
	if stream == null:
		push_warning("MusicManager at %s doesn't have a stream" % get_path())
		return
	
	MusicManager.play_music_with_delay(stream, delay_sec)
	
	
func _ready() -> void:
	if autoplay:
		request()
