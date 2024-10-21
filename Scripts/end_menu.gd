extends Control

@onready var loseScreen = %"Lose Screen"
@onready var winScreen = %"Win Screen"
@onready var restart = $Restart
@onready var quit_to_main_menu = $"Quit to main menu"


func _ready():
	if loseScreen.visible == true or winScreen.visible == true:
		restart.disabled == false
		quit_to_main_menu.disabled == false

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_quit_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
