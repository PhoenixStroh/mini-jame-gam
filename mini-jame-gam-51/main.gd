extends Control

@export var main_menu: Control
@export var options_menu: Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	main_menu.visible = false
	options_menu.visible = true


func _on_options_menu_back_requested() -> void:
	main_menu.visible = true
	options_menu.visible = false
