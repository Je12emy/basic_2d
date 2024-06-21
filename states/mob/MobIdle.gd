extends State

class_name MobIdle

@export var animated_sprite : AnimatedSprite2D

func Enter():
	animated_sprite.play("idle")

func Update(_delta: float):
	if not animated_sprite.is_playing():
		Transitioned.emit(self, "roam")
