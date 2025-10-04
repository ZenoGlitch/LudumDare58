class_name Book
extends Node2D

var is_dragging = false
var mouse_offset = Vector2.ZERO

#@export var code = []
#@export var code2 = []
#@export var code3 = []
#@export var code4 = []
#@export var code5 = []
#var all_book_codes = []

@export var profanity : bool = false
@export var romance : bool = false
@export var medicine : bool = false
@export var magic : bool = false
@export var dolphin : bool = false
var ban_flags = [-1, -1, -1, -1, -1]
var book_codes = []

func _ready():
	if profanity:
		ban_flags[0] = 1
	if romance:
		ban_flags[1] = 2
	if medicine:
		ban_flags[2] = 3
	if magic:
		ban_flags[3] = 4
	if dolphin:
		ban_flags[4] = 5
			
	
	for m in ban_flags:
		print(m)
		match m:
			-1:
				pass
			1:
				var arr = [1,2,3,4]
				book_codes.push_back(arr)
			2:
				var arr = [1,2,3,4]
				book_codes.push_back(arr)
			3:
				var arr = [1,2,3,4]
				book_codes.push_back(arr)
			4:
				var arr = [1,2,3,4]
				book_codes.push_back(arr)
			5:
				var arr = [1,2,3,4]
				book_codes.push_back(arr)	

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
