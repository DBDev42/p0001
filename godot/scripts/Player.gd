extends "res://scripts/LevelItem.gd"

signal shoot(item)

export var input_pos_threshold = 20

var connected = false
var weapons_ready = true

func init(controller, initial_pos):
	if not connected :
		self.connect("shoot", controller, "_on_shoot", [self])
		connected = true
	.init(controller, initial_pos)

func update(delta):
	direction.x = 0
	var input_pos = Adapter.get_input_x_position()
	if input_pos < get_position().x + input_pos_threshold*-1 :
		direction.x = -1
	elif input_pos > get_position().x + input_pos_threshold :
		direction.x = 1
	.update(delta)
	if Adapter.is_action_pressed():
		shoot()

func shoot() :
	if weapons_ready :
		emit_signal("shoot")
		weapons_ready = false
		$WeaponReload.start()
	pass

func _on_WeaponReload_timeout():
	weapons_ready = true