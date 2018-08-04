extends "res://scripts/State.gd"

func enter(state_machine) :
	self.add_child(Factory.create(Factory.LEVEL))
	.enter(state_machine)

func exit() :
	queue_free()
	.exit()