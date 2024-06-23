extends State

class_name PlayerAttack
@export var animated_sprite : AnimatedSprite2D
@export var player : Player

func Enter():
	animated_sprite.play("attack")
	# Make the player stand still when attacking
	player.velocity.x = 0
	player.move_and_slide()
	
func Update(_delta: float):
	if animated_sprite.is_playing():
		return
	Transitioned.emit(self, "idle")	
