extends ParallaxBackground


export var playing =false
export var cloud_speed = 100
export var floor_speed= 500

func _process(delta):
	if playing:
		$Clouds.motion_offset += Vector2.LEFT * cloud_speed * delta
		$Floor.motion_offset += Vector2.LEFT * floor_speed * delta
