extends Node

# We hold the state machine's initial state in a variable
@export var initial_state : State
# A state machine is a collection of states
var states : Dictionary = {}
# In our state machine we will keep track of our current state
var current_state : State

# This node will have classes which inherit from  the base State class
func _ready():
	# We will retrieve each child class and if it inherits from the base State class
	# we will add it to our finit state machine
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			# Connect to each child's "Transitioned" signal to the state machine's on_child_transition method
			child.Transitioned.connect(on_child_transition)
	# If an initial state is specified, we must transition to it and set it as our initial state
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

# If there is an active state, call it's Update and Physics Update methods
func _process(delta):
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

# The function takes the new state to transition to and it's name 
func on_child_transition(state, new_state_name):
	# If the new state to transition to is already the current state, there is not need to transition to it.
	if current_state != state:
		return
	# Attempt to get the new state to transition to from the state machine
	var new_state = states.get(new_state_name.to_lower())
	# If it isn't a known state, there is nothing to do
	if !new_state:
		return
	# If there is an active state, call it's Exit method
	if current_state:
		current_state.Exit()
	# Call the Enter method in the new state to transition to
	new_state.Enter()
	# And set it as the active state in the state machine
	current_state = new_state
