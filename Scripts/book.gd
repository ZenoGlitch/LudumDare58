class_name Book
extends Node2D

var is_dragging = false
var mouse_offset = Vector2.ZERO

@export var code = []
#@export var code2 = []

func _ready():
	pass

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_dragging = true
				mouse_offset = global_position - get_global_mouse_position()
			else:
				is_dragging = false
	elif event is InputEventMouseMotion:
		if is_dragging:
			global_position = get_global_mouse_position() + mouse_offset
