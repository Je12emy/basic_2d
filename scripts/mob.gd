extends CharacterBody2D

class_name Mob

@export var GRAVITY : int = 20
@export var SPEED :int = 50
@export var HEALTH : int = 75

signal hurt(damage: int)

func _physics_process(_delta: float):
	velocity.y += GRAVITY
	move_and_slide()

func take_damage(attack_power: int):
	HEALTH -= attack_power
	hurt.emit(attack_power)
