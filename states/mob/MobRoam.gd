extends State

class_name MobRoam

@export var animated_sprite : AnimatedSprite2D
@export var mob : Mob
@export var aggro_zone : Area2D

# This vector represents the direction where the mob moves
var direction = Vector2.RIGHT

func Enter():
	animated_sprite.play("walk")
	
func Physics_Update(_delta: float):
	if colides_with_something():
		direction.x *= -1
	mob.velocity.x = mob.SPEED * direction.x
	mob.move_and_slide()
	
func colides_with_something() -> bool:
	return mob.is_on_wall()

func _on_aggro_zone_body_entered(_body: CharacterBody2D):
	Transitioned.emit(self, "aggro")
