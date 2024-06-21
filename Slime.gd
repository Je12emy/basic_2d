extends CharacterBody2D

var gravity = 100

func _physics_process(delta):
	velocity.y += gravity
