extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_velocity = Vector2.UP * 600
var gravity =  Vector2.DOWN * 2000
var gravity_l = Vector2.DOWN * 6000
var start = false

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity = jump_velocity
	if !is_on_floor():
		if Input.is_action_pressed("down"):
			velocity += gravity_l * delta
		else:
			velocity += gravity *delta
	if start:
		if is_on_floor() and !Input.is_action_pressed("down"):
			$AnimationPlayer.play("running")
		if is_on_floor() and Input.is_action_pressed("down"):
			$AnimationPlayer.play("down")
		if !is_on_floor():
			$AnimationPlayer.play("Idle")
	else:
		$AnimationPlayer.play("Idle")	
		
		move_and_slide(velocity, Vector2.UP)
	
