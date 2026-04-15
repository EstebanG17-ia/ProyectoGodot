extends Node2D

const ESCENA_Player = preload("res://Player.tscn")
@onready var lblInicio = $"Objetos(Laser, Nave y Asteroides)/Inicio/lblInicio"
@onready var lblPuntos = $"Objetos(Laser, Nave y Asteroides)/HUD/lblPuntos"
@onready var gameOverScreen = $"Objetos(Laser, Nave y Asteroides)/GameOverScreen"

var player_actual: Node2D = null
var juego_iniciado = false
var puntos = 0

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	juego_iniciado = false
	gameOverScreen.visible = false 
	actualizar_interfaz_puntos()

func _process(_delta):
	if !juego_iniciado and Input.is_action_just_pressed("empezar_juego"):
		iniciar_juego()
	
	if gameOverScreen.visible and Input.is_action_just_pressed("reiniciar_tecla"):
		iniciar_juego()

func iniciar_juego():
	get_tree().call_group("asteroides", "queue_free")
	
	if player_actual:
		player_actual.queue_free()
	
	player_actual = ESCENA_Player.instantiate()
	player_actual.position = Vector2(-30, 183) 
	add_child(player_actual)
	
	puntos = 0
	actualizar_interfaz_puntos()
	
	juego_iniciado = true
	get_tree().paused = false
	lblInicio.visible = false
	gameOverScreen.visible = false

func detener_juego():
	juego_iniciado = false
	get_tree().paused = true 
	gameOverScreen.visible = true 

func sumar_puntos():
	puntos += 100
	actualizar_interfaz_puntos()

func actualizar_interfaz_puntos():
	if lblPuntos:
		lblPuntos.text = "Puntos: " + str(puntos)
