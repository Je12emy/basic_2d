extends State

class_name MobAggro

var player : CharacterBody2D
@export var mob : Mob
@export var chase_speed = 60

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(_delta: float):
	if not mob.global_position.x == player.global_position.x:
		if mob.global_position.x < player.global_position.x:
			mob.velocity.x = chase_speed
		else:
			mob.velocity.x = -chase_speed
	mob.move_and_slide()

func _on_aggro_zone_body_exited(body):
	Transitioned.emit(self, "idle")

func _on_slime_hurt(damage):
	Transitioned.emit(self, "hurt")
