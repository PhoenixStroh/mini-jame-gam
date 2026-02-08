extends Node2D

signal decrease_volume
signal increase_volume

@export var label: Label
@export var fish_picture: TextureRect


func _ready() -> void:
	for fish:Fish in get_tree().get_nodes_in_group("fish"):
		decrease_volume.connect(fish.decrease_volume)
		increase_volume.connect(fish.increase_volume)


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	fish_picture.visible = true

	label.text = fish.species_catch_text
	fish_picture.texture = fish.species_picture
	await get_tree().create_timer(2).timeout

	label.visible = false
	fish_picture.visible = false


func _on_increase_volume_button_pressed() -> void:
	increase_volume.emit()


func _on_decrease_volume_button_pressed() -> void:
	decrease_volume.emit()
