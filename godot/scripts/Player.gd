extends "res://scripts/LevelItem.gd"

signal shoot(item)

export var mouse_pos_threshold = 20

var connected = false
var weapons_ready = true

func init(controller, initial_pos):
	if not connected :
		self.connect("shoot", controller, "_on_shoot", [self])
		connected = true
	.init(controller, initial_pos)

func update(delta):
	direction.x = 0
	var mouse_pos = get_local_mouse_position()
	if mouse_pos.x < mouse_pos_threshold*-1 :
		direction.x = -1
	elif mouse_pos.x > mouse_pos_threshold :
		direction.x = 1
	.update(delta)
	if Input.is_mouse_button_pressed(1):
		shoot()

func shoot() :
	if weapons_ready :
		emit_signal("shoot")
		weapons_ready = false
		$WeaponReload.start()
	pass

func _on_WeaponReload_timeout():
	weapons_ready = true