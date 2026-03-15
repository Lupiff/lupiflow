extends Control


var teams = [
	{
		"name": "FLAMENGO",
		"overall": 99,
		"stars": 5,
		"texture": "res://assets/logos/times/FLAMENGO.png"
	},
	{
		"name": "CORINTHIANS",
		"overall": 88,
		"stars": 3,
		"texture": "res://assets/logos/times/CORINTHIANS.png"
	},
	{
		"name": "PALMEIRAS",
		"overall": 91,
		"stars": 4,
		"texture": "res://assets/logos/times/PALMEIRAS.png"
	},
	{
		"name": "SÃO PAULO",
		"overall": 87,
		"stars": 3,
		"texture": "res://assets/logos/times/SÃO PAULO.png"
	},
]

var current_index: int = 0

@onready var team_name_label: Label         = $TimeNome
@onready var shield_texture: TextureRect    = $Escudo_Time
@onready var overall_label: Label           = $OverallLabel
@onready var btn_prev: Button               = $BtnPrev
@onready var btn_next: Button               = $BtnNext
@onready var btn_select: Button             = $BtnSelect

# Textura placeholder caso o arquivo não seja encontrado
var fallback_texture: Texture2D = preload("res://icon.svg")


# --- Inicialização ---
func _ready() -> void:
	btn_prev.pressed.connect(_on_prev_pressed)
	btn_next.pressed.connect(_on_next_pressed)
	btn_select.pressed.connect(_on_select_pressed)
	_update_ui()

# --- Navegação ---
func _on_prev_pressed() -> void:
	current_index = (current_index - 1 + teams.size()) % teams.size()
	_update_ui()

func _on_next_pressed() -> void:
	current_index = (current_index + 1) % teams.size()
	_update_ui()

# --- Seleção ---
func _on_select_pressed() -> void:
	var selected = teams[current_index]
	print("Time selecionado: ", selected["name"])
	# Aqui você passa os dados pro próximo estado do jogo.
	# Exemplo: salvar num autoload (singleton) e trocar de cena.
	

# --- Atualiza todos os elementos visuais ---
func _update_ui() -> void:
	var team = teams[current_index]

	# Nome do time
	team_name_label.text = team["name"]

	# Overall
	overall_label.text = "Overall: %d" % team["overall"]

	# Escudo
	var tex = load(team["texture"]) as Texture2D
	shield_texture.texture = tex if tex else fallback_texture
	
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/tela inicial.tscn")
