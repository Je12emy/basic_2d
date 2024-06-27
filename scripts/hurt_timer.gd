extends Timer

class_name HurtTimer

func _init(AnimatedSprite: AnimatedSprite2D, callable: Callable):
	autostart = true
	one_shot = true
	wait_time = 0.2
	connect("timeout", callable)
