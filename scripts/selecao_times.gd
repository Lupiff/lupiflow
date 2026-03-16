extends Control

# aqui é pra importar o TeamData insano lá
@export var teams: Array[TeamData] = []

# é pra começar do primeiro time (o Flamengo é o Index=0, Corinthains Index=1, etc)
var current_index: int = 0

# variaveis como nós (a variavel team_name é um nó de label que ta ligada com o TimeNome (nome do nó dos nomes dos times))
@onready var team_name_label: Label      = $TimeNome
@onready var shield_texture: TextureRect = $Escudo_Time
@onready var overall_label: Label        = $OverallLabel
@onready var btn_prev: Button            = $BtnPrev
@onready var btn_next: Button            = $BtnNext
@onready var btn_select: Button          = $BtnSelect

# se a foto de algum time n carregar, vai pra aquele icon default do godot
var fallback_texture: Texture2D = preload("res://icon.svg")

func _ready() -> void:
	btn_prev.pressed.connect(_on_prev_pressed)
	btn_next.pressed.connect(_on_next_pressed)
	btn_select.pressed.connect(_on_select_pressed)
	_update_ui()

# btn de voltar time
func _on_prev_pressed() -> void:
	$ClickSound.play()
	current_index = (current_index - 1 + teams.size()) % teams.size()
	_update_ui()

#btn de próximo time
func _on_next_pressed() -> void:
	$ClickSound.play()
	current_index = (current_index + 1) % teams.size()
	_update_ui()

# btn de selecionar o time (ainda n funciona)
func _on_select_pressed() -> void:
	var selected = teams[current_index]
	print("Time selecionado: ", selected.name) # ← MUDOU

#atualizar o visual no jogo
func _update_ui() -> void:
	var team = teams[current_index]

	team_name_label.text = team.name                                           # nome do time receba
	overall_label.text = "Overall: %d" % team.get_overall()                       # over
	shield_texture.texture = team.texture if team.texture else fallback_texture  # foto do time

#voltar p tela de inicio
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/tela inicial.tscn")


func _on_button_mouse_entered() -> void:
	$HoverSound.play()
