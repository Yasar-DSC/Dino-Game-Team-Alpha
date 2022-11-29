extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_velocity = 800
var gravity = 2000
var down_pressed_gravity = 4000
var start = false

func _physics_process(delta):
#	if start == false:
#		$AnimationPlayer.play("idle")
#		return

	if start == true:
		if is_on_floor() and Input.is_action_pressed("ui_up"):
			velocity.y = -jump_velocity
		if !is_on_floor():
			if Input.is_action_pressed("ui_down"):
				velocity.y += down_pressed_gravity * delta
			else:
				velocity.y += gravity * delta
	move_and_slide(velocity, Vector2.UP)


# Varsa animasyonlar yeri

#	if is_on_floor() and !Input.is_action_pressed("ui_down"):
#		$AnimationPlayer.play("running")
#	if is_on_floor() and Input.is_action_pressed("ui_down"):
#		$AnimationPlayer.play("crouch")
#	if !is_on_floor():
#		$AnimationPlayer.play("idle")

