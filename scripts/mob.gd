extends CharacterBody2D

class_name Mob

@export var GRAVITY: int = 20
@export var SPEED: int = 50
@export var HEALTH: int = 75
@export var ATTACK_DAMAGE : int = 15
@export var ROAM_TYPE : MobRoamType.Pattern = MobRoamType.Pattern.Patrol
@export var ROAM_DURATION : int = 3

signal hurt(damage: int)

func _physics_process(_delta: float):
	velocity.y += GRAVITY
	move_and_slide()

func take_damage(attack_power: int, attack_box: Area2D):
	if attack_box.global_position.x < global_position.x:
		velocity = Vector2(-800, -100)
	else:
		velocity = Vector2(800, -100)
	HEALTH -= attack_power
	move_and_slide()
	hurt.emit(attack_power)

func _on_attack_box_body_entered(body: CharacterBody2D):
	if body is Player:
		body.take_damage(ATTACK_DAMAGE)
