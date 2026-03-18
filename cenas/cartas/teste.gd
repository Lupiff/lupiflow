extends Control

@onready var carta_normal = $carta_normal
@onready var carta_rara = $carta_rara
@onready var carta_lendaria = $carta_lendaria
@onready var carta_lendaria2 = $carta_lendaria2
@onready var carta_lendaria3 = $carta_lendaria3


func _ready() -> void:
	var jogador1 = preload("res://assets/resources/jogadoras/Flamengo/Varela.tres")
	carta_normal.setup(jogador1)
	
	var jogador2 = preload ("res://assets/resources/jogadoras/GACHA/Cristiane_Rosa.tres")
	carta_lendaria.setup(jogador2)
	
	var jogador3 = preload("res://assets/resources/jogadoras/Flamengo/Samira.tres")
	carta_rara.setup(jogador3)
	
	
	var jogador4 = preload("res://assets/resources/jogadoras/GACHA/Nayara.tres")
	carta_lendaria2.setup(jogador4)
	
	var jogador5 = preload("res://assets/resources/jogadoras/GACHA/Leona_Meissi.tres")
	carta_lendaria3.setup(jogador5)
