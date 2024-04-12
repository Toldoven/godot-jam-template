extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer

var music_tween: Tween = null

func kill_music_tween() -> void:
	if music_tween != null and music_tween.is_valid():
		music_tween.kill()


func play_music_with_delay(stream: AudioStream, time_sec: float) -> void:

	if music_tween and music_tween.is_running():
		await music_tween.finished
	
	if music_player.playing and music_player.stream.resource_path == stream.resource_path:
		return

	if music_player.playing:
		await stop_music_with_fade()
		
	await get_tree().create_timer(time_sec).timeout
	play_music(stream)
	


func play_music(stream: AudioStream, volume: float = 1.0) -> void:
	if music_tween != null and music_tween.is_running():
		await music_tween.finished
	music_player.stream = stream
	music_player.volume_db = linear_to_db(volume)
	music_player.play()


func set_linear_music_volume(linear_volume: float) -> void:
	music_player.volume_db = linear_to_db(linear_volume)


func stop_music_with_fade(duration_sec: float = 1.0) -> void:
	if music_tween != null and music_tween.is_running():
		await music_tween.finished
	music_tween = music_player.create_tween()
	music_tween.tween_method(
		set_linear_music_volume,
		1.0,
		0.0,
		duration_sec
	).set_trans(Tween.TRANS_SINE)
	music_tween.tween_callback(func() -> void:
		music_player.stop()
		music_player.volume_db = linear_to_db(1.0)
	)
	await music_tween.finished


func stop_music() -> void:
	music_player.stop()


func stop_music_immediately() -> void:
	kill_music_tween()
	music_player.stop()
