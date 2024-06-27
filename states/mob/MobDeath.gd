extends State

class_name MobDeath

@export var mob : Mob

func Enter():
	mob.queue_free()
