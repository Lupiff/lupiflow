extends AudioStreamPlayer

@export var musicas: Array[AudioStream] = []
@export var delay_inicial: float = 1.0
@export var delay_entre_musicas: float = 1.5
@export var duracao_fade: float = 1.0
@export var volume_alvo: float = -20.0

var indice_atual: int = -1
var tocando: bool = false

func _ready():
	volume_db = -80.0
	await get_tree().create_timer(delay_inicial).timeout
	_loop_musicas()

func _loop_musicas():
	while true:
		_escolher_proxima()
		stream = musicas[indice_atual]
		play()
		await _fade_in()
		
		# Espera a música terminar
		await get_tree().create_timer(stream.get_length() - duracao_fade).timeout
		
		await _fade_out()
		await get_tree().create_timer(delay_entre_musicas).timeout

func _escolher_proxima():
	if musicas.is_empty():
		return
	var novo_indice = indice_atual
	if musicas.size() > 1:
		while novo_indice == indice_atual:
			novo_indice = randi() % musicas.size()
	else:
		novo_indice = 0
	indice_atual = novo_indice

func _fade_in():
	var tween = create_tween()
	tween.tween_property(self, "volume_db", volume_alvo, duracao_fade)
	await tween.finished

func _fade_out():
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -80.0, duracao_fade)
	await tween.finished
