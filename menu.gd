extends Control

# Adicionamos uma tipagem estática (-> void) para melhor performance
# Criamos uma variável global no script para guardar o StyleBox padrão do botão


func _process(delta: float) -> void:
	pass
	
func _ready() -> void:
	pass
		

	
func fade_to_color(obj: Object, color: Color, timeInSeconds: float) -> void:
	if not is_instance_valid(obj):
		return
	# Se não conseguimos pegar o padrão no _ready por algum motivo, usamos o atual
	#var base_style = stylebox_padrao if stylebox_padrao else obj.get_theme_stylebox("normal", "Button") as StyleBoxFlat
	
	#if base_style is StyleBoxFlat:
		# Sempre duplicamos a partir do padrão real do jogo, nunca do modificado
	var styleBox_novo = obj.stylebox_padrao.duplicate() as StyleBoxFlat
	styleBox_novo.bg_color = Color.GREEN
	obj.add_theme_stylebox_override("normal", styleBox_novo)
	# Cria e gerencia o tween com segurança
	var tween = create_tween()
	
	tween.tween_property(obj, "modulate", color, timeInSeconds)
	
	tween.tween_property(obj, "modulate", Color(1, 1, 1), 0)
	
	await tween.finished
	
	# Quando tudo termina, devolvemos o visual padrão real armazenado
	#if base_style:
	obj.add_theme_stylebox_override("normal", obj.stylebox_padrao)
