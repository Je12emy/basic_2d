extends Node

@export var key : Node2D

func _on_key_level_over():
	get_tree().paused = true
