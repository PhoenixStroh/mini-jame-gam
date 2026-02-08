extends Node2D

@export var label: Label
@export var fish_picture: TextureRect


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	fish_picture.visible = true
	
	label.text = "You caught a " + fish.species_name + "!"
	fish_picture.texture = fish.species_picture
	await get_tree().create_timer(2).timeout

	label.visible = false
	fish_picture.visible = false
