extends Node2D

@export var square_count := 30
@export var min_size := 10.0
@export var max_size := 40.0
@export var min_speed := 50.0
@export var max_speed := 150.0

var squares: Array[Node2D] = []

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	randomize()

	for i in square_count:
		create_square()


func create_square():
	var container := Node2D.new()
	add_child(container)

	var size := randf_range(min_size, max_size)

	# Quadrado de trás / sombra
	var shadow := ColorRect.new()
	shadow.size = Vector2(size, size)
	shadow.position = Vector2(6, 6)
	shadow.color = Color("392447ff")
	container.add_child(shadow)

	# Quadrado roxo
	var square := ColorRect.new()
	square.size = Vector2(size, size)
	square.color = Color("aa75ffff")
	container.add_child(square)

	# Posição inicial
	container.position = Vector2(
		randf_range(0, get_viewport_rect().size.x),
		randf_range(-500, get_viewport_rect().size.y)
	)

	# Dados do quadrado
	container.set_meta("speed", randf_range(min_speed, max_speed))

	squares.append(container)


func _process(delta):
	var screen_height := get_viewport_rect().size.y

	for square in squares:
		var speed: float = square.get_meta("speed")

		square.position.y += speed * delta

		# Quando sair da tela, volta para cima
		if square.position.y > screen_height + 50:
			square.position.y = -randf_range(50, 300)
			square.position.x = randf_range(
				0,
				get_viewport_rect().size.x
			)

			# Nova velocidade aleatória
			square.set_meta(
				"speed",
				randf_range(min_speed, max_speed)
			)
