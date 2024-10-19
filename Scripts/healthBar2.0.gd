extends TextureProgressBar

@onready var kill_zone = $"../../Kill Zone"

func _ready():
	kill_zone.healthChanged.connect(update)
	update()

func update():
	value = kill_zone.currentHealth
