extends Area2D


var start = false
onready var speed = get_parent().get_node("ParallaxBackground").floor_speed

func _process(delta):
	if start:
		position += Vector2.LEFT * speed * delta 
		
