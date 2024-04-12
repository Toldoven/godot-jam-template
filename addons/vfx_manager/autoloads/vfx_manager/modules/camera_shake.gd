class_name CameraShake extends Node

@export var noise: FastNoiseLite

@export var drain = true
@export var drain_speed: float = 80.0

@export var max_amount: float = 100.0
	
	
var amount: float = 0.0:
	set(value):
		amount = min(value, max_amount)


func set_min(set_amount: float):
	amount = max(amount, set_amount)


func _get_noise(seed: int) -> float:
	noise.seed = seed
	return noise.get_noise_1d(Time.get_ticks_msec())	


func get_offset() -> Vector2:
	return Vector2(
		_get_noise(1346) * amount,
		_get_noise(6234) * amount,
	)


func _process(delta: float) -> void:
	if drain:
		amount = max(0.0, amount - drain_speed * delta)
