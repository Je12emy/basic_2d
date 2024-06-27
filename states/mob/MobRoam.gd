extends State

class_name MobRoam

@export var animated_sprite : AnimatedSprite2D
@export var mob : Mob
@export var aggro_zone : Area2D
@export var roam_duration : int = 3
var roam_timer : Timer

# This vector represents the direction where the mob moves
var direction = Vector2.RIGHT

func Enter():
	animated_sprite.play("walk")
	roam_timer = Timer.new()
	roam_timer.autostart = true
	roam_timer.wait_time = roam_duration
	roam_timer.connect("timeout", _on_roam_timer_timout)
	add_child(roam_timer)
	
func Physics_Update(_delta: float):
	if colides_with_something():
		direction.x *= -1
		roam_timer.start()
	mob.velocity.x = mob.SPEED * direction.x
	mob.move_and_slide()

func colides_with_something() -> bool:
	return mob.is_on_wall()

func _on_aggro_zone_body_entered(_body: CharacterBody2D):
	Transitioned.emit(self, "aggro")

func _on_slime_hurt(damage):
	Transitioned.emit(self, "hurt")

func _on_roam_timer_timout():
	direction.x *= -1
	roam_timer.start()
