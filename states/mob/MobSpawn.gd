extends State

class_name MobSpawn

@export var animated_sprite : AnimatedSprite2D

func Enter():
	animated_sprite.play("spawn")
	
func Update(_delta: float):
	if not animated_sprite.is_playing():
		Transitioned.emit(self, "idle")
