extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(sortearUmaJogadora(jogadoras))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


const jogadoras: Array[PlayerData] = [
	preload("res://assets/resources/jogadoras/GACHA/Amelie_Kyliane.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Cassia_Monteiro.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Cristiane_Rosa.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Erika_von_Neuer.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Karine_De_Bruyne.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Layla_Hakimi.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Leona_Meissi.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Mariana_Dias.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Nayara.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Teodora_Nantes.tres"),
	preload("res://assets/resources/jogadoras/GACHA/Veronica_Van_Dijk.tres")
]

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/tela inicial.tscn")


func sortearUmaJogadora(array:Array) -> String:
	var sorteada = array.pick_random()
	return sorteada.name
	
