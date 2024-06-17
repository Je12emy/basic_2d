extends State

class_name PlayerAttack
@export var animated_sprite : AnimatedSprite2D

func Enter():
	animated_sprite.play("attack")

func Update(_delta: float):
	if animated_sprite.is_playing():
		return
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
		return
	Transitioned.emit(self, "idle")	
