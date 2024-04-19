class_name CustomButton extends Button

@export var pressed_sound_effect: SoundEffect


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	if pressed_sound_effect:
		SfxManager.play_sfx(pressed_sound_effect)
