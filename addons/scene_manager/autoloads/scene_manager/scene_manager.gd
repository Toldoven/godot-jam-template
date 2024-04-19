extends Node

var transitions: Dictionary = {
	"fade_in": func() -> void:
		await VfxManager.screen_fade.fade_in_fast(),
	"fade_out": func() -> void:
		await VfxManager.screen_fade.fade_out_fast(),
}

const DEFAULT_IN_TRANSITION: String = "fade_in"
const DEFAULT_OUT_TRANSITION: String = "fade_out"
const DEAFULT_MIN_WAIT_TIME_SEC: float = 0.5


func _call_with_transitions(
	callable: Callable,
	in_transition: String,
	out_transition: String,
	min_wait_time_sec: float,
) -> void:
	var tree := get_tree()
	
	var in_transition_callable := transitions[in_transition] as Callable
	await in_transition_callable.call()
	
	callable.call()
	
	var timer = tree.create_timer(min_wait_time_sec)
	
	# https://github.com/godotengine/godot/issues/86286
	await tree.process_frame
	await tree.process_frame
	
	if timer.time_left != 0.0:
		await timer.timeout
		
	var out_transition_callable := transitions[out_transition] as Callable
	await out_transition_callable.call()


func change_scene_to_file(
	path: String,
	in_transition: String = DEFAULT_IN_TRANSITION,
	out_transition: String = DEFAULT_OUT_TRANSITION,
	min_wait_time_sec: float = DEAFULT_MIN_WAIT_TIME_SEC,
) -> void:
	var callable = get_tree().change_scene_to_file.bind(path)
	await _call_with_transitions(callable, in_transition, out_transition, min_wait_time_sec)
	


func change_scene_to_packed(
	scene: PackedScene,
	in_transition: String = DEFAULT_IN_TRANSITION,
	out_transition: String = DEFAULT_OUT_TRANSITION,
	min_wait_time_sec: float = DEAFULT_MIN_WAIT_TIME_SEC,
) -> void:
	var callable = get_tree().change_scene_to_packed.bind(scene)
	await _call_with_transitions(callable, in_transition, out_transition, min_wait_time_sec)


func reload_current_scene(
	in_transition: String = DEFAULT_IN_TRANSITION,
	out_transition: String = DEFAULT_OUT_TRANSITION,
	min_wait_time_sec: float = DEAFULT_MIN_WAIT_TIME_SEC,
) -> void:
	var callable = get_tree().reload_current_scene
	await _call_with_transitions(callable, in_transition, out_transition, min_wait_time_sec)
