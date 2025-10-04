extends Node

@onready var world_scene = $WorldScene
@onready var main_menu = $MainMenu

func _ready():
	world_scene.hide()
	main_menu.game_start.connect(on_game_start)
	
func on_game_start():
	world_scene.show()
