extends Camera2D

@export var world_size := Vector2(1920, 1080)

func _ready():
	global_position = world_size / 2.0
	enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
