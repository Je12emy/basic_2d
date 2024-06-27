extends CharacterBody2D

class_name Player

@export var GRAVITY : int = 20
@export var SPEED : int = 100
@export var HEALTH : int = 100
@export var ATTACK_DAMAGE : int = 50

signal player_hurt

func _physics_process(_delta : float):
	velocity.y += GRAVITY
	move_and_slide()

func take_damage(attack_damage: int) -> void:
	HEALTH -= attack_damage
	player_hurt.emit()
