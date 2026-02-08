extends Node2D

@export var label: Label


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	await get_tree().create_timer(2).timeout
	label.visible = false
