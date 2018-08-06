extends Node2D

signal collision(item1, item2)

export var speed = 0
export var direction = Vector2(0,0)
export var margin = 100

func _ready() :
	pass

func update(delta) :
	var future_position = get_position() + direction*speed*delta
	future_position.x = min(max(future_position.x, margin), Adapter.get_screen_size().x - margin)
	set_position(future_position)

func init(controller, initial_pos) :
	self.connect("collision", controller, "_on_collision")
	set_position(initial_pos)

func _on_Visibility_screen_entered() :
	pass

func _on_Visibility_screen_exited() :
	queue_free()

func _on_Area_area_entered(area) :
	emit_signal("collision", self, area.get_parent())
