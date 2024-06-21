extends State

class_name MobRoam

@export var animated_sprite : AnimatedSprite2D
@export var mob : CharacterBody2D

# This vector represents the direction where the mob moves
var direction = Vector2.RIGHT
var speed = -50

func Enter():
	animated_sprite.play("walk")
	
func Physics_Update(_delta: float):
	if colides_with_something():
		direction.x *= -1
	mob.velocity.x = speed * direction.x
	mob.move_and_slide()
	
func colides_with_something() -> bool:
	return mob.is_on_wall()

