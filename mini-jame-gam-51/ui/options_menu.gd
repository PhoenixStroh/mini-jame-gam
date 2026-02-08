extends MarginContainer

signal back_requested

@export var label: Label


func _ready() -> void:
	label.text = "The current volume is " + str(OptionsManager.audio_level) + "."


func _on_increase_volume_button_pressed() -> void:
	OptionsManager.set_audio_level(OptionsManager.audio_level+1)
	label.text = "The current volume is " + str(OptionsManager.audio_level) + "."


func _on_decrease_volume_button_pressed() -> void:
	OptionsManager.set_audio_level(OptionsManager.audio_level-1)
	label.text = "The current volume is " + str(OptionsManager.audio_level) + "."


func _on_back_button_pressed() -> void:
	back_requested.emit()
