extends Node

func _ready():
	inicio()

func inicio():
	get_tree().paused = true
	if Input.is_action_just_pressed("ui_select") and get_tree().paused:
		$Message.hide()
		get_tree().paused = false

var Obstaculo = preload("res://obstaculos.tscn")

func _on_crear_obstaculos_timer_timeout():
	var obstaculo = Obstaculo.instantiate()
	obstaculo.position.x = 270
	add_child(obstaculo)

func morir():
	get_tree().paused = true
	$Gameover.show()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
