extends State

class_name PlayerIdle

@export var animated_sprite : AnimatedSprite2D

func Enter():
	animated_sprite.play("idle")

func Update(_delta: float):
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("move_left"):
		Transitioned.emit(self, "walk")
		return
	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
		return
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		return
