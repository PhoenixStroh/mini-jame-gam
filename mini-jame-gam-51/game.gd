extends Node2D

@export var label: Label
@export var fish_picture: TextureRect
@export var options_menu_parent: Control


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		options_menu_parent.visible = !options_menu_parent.visible 


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	fish_picture.visible = true

	label.text = fish.species_catch_text
	fish_picture.texture = fish.species_picture
	await get_tree().create_timer(2).timeout

	label.visible = false
	fish_picture.visible = false


func _on_options_menu_back_requested() -> void:
	options_menu_parent.visible = !options_menu_parent.visible 
