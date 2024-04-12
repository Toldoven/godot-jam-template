class_name HitFlashComponent extends CanvasGroup

@export var health_component: HealthComponent

var _tween: Tween = null

func _ready() -> void:
	var shader_material := ShaderMaterial.new()
	shader_material.shader = preload("res://shaders/hit_flash.gdshader")
	material = shader_material
	
	if is_instance_valid(health_component):
		health_component.damage.connect(func(_damage: float) -> void:
			flash()
		)


func flash() -> void:
	if _tween:
		_tween.kill()
	
	_tween = create_tween()
	_tween.tween_callback(_change_blend_value.bind(1.0))
	_tween.tween_interval(0.05)
	_tween.tween_method(_change_blend_value, 1.0, 0.0, 0.1).set_trans(Tween.TRANS_CUBIC)
	

func _change_blend_value(value: float) -> void:
	(material as ShaderMaterial).set_shader_parameter("blend", value)
