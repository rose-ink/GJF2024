extends Control

@onready var lose_screen = %"Lose Screen"
@onready var restart = $Restart
@onready var quit_to_main_menu = $"Quit to main menu"


func _ready():
	if lose_screen.visible == true:
		restart.disabled == false
		quit_to_main_menu.disabled == false

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/grass_area.tscn")

func _on_quit_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
func _on_lose_screen_tree_entered():
	var lose_screen = %"Lose Screen"
	lose_screen.visible == true
