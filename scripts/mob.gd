extends CharacterBody2D

class_name Mob

@export var GRAVITY : int = 20
@export var SPEED :int = 50

func _physics_process(_delta: float):
	velocity.y += GRAVITY
	move_and_slide()
