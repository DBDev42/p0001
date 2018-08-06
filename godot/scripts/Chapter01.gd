extends "res://scripts/State.gd"

var level
var level_tutorial_1 = true

func enter(state_machine) :
	level = Factory.create(Factory.LEVEL)
	self.add_child(level)
	.enter(state_machine)

func update(delta) :
	if level_tutorial_1 :
		level.show_one_button_message("Mueve el ratón para mover la nave de un lado a otro de la pantalla. Pulsa el boton derecho del raton para disparar. Pulsa OK para continuar", "OK")
		level_tutorial_1 = false

func exit() :
	queue_free()
	.exit()