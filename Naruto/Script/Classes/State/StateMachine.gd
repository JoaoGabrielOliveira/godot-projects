extends Node

class_name StateMachine
enum States { STANDING, RUNNING}

@export
var initial_state: State

var states_list: Dictionary
var current: State

func _ready():
	set_states()
	if initial_state:
		initial_state._enter()
		current = initial_state
	
func _process(delta):
	if current:
		current._update(delta)
	
func _physics_process(delta):
	if current:
		current._physics_update(delta)

func change_state(new_state_name: String):
	var new_state = states_list.get(new_state_name.to_lower())
	if !new_state:
		push_error("State ", new_state_name, " does not exit!")
		return
	
	if new_state == current:
		return
		
	if current:
		current._exit()
		
	new_state._enter()
	current = new_state

#region signal
func on_child_transition(state: State, new_state_name: String):
	if state != current:
		return
	change_state(new_state_name)

#endregion

#region private
func set_states():
	for child in get_children():
		if(child is State):
			states_list[child.name.to_lower()] = child
			child.transitioned.connect(on_child_transition)
		else:
			push_error(child, "is not a State")
			remove_child(child)

#endregion
