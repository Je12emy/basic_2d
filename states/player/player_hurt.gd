extends State

class_name PlayerHurt

@export var player : Player
@export var animated_sprite : AnimatedSprite2D
var original_color : Color

func Enter():
	original_color = animated_sprite.modulate
	animated_sprite.modulate = Color(255, 0, 0)
	var timer = Timer.new()
	timer.autostart = true
	timer.one_shot = true
	timer.wait_time = 0.2
	timer.connect("timeout", on_timer_timeout)
	add_child(timer)
	
func Update(_delta: float):
	if player.HEALTH <= 0:
		Transitioned.emit(self, "death")
		return
	Transitioned.emit(self, "idle")

func on_timer_timeout():
	animated_sprite.modulate = original_color
