extends State

class_name PlayerWalk

@export var animated_sprite : AnimatedSprite2D
var player : CharacterBody2D
const SPEED = 100

func Enter():
	animated_sprite.play("walk")
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	# I need a way to infer the previous direction the player is walking in
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction < 0:
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.flip_h = false

	player.velocity.x = direction * SPEED
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
