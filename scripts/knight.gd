extends CharacterBody2D

const GRAVITY = 20

func _physics_process(delta):
	velocity.y += GRAVITY
	move_and_slide()
