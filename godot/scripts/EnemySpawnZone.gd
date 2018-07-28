extends Node2D

onready var screen_size = get_viewport().size

func _ready():
	pass

func get_spawn_position():
	return Vector2(screen_size.x * randf(), self.get_position().y)