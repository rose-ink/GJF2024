extends TextureProgressBar

@onready var game_manager = %"Game Manager"


func _ready():
	game_manager.healthChanged.connect(update)
	update()

func update():
	value = game_manager.currentHealth
