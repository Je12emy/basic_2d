extends State

class_name PlayerFalling

@export var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Update(_delta: float):
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
