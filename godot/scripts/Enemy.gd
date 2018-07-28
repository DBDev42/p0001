extends Area2D

signal died

func _ready():
	pass

func init(initial_pos):
	self.set_position(initial_pos)

func _on_Visible_screen_exited():
	queue_free()
	print("enemy out")

func _on_Enemy_area_entered(area):
	if area.is_in_group("bullet"):
		emit_signal("died")
		queue_free()
		print("enemy destroyed")