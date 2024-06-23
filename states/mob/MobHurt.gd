extends State

class_name MobHurt

@export var mob : Mob

func Enter():
	mob.velocity.x = 400
	mob.velocity.y = -300
	mob.move_and_slide()

func Update(_delta: float):
	Transitioned.emit(self, "Aggro")
