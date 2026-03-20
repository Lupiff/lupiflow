extends Control

const CartaJogador = preload("res://cenas/cartas/carta_rara.tscn")

func _ready() -> void:
	# carrega um jogador de teste
	var jogador = preload("res://assets/resources/jogadoras/Flamengo/Lais_Pereira.tres")
	
	# instancia a carta
	var carta = CartaJogador.instantiate()
	add_child(carta)
	carta.setup(jogador)
