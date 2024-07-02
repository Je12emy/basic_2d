extends State

class_name PlayerDeath

@export var player : Player

signal player_dead

func Enter():
	player_dead.emit()
