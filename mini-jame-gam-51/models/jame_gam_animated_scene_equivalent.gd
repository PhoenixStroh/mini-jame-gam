class_name FishGuyModels
extends Node3D

@export var animation_tree: AnimationTree


func _ready() -> void:
	play("idle_bounce")


func play(animation_name:String) -> void:
	var state_machine = animation_tree["parameters/playback"]
	state_machine.travel(animation_name)
