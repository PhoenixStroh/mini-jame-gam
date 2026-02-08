extends Node

signal audio_level_changed

var audio_level: int = 0


func set_audio_level(new_audio_level:int) -> void:
    audio_level = new_audio_level
    audio_level_changed.emit()