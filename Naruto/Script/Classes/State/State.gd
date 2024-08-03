extends Node

class_name State

signal transitioned

# Run when it´s runned by first time
func _enter():
	print_debug("Start run ", name)
	pass
	
func _exit():
	pass
	
func _update(delta:float):
	pass
	
func _physics_update(delta: float):
	pass
