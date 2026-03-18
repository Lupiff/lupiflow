extends Control

@onready var photo_texture: TextureRect = $TextureRect/PlayerFoto
@onready var name_label: Label          = $TextureRect/NomePlayer
@onready var position_label: Label      = $TextureRect/PlayerPosition
@onready var overall_label: Label       = $TextureRect/Overall
@onready var chut_num: Label            = $TextureRect/chutNUM
@onready var vel_num: Label             = $TextureRect/velNUM
@onready var pass_num: Label            = $TextureRect/passNUM
@onready var def_num: Label             = $TextureRect/defNUM
@onready var dri_num: Label             = $TextureRect/driNUM
@onready var fol_num: Label             = $TextureRect/folNUM

func setup(player: PlayerData) -> void:
	photo_texture.texture = player.photo
	name_label.text       = player.name
	position_label.text   = player.position
	overall_label.text    = str(player.get_overall())
	chut_num.text         = str(player.chute)
	vel_num.text          = str(player.velocidade)
	pass_num.text         = str(player.passe)
	def_num.text          = str(player.defesa)
	dri_num.text          = str(player.drible)
	fol_num.text          = str(player.folego)
