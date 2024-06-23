extends State

class_name PlayerJump

@export var animated_sprite : AnimatedSprite2D
@export var player : Player

# Math taken from here: https://www.youtube.com/watch?v=IOe1aGY6hXA
@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0



func Enter():
	player = get_tree().get_first_node_in_group("Player")
	# When we enter we want to displace our player
	player.velocity.y = jump_velocity
	
func Physics_Update(delta):
	player.velocity.y += get_gravity() * delta
	player.velocity.x = get_input_velocity() * player.SPEED

	# Once the player lands, we can transition to whichever state we want
	var landed = player.move_and_slide()
	if landed:
		Transitioned.emit(self, "idle")

func get_gravity() -> float:
	return jump_gravity if player.velocity.y < 0.0 else fall_gravity

func get_input_velocity() -> float:
	var horizontal := 0.0
	if Input.is_action_pressed("move_left"):
		horizontal -= 1.0
		animated_sprite.flip_h = true

	if Input.is_action_pressed("move_right"):
		horizontal += 1.0
		animated_sprite.flip_h = false
	return horizontal



