class_name FishGuyModels
extends Node3D

@export var animation_tree: AnimationTree
@export var camera_animation_player: AnimationPlayer


func _ready() -> void:
	camera_animation_player.play("introduction")
	play("idle_bounce")


func play(animation_name:String) -> void:
	var state_machine = animation_tree["parameters/playback"]
	state_machine.travel(animation_name)


func increase_bounce() -> void:
	animation_tree["parameters/idle_bounce/blend_position"] = animation_tree["parameters/idle_bounce/blend_position"] + 0.2
