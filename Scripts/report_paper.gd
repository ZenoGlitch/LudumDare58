extends Node2D

@onready var sprite_2d = $Sprite2D

var flagged_for_ban : bool = false
var is_dragging : bool = false
var mouse_offset = Vector2.ZERO

var profanity : bool = false
var romance : bool = false
var medicine : bool = false
var magic : bool = false
var dolphin : bool = false


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

func set_texture(p_texture : Texture2D):
	sprite_2d.texture = p_texture
	
func set_spawn_position(p_pos : Vector2):
	global_position = p_pos
	pass

func set_ban_flags(idx, idx1, idx2, idx3, idx4):
	var arr = []
	arr.push_back(idx)
	arr.push_back(idx1)
	arr.push_back(idx2)
	arr.push_back(idx3)
	arr.push_back(idx4)
	
	for a in arr:
		if a == -1:
			arr.pop_at(a)
			
		pass
		
	pass
