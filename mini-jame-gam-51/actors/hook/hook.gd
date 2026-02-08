extends CharacterBody2D

signal caught_fish(fish:Fish)

@export var speed = 400
var fish_in_range: Fish


func _physics_process(_delta):
	get_input()
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("catch") and fish_in_range != null:
		caught_fish.emit(fish_in_range)


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.owner is Fish:
		fish_in_range = area.owner


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.owner == fish_in_range:
		fish_in_range = null
