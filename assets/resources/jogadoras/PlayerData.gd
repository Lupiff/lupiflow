extends Resource
class_name PlayerData

@export var name: String = ""
@export var number: int = 0       # número da camisa
@export var position: String = "" # GOL, ZAG, MEI, ATA...
@export var chute: int = 0
@export var velocidade: int = 0
@export var passe: int = 0
@export var defesa: int = 0
@export var drible: int = 0
@export var folego: int = 0
@export var photo: Texture2D
@export var raridade: String = ""

func get_overall() -> int:
	return (chute + velocidade + passe + defesa + drible + folego) / 6
