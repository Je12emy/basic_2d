extends Node2D

signal level_over

func _on_area_2d_body_entered(body):
	if body is Player:
		level_over.emit()
