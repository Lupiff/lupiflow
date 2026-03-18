extends Control


# Called when the node enters the scene tree for the first time.
#Carrega as cenas das cartas
func _ready() -> void:
	pass
	


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


func sortearUmaJogadora(array:Array) -> PlayerData:
	var sorteada = array.pick_random()
	return sorteada
	

func descobrirRaridade(player:PlayerData) -> String:
	if player.raridade == "Lendaria":
		return "Lendaria"
	elif player.raridade == "Rara":
		return "Rara"
	else:
		return "Normal"



func _on_wish_x_1_pressed() -> void:
	const raraCena = preload("res://cenas/cartas/carta_rara.tscn")
	const lendariaCena = preload("res://cenas/cartas/carta_lendaria.tscn")
	const normalCena = preload("res://cenas/cartas/carta_normal.tscn")
	
	var jogadoraSorteada = sortearUmaJogadora(jogadoras)
	var raridade:String = descobrirRaridade(jogadoraSorteada)
	
	if raridade == "Rara":
		var spawnRara = raraCena.instantiate()
		add_child(spawnRara)
		spawnRara.setup(jogadoraSorteada)
		
	elif raridade == "Lendaria":
		var spawnLendaria = lendariaCena.instantiate()
		add_child(spawnLendaria)
		spawnLendaria.setup(jogadoraSorteada)
		
	else:
		var spawnNormal = normalCena.instantiate()
		add_child(spawnNormal)
		spawnNormal.setup(jogadoraSorteada)
		
