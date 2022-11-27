extends Area2D

var velocity =Vector2.ZERO
var jump_velocity = Vector2.UP* 600

var gravity_l= 4000

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity = jump_velocity
	if !is_on_floor():
		if Input.is_action_pressed("down"):
			velocity += gravity_l * delta	
		else:
			velocity += gravity * delta	
		
		move_and_slide(velocity, Vector2.UP)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
