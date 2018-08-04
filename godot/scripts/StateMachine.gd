extends Node

var current_state
var previous_state

func change_to_state(state) :
	var temp_state = get_node("States/" + state)
	if temp_state != null :
		temp_state.enter(self)
	else :
		print("state not found")

func _on_state_entered(state) :
	print("entered: " + state.state_name)
	previous_state = current_state
	current_state = state
	pass

func _on_state_exited(state) :
	print("exited: " + state.state_name)
	#check for rules and switch to new state
	pass