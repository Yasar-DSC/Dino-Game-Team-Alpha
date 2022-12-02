extends ParallaxBackground

export var playing = false
export var background_speed = 25
export var cloud_speed = 75
export var floor_speed = 250

func _physics_process(delta):
	if playing:
		$Background.motion_offset += Vector2.LEFT * background_speed * delta
		$Clouds.motion_offset += Vector2.LEFT * cloud_speed * delta
		$Floor.motion_offset += Vector2.LEFT * floor_speed * delta
