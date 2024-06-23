extends CharacterBody2D

class_name Player

@export var GRAVITY : int = 20
@export var SPEED : int = 100
@export var HEALTH : int = 100
@export var ATTACK_DAMAGE : int = 50

func _physics_process(delta):
	velocity.y += GRAVITY
	move_and_slide()
