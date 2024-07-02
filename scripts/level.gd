extends Node

func _on_key_level_over():
	%GameOver.visible = true

func _on_game_over_restart():
	get_tree().reload_current_scene()
