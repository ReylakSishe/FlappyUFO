extends RigidBody2D

var speed := 400
var score := 0

func _integrate_forces(state):
	if Input.is_action_just_pressed("ui_select"):
		$"../FlapSound".play()
		linear_velocity = Vector2.ZERO
		apply_central_impulse(Vector2(0,-speed))
		$AnimatedSprite2D.play("flap")

func morir():
	$"../HitSound".play()
	get_tree().paused = true
	$"../Gameover".show()

func subirRecord():
	score += 1
	$"../PointSound".play()
	$"../ScoreLabel".text = str(score)


func _on_detectar_piso_body_entered(body):
	if body.is_in_group("Obstaculos"):
		morir()
