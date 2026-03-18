extends Control


const CartaNormal   = preload("res://cenas/cartas/carta_normal.tscn")
const CartaRara     = preload("res://cenas/cartas/carta_rara.tscn")
const CartaLendaria = preload("res://cenas/cartas/carta_lendaria.tscn")

@onready var container = $GridContainer

var jogadoras_teste = [
	preload("res://assets/resources/jogadoras/GACHA/Cristiane_Rosa.tres"),
	preload("res://assets/resources/jogadoras/Corinthians/Mia_de_Graaf.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Nayara.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Leona_Meissi.tres")
]


func _ready() -> void:
	for jogador in jogadoras_teste:
		var carta
		match jogador.raridade:
			"Normal":   carta = CartaNormal.instantiate()
			"Rara":     carta = CartaRara.instantiate()
			"Lendaria": carta = CartaLendaria.instantiate()
		
		container.add_child(carta)
		carta.setup(jogador)
