extends Node

signal state_entered(state)
signal state_exited(state)

export var state_name = "State"

var connected = false

func enter(state_machine) :
	if not connected :
		self.connect("state_entered", state_machine, "_on_state_entered", [self])
		self.connect("state_exited", state_machine, "_on_state_exited", [self])
		connected = true
	emit_signal("state_entered")

func exit() :
	emit_signal("state_exited")