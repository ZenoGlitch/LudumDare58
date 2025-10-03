extends Node2D

@onready var main_canvas_layer = $MainCanvasLayer
@onready var start_game_button = $MainCanvasLayer/StartGameButton
@onready var credits_button = $MainCanvasLayer/CreditsButton
@onready var quit_button = $MainCanvasLayer/QuitButton

@onready var credits_canvas_layer = $CreditsCanvasLayer
@onready var back_to_main_button = $CreditsCanvasLayer/BackToMainButton


func _ready():
	credits_canvas_layer.hide()

func _on_start_game_button_button_up():
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
