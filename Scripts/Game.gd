extends Node2D

export(PackedScene) var obstacle
var score = 0
var start = false

func _on_ScoreTimer_timeout():
	score += 1

func _physics_process(delta):
	$Label.text = "SCORE:" + str(score)
	if Input.is_action_just_pressed("ui_accept"): # Sadece deneme amaçlı 
		restart()
#	if !start:
#		if Input.is_action_just_pressed("ui_up"):
#			start = true
#			$Player.start = true
#			$ParallaxBackground.playing = true
#			$Timer.start()

func _on_ObstacleTimer_timeout():
	pass
#	spawn_obstacle()

func restart():
	get_tree().reload_current_scene()
	
#func spawn_obstacle():
#	var new_obstacle = obstacle_scene.instance()
#	Obstacle.position = Vector2(1046, 562)
#	Obstacle.start = true
#	Obstacle.connect("body_entered", self, "game_over")
#	add_child(Obstacle)

#func game_over(body):
#	var obstacles = get_tree().get_nodes_in_group("obstacle")
#	$Player.start = false
#	$ParallaxBackground.playing = false
#	$Timer.stop()
#	for obstacle in obstacles:
#		obstacle.start = false
