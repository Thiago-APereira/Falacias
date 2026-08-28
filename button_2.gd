extends Button
@onready var menu  = $"../.."
var stylebox_padrao: StyleBoxFlat:
	set(value):
		stylebox_padrao = value
	get:
		return stylebox_padrao	
	# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Guardamos o visual original real do botão antes de qualquer clique acontecer
	# Certifique-se de que o caminho apontando para o seu botão está correto aqui ($ColorRect/Button)
	stylebox_padrao = self.get_theme_stylebox("normal", "Button") as StyleBoxFlat


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _pressed() -> void:
	add_theme_stylebox_override("normal", stylebox_padrao)
	menu.fade_to_color(self, Color.REBECCA_PURPLE, 1)
	
