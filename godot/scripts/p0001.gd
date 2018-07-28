extends Node

onready var enemy = preload("res://Enemy.tscn")
onready var screen_size = get_viewport().size
onready var score = 0

func _ready():
	$Ship.set_position(Vector2(screen_size.x/2, 400))
	randomize()

func _on_EnemyTimer_timeout():
	print("timer")
	var e = enemy.instance()
	e.init($Ship.get_position() + $Ship/EnemySpawnZone.get_position())
	e.connect("died", self, "_on_Enemy_died")
	$Enemies.add_child(e)

func _on_Enemy_died():
	score += 10
	$Ship/GUI/Score.set_text("Puntuacion: " + str(score))