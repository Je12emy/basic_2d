extends Node

# Base state class, all state classes which inherit from it will
# provide their own functionallity for each method.
class_name State

# This signall will be emited anytime we want to leave this state
signal Transitioned

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta: float):
	pass

func Physics_Update(_deta: float):
	pass
