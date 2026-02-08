class_name Fish
extends Sprite2D

@export var start_point: Node2D
@export var end_point: Node2D
@export var movement_duration: float = 1.0

var _start_position: Vector2
var _end_position: Vector2
var _movement_tween: Tween


func _ready() -> void:
	_start_position = start_point.global_position
	_end_position = end_point.global_position
	
	# Move the fish.
	_movement_tween = get_tree().create_tween().set_loops()
	_movement_tween.tween_property(self, "global_position", _start_position, movement_duration).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	_movement_tween.tween_interval(2)
	_movement_tween.tween_property(self, "global_position", _end_position, movement_duration).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	_movement_tween.tween_interval(2)
