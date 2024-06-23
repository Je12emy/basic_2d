extends CharacterBody2D

class_name Player

@export var GRAVITY = 20
@export var SPEED = 100

func _physics_process(delta):
	velocity.y += GRAVITY
	move_and_slide()
