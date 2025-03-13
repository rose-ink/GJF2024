extends Node
@onready var bunny = %bunny
@onready var cat = %cat
@onready var win_area = $"../win area"
@onready var maxHealth = 5
@onready var currentHealth = maxHealth

signal healthChanged
var score = 0

func _ready():
	cat.is_dead.connect(health_updated)
	bunny.is_dead.connect(health_updated)

func add_point():
	score += 1
	print(score)

func _on_win_area_body_entered(_body: PhysicsBody2D):
	if (cat in win_area.get_overlapping_bodies() and bunny in win_area.get_overlapping_bodies()) and score >= 2:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")

func health_updated():
	currentHealth-=1
	healthChanged.emit()
	if currentHealth <= 0:
		await get_tree().create_timer(.5).timeout
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/lose_menu.tscn")
		
		
