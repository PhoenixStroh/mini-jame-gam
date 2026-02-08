class_name AudioManager
extends Node

@export var overwater_player: PackedScene

func add_fish(fish: Fish):
    var instance : AudioStreamPlayer3D = overwater_player.instantiate()
    instance.stream = fish._audio.stream

    add_child(instance)