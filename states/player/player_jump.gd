extends State

class_name PlayerJump

var player : CharacterBody2D
const JUMP_STRENGTH = 30

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta: float):
	player.velocity.y -= JUMP_STRENGTH
	player.move_and_slide()
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
