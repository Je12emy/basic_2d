extends State

class_name PlayerWalk

@export var animated_sprite: AnimatedSprite2D
@export var player: Player
@export var attack_box: Area2D

func Enter():
	animated_sprite.play("walk")

func Update(_delta: float):
	var direction = Input.get_axis("move_left", "move_right")
	# Facing left
	if direction < 0:
		animated_sprite.flip_h = true
		attack_box.position = Vector2(-30, 0)
	elif direction > 0:
		animated_sprite.flip_h = false
		attack_box.position = Vector2(30, 0)
	player.velocity.x = direction * player.SPEED
	player.move_and_slide()
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right"):
		Transitioned.emit(self, "idle")
		return

	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		return

	if Input.is_action_just_pressed("jump"):
		Transitioned.emit(self, "jump")
		return


func _on_player_player_hurt():
	Transitioned.emit(self, "hurt")
