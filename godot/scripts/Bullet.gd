extends Area2D

export var speed = Vector2(0, 2500)
onready var direction = Vector2(0,-1)

var pos = Vector2(0,0)

func _ready():
	set_process(true)

func init(cannon_pos):
	pos = cannon_pos

func _process(delta):
	pos += speed*direction*delta
	self.set_position(pos)

func _on_Visible_screen_exited():
	queue_free()