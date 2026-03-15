extends Control

# --- Dados dos times ---
# Cada dicionário representa um time.
# Substitua "texture_path" pelo caminho real das imagens dos escudos.
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

# --- Referências aos nós da cena ---
# Use @onready pra pegar os nós assim que a cena carregar.
# Ajuste os caminhos conforme a sua hierarquia de nós.
@onready var team_name_label: Label         = $PanelContainer/VBox/TeamName
@onready var shield_texture: TextureRect    = $PanelContainer/VBox/HBox/Shield
@onready var overall_label: Label           = $PanelContainer/VBox/OverallLabel
@onready var stars_container: HBoxContainer = $PanelContainer/VBox/Stars
@onready var btn_prev: Button               = $PanelContainer/VBox/HBox/BtnPrev
@onready var btn_next: Button               = $PanelContainer/VBox/HBox/BtnNext
@onready var btn_select: Button             = $PanelContainer/VBox/BtnSelect

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

	# Estrelas
	_update_stars(team["stars"])

# --- Renderiza as estrelas ---
func _update_stars(count: int) -> void:
	# Limpa as estrelas antigas
	for child in stars_container.get_children():
		child.queue_free()

	# Cria 5 Labels de estrela (cheia ou vazia)
	for i in range(5):
		var star = Label.new()
		star.text = "★" if i < count else "☆"
		star.add_theme_font_size_override("font_size", 60)  # ← muda esse número
		# Estrela cheia = amarelo, vazia = cinza
		star.add_theme_color_override(
			"font_color",
			Color("#F5C842") if i < count else Color("#888888")
		)
		stars_container.add_child(star)


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/tela inicial.tscn")
