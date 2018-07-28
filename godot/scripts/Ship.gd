extends Area2D

export var acceleration = Vector2(100,200)
export var max_speed = Vector2(250,500)

onready var speed = Vector2(0,0)
onready var direction = Vector2(0,-1)
onready var screen_size = Vector2(0,0)
onready var ship_size = Vector2(0,0)
onready var ship_margin = Vector2(0,0)
onready var env_resistance = Vector2(25, 50)
onready var bullet = preload("res://Bullet.tscn")
onready var bullets = self.get_node("Bullets")
onready var left_weapon = self.get_node("Body/LeftWeapon")
onready var right_weapon = self.get_node("Body/RightWeapon")
onready var weapon_reload_time = self.get_node("WeaponsReloadTime")

func _ready():
	screen_size = self.get_viewport().size
	ship_size = self.get_node("Body").texture.get_size()
	ship_margin = ship_size * 0.25
	set_process(true)

func _process(delta):
	var pos = self.get_position()
	
	if Input.is_action_pressed("ui_right"):
		turn(delta)
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		turn(delta)
		direction.x = -1
	pos += speed*direction*delta
	pos.x = min(screen_size.x - ship_margin.x - ship_size.x/2, max(ship_margin.x + ship_size.x/2, pos.x))
	self.set_position(pos)
	
	if Input.is_action_pressed("ui_accept"):
		shoot()

func turn(delta):
	speed = Vector2(min(max_speed.x, speed.x+acceleration.x*delta), speed.y)

func shoot():
	if weapon_reload_time.is_stopped():
		var b_left = bullet.instance()
		b_left.init(self.get_position() + left_weapon.get_position())
		bullets.add_child(b_left)
		var b_right = bullet.instance()
		b_right.init(self.get_position() + right_weapon.get_position())
		bullets.add_child(b_right)
		weapon_reload_time.start()
	print("shoot")