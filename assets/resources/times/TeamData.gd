# TeamData.gd
extends Resource
class_name TeamData

@export var name: String = ""
@export var stars: int = 0
@export var texture: Texture2D
@export var players: Array[PlayerData] = []

func get_overall() -> int:
	if players.is_empty():
		return 0
	
	var total = 0
	for player in players:
		total += player.get_overall()
	
	return total / players.size()
