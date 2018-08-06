extends Node2D

onready var screen_size = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))

func get_input_x_position() :
	return get_global_mouse_position().x

func is_action_pressed() :
	return Input.is_mouse_button_pressed(BUTTON_LEFT)

func get_screen_size() :
	return screen_size