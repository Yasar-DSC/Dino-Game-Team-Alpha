extends Node2D

var obstacle1 = preload("res://Scenes/Obstacle_1.tscn")
var obstacle2 = preload("res://Scenes/Obstacle_2.tscn")
var obstacle3 = preload("res://Scenes/Obstacle_3.tscn")
var score = 0
var start = false

func _ready():
	randomize()

func _physics_process(delta):
	$Score.text = "SCORE:" + str(score)
	if !start and score > 1:
		if Input.is_action_just_pressed("ui_select"):
			restart()
	if !start and score < 1:
		if Input.is_action_just_pressed("ui_up"):
			start = true
			$Player.start = true
			$ParallaxBackground.playing = true 
			$Score/ScoreTimer.start()
			$ObstacleTimer.start()

func _on_ScoreTimer_timeout():
	score += 1

func _on_ObstacleTimer_timeout():
	spawn_obstacles()

func spawn_obstacles():
	var obstacles = [obstacle1, obstacle2, obstacle3]
	var select = obstacles[randi()% obstacles.size()]
	var new_obstacle = select.instance()
	new_obstacle.position = $EnemySpawnPoint.global_position
	new_obstacle.start = true
	new_obstacle.connect("body_entered", self, "game_over")
	add_child(new_obstacle)

func game_over(body):
	var obstacles = get_tree().get_nodes_in_group("obstacle")
	start = false
	$Player.start = false
	$Player.velocity = Vector2.ZERO
	$GameOver.text = "TRY AGAIN"
	$GameOver2.text = "Press space to restart"
	$ParallaxBackground.playing = false
	$Score/ScoreTimer.stop()
	$ObstacleTimer.stop()
	for obstacle in obstacles:
		obstacle.start = false

func restart():
	get_tree().reload_current_scene()
