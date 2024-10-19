extends Camera2D

@onready var player2 = $"../Players/bunny"
@onready var player1 = $"../Players/cat"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = (player1.global_position + player2.global_position) * 0.5
	var zoomFac1 = abs(player1.global_position.x - player2.global_position.x) * 0.5
	var zoomFac2 = abs(player1.global_position.y - player2.global_position.y) * 0.5
	var zoomFac = max(max(zoomFac1, zoomFac2), 0.5)
	print(zoomFac, zoomFac1, zoomFac2)
	
	zoom = Vector2(zoomFac, zoomFac)
