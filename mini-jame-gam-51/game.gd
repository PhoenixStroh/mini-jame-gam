extends Node2D

signal changed_fishing(fishing: int)

@export var label: Label
@export var fish_picture: TextureRect
@export var options_menu_parent: Control
@export var fish_guy_models: FishGuyModels
@export var hook: Hook

var fishing: bool = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("catch"):
		if not fishing:
			fishing = true
			changed_fishing.emit(fishing)
			hook.can_catch = true
			fish_guy_models.play("line_idle")
		elif fishing:
			fishing = false
			changed_fishing.emit(fishing)
			hook.reset()
			fish_guy_models.play("idle_bounce")
	if event.is_action_pressed("ui_cancel"):
		options_menu_parent.visible = !options_menu_parent.visible 


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	fish_picture.visible = true

	fish_guy_models.increase_bounce()
	label.text = fish.species_catch_text
	fish_picture.texture = fish.species_picture
	await get_tree().create_timer(2).timeout

	label.visible = false
	fish_picture.visible = false


func _on_options_menu_back_requested() -> void:
	options_menu_parent.visible = !options_menu_parent.visible 
