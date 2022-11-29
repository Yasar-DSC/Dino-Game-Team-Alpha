extends Area2D

var speed = 300
var start = false
#onready var speed = get_parent().get_node("ParallaxBackground").floor_speed() # ParallaxBackground yaparken aç 

func _physics_process(delta):
	if start:
		position += Vector2.LEFT * speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
