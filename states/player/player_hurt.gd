extends State

class_name PlayerHurt

@export var player : Player
@export var animated_sprite : AnimatedSprite2D
var original_color : Color

func Enter():
	original_color = animated_sprite.modulate
	animated_sprite.modulate = Color(255, 0, 0)
	var hurt_timer = HurtTimer.new(animated_sprite, on_timer_timeout)
	add_child(hurt_timer)
	
func Update(_delta: float):
	if player.HEALTH <= 0:
		Transitioned.emit(self, "death")
		return
	Transitioned.emit(self, "idle")

func on_timer_timeout():
	animated_sprite.modulate = original_color
