class_name AudioManager
extends Node

@export var overwater_player: PackedScene

func on_changed_fishing(is_fishing: bool):
    var over_volume := -999 if is_fishing else 0
    var under_volume := 0 if is_fishing else -99

    print("HEREREREREERREERERER")

    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Overwater"), over_volume)
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Underwater"), under_volume)

func on_during_fish_splash(fish: Fish):
    add_fish(fish)

func add_fish(fish: Fish):
    print("HERE???")
    var instance : AudioStreamPlayer = overwater_player.instantiate()
    add_child(instance)

    instance.stream = fish._audio.stream
    instance.play(fish._audio.get_playback_position())
