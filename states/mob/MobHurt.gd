extends State

class_name MobHurt

@export var mob : Mob

func Enter():
	print("HURT")

func Update(_delta: float):
	print("AGGRO")
	Transitioned.emit(self, "Aggro")
