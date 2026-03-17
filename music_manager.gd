extends AudioStreamPlayer

@export var musicas: Array[AudioStream] = []
@export var delay_inicial: float = 1.0
@export var delay_entre_musicas: float = 1.5
@export var duracao_fade: float = 1.0
@export var volume_alvo: float = -20.0

var indice_atual: int = -1
var ativo: bool = true

func _ready():
	volume_db = -80.0
	
	if musicas.is_empty():
		push_warning("Nenhuma música atribuída.")
		return
	
	await get_tree().create_timer(delay_inicial).timeout
	_loop_musicas()

func _loop_musicas():
	while ativo:
		_escolher_proxima()
		
		if indice_atual < 0:
			return
		
		stream = musicas[indice_atual]
		play()
		
		await _fade_in()
		
		var duracao = stream.get_length()
		
		# Proteção contra duração inválida
		var tempo_espera = max(0.1, duracao - duracao_fade)
		
		await get_tree().create_timer(tempo_espera).timeout
		
		await _fade_out()
		await get_tree().create_timer(delay_entre_musicas).timeout

func _escolher_proxima():
	if musicas.is_empty():
		return
	
	var novo = indice_atual
	
	if musicas.size() > 1:
		while novo == indice_atual:
			novo = randi() % musicas.size()
	else:
		novo = 0
	
	indice_atual = novo

func _fade_in():
	var tween = create_tween()
	tween.tween_property(self, "volume_db", volume_alvo, duracao_fade)
	await tween.finished

func _fade_out():
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -80.0, duracao_fade)
	await tween.finished
