extends State

class_name PlayerFalling

var player : CharacterBody2D

const GRAVITY = 20

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	if player.is_on_floor():
		Transitioned.emit(self, "idle")

func Physics_Process(_deta: float):
	player.velocity.y += GRAVITY
	player.move_and_slide()
