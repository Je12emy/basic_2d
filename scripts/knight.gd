extends CharacterBody2D

const GRAVITY = 15

func _physics_process(_delta):
	velocity.y += GRAVITY
	move_and_slide()
