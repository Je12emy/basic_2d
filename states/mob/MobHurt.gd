extends State

class_name MobHurt

@export var mob : Mob
@export var animated_sprite : AnimatedSprite2D
var original_color: Color

func Enter():
	original_color = animated_sprite.modulate
	animated_sprite.modulate = Color(255, 0, 0)
	# BUG: I can only get this working once and when hitting the mob from the right side
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = 0.2
	timer.one_shot = true
	timer.connect("timeout", on_timer_timeout)
	add_child(timer)

func Update(_delta: float):
	if mob.HEALTH <= 0:
		Transitioned.emit(self, "Death")
		return	
	Transitioned.emit(self, "Aggro")

func on_timer_timeout():
	animated_sprite.modulate = original_color
