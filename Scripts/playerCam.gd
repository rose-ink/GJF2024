extends Camera2D

@onready var player1 = %bunny
@onready var player2 = %cat


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = (player1.global_position + player2.global_position) * 0.5
	
	var zoomFac1 = abs(player1.global_position.x - player2.global_position.x)/2
	var zoomFac2 = abs(player1.global_position.y - player2.global_position.y)/2
	var zoomFac = (12000.0/min(max(max(zoomFac1, zoomFac2), 20),115))**0.35
	
	zoom = Vector2(zoomFac, zoomFac)
