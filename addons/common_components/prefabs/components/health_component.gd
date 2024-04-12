class_name HealthComponent extends Node

signal death
signal damage(damage_amount: float)
signal heal(heal_amount: float)
signal health_change(new_health: float)

@export var max_health: float

var _dead: bool = false

func is_dead() -> bool:
	return _dead
	
	
func is_full_health() -> bool:
	return health == max_health
	
@onready var _health: float = max_health

var health: float:
	get:
		return _health
	set(value):
		
		if _dead:
			push_warning("Can't change health after death: %s" % get_path())
			return
		
		var new_health := clampf(value, 0.0, max_health)
		
		if new_health < health:
			damage.emit(health - new_health)
		elif new_health > health:
			heal.emit(new_health - health)
		else:
			return
			
		_health = new_health
		health_change.emit(new_health)
		
		if _health < 0.1:
			_health = 0.0
			death.emit()
			_dead = true

# Returns a float from 0.0 to 1.0
func get_health_percentage() -> float:
	return health / max_health
