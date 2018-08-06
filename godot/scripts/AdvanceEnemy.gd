extends "res://scripts/Enemy.gd"

signal shoot(item)

var connected = false
var target_pos_threshold = 20
var target = null

func init(controller, initial_pos):
	if not connected :
		self.connect("shoot", controller, "_on_shoot", [self])
		connected = true
	.init(controller, initial_pos)

func update(delta):
	direction.x = 0
	if target != null :
		var target_pos = target.get_position().x
		if target_pos < get_position().x + target_pos_threshold*-1 :
			direction.x = -1
		elif target_pos > get_position().x + target_pos_threshold :
			direction.x = 1
	.update(delta)

func _on_Radar_area_entered(area):
	if area.get_parent().is_in_group("player") :
		target = area.get_parent()
		$WeaponReload.start()

func _on_Radar_area_exited(area):
	if area.get_parent().is_in_group("player") :
		target = null
		$WeaponReload.stop()

func _on_WeaponReload_timeout():
	print("shooting")
	emit_signal("shoot")