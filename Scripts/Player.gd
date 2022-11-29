extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_velocity = Vector2.UP * 600
var gravity = Vector2.DOWN * 2000
var down_pressed_gravity = Vector2.DOWN * 4000
var start = false

func _physics_process(delta):
#	if start == false:
#		$AnimationPlayer.play("idle")
#		return
	
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity = jump_velocity
	if !is_on_floor():
		if Input.is_action_pressed("ui_down"):
			velocity += down_pressed_gravity * delta
		else:
			velocity += gravity * delta


# Varsa animasyonlar yeri

#	if is_on_floor() and !Input.is_action_pressed("ui_down"):
#		$AnimationPlayer.play("running")
#	if is_on_floor() and Input.is_action_pressed("ui_down"):
#		$AnimationPlayer.play("crouch")
#	if !is_on_floor():
#		$AnimationPlayer.play("idle")

