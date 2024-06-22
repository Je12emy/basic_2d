extends CharacterBody2D

var gravity = 100

func _physics_process(_delta):
	velocity.y += gravity
