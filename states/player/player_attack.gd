extends State

class_name PlayerAttack
@export var animated_sprite : AnimatedSprite2D
var player : CharacterBody2D

func Enter():
	animated_sprite.play("attack")
	player = get_tree().get_first_node_in_group("Player")
	# Make the player stand still when attacking
	player.velocity.x = 0
	player.move_and_slide()
	
func Update(_delta: float):
	if animated_sprite.is_playing():
		return
	Transitioned.emit(self, "idle")	
