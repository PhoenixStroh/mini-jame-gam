extends Node2D

@export var label: Label
@export var fish_picture: TextureRect
@export var splash_animation: AnimatedSprite2D
@export var options_menu_parent: Control
@export var fish_guy_models: FishGuyModels
@export var hook: Hook

var fishing: bool = false
var intro_finished: bool = false


func _ready() -> void:
	fish_guy_models.intro_finished.connect(func(): intro_finished = true)
	fish_guy_models.play_intro()


func _input(event: InputEvent) -> void:
	if intro_finished:
		if event.is_action_pressed("catch"):
			if not fishing:
				fishing = true
				hook.can_catch = true
				fish_guy_models.play("line_idle")
			elif fishing:
				fishing = false
				hook.reset()
				fish_guy_models.play("idle_bounce")
		if event.is_action_pressed("ui_cancel"):
			options_menu_parent.visible = !options_menu_parent.visible 


func _on_hook_caught_fish(fish: Fish) -> void:
	label.visible = true
	fish_picture.visible = true
	splash_animation.visible = true

	splash_animation.play("default")
	fish_guy_models.increase_bounce()
	label.text = fish.species_catch_text
	fish_picture.texture = fish.species_picture
	await get_tree().create_timer(2).timeout
	splash_animation.play_backwards("default")
	await splash_animation.animation_finished
	
	label.visible = false
	fish_picture.visible = false
	splash_animation.visible = false


func _on_options_menu_back_requested() -> void:
	options_menu_parent.visible = !options_menu_parent.visible 
