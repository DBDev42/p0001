extends Node

onready var enemy = preload("res://Enemy.tscn")
onready var screen_size = get_viewport().size
onready var score = 0

func _ready():
	TranslationServer.set_locale("es")
	$GUI/Score.set_text(tr("LEVEL_GUI_SCORE_LABEL") + ": 00")
	$Ship.set_position(Vector2(screen_size.x/2, screen_size.y*18/20))
	randomize()
	set_process(true)

func _process(delta):
	if $Background/Cells.get_motion_offset().y == $Background/Cells/CellBackground.texture.get_height()*3:
		$Background/Cells.set_motion_offset(Vector2(0, 0))
	else:
		$Background/Cells.set_motion_offset($Background/Cells.get_motion_offset() + Vector2(0, 3))

func _on_EnemyTimer_timeout():
	var e = enemy.instance()
	e.init($EnemySpawnZone.get_spawn_position())
	e.connect("died", self, "_on_Enemy_died")
	$Enemies.add_child(e)

func _on_Enemy_died():
	score += 10
	$GUI/Score.set_text(tr("LEVEL_GUI_SCORE_LABEL") + ": " + str(score))