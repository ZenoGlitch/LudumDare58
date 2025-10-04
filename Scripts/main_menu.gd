extends Node2D

@onready var main_canvas_layer = $MainCanvasLayer
@onready var start_game_button = $MainCanvasLayer/StartGameButton
@onready var credits_button = $MainCanvasLayer/CreditsButton
@onready var quit_button = $MainCanvasLayer/QuitButton

@onready var credits_canvas_layer = $CreditsCanvasLayer
@onready var back_to_main_button = $CreditsCanvasLayer/BackToMainButton
@onready var text_edit = $CreditsCanvasLayer/TextEdit

signal game_start

func _ready():
	credits_canvas_layer.hide()

func _on_start_game_button_button_up():
	main_canvas_layer.hide()
	set_all_mouse_filters_to_ignore()
	game_start.emit()
	self.queue_free()
	pass # Replace with function body.

func _on_credits_button_button_up():
	credits_canvas_layer.show()
	main_canvas_layer.hide()
	pass # Replace with function body.

func _on_quit_button_button_up():
	get_tree().quit()
	pass # Replace with function body.

func _on_back_to_main_button_button_up():
	credits_canvas_layer.hide()
	main_canvas_layer.show()
	pass # Replace with function body.
	
func set_all_mouse_filters_to_ignore():
	back_to_main_button.mouse_filter = back_to_main_button.MOUSE_FILTER_IGNORE
	text_edit.mouse_filter = text_edit.MOUSE_FILTER_IGNORE
	quit_button.mouse_filter = quit_button.MOUSE_FILTER_IGNORE
	credits_button.mouse_filter = credits_button.MOUSE_FILTER_IGNORE
	start_game_button.mouse_filter = start_game_button.MOUSE_FILTER_IGNORE
	
	pass
