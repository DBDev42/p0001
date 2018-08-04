extends Node2D

signal collision(item1, item2)

export var speed = 0
export var direction = Vector2(0,0)

func _ready():
	pass

func update(delta):
	set_position(get_position() + direction*speed*delta)

func init(controller, initial_pos):
	self.connect("collision", controller, "_on_collision")
	set_position(initial_pos)

func _on_Visibility_screen_exited():
	print("out")
	queue_free()

func _on_Area_area_entered(area):
	print("in")
	emit_signal("collision", self, area.get_parent())
