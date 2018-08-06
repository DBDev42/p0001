extends Node

var enemy_list = [Factory.BASIC_ENEMY, Factory.INTERMEDIATE_ENEMY, Factory.ADVANCE_ENEMY]

func _ready():
	var player = Factory.create(Factory.PLAYER)
	$Items.add_child(player)
	player.init(self, Vector2(1080/2, 1920*18/20))
	$EnemySpawnTimer.start()
	set_process(true)

func _process(delta):
	move_background(delta)
	for i in $Items.get_children() :
		i.update(delta)

func move_background(delta) :
	if $Background/Base.get_motion_offset().y == $Background/Base/BaseTexture.texture.get_height()*3:
		$Background/Base.set_motion_offset(Vector2(0, 0))
	else:
		$Background/Base.set_motion_offset($Background/Base.get_motion_offset() + Vector2(0, 3))

func _on_EnemySpawnTimer_timeout() :
	var enemy = Factory.create(enemy_list[randi() % enemy_list.size()])
	$EnemySpawnZone/EnemySpawnSpot.set_offset(randi())
	$Items.add_child(enemy)
	enemy.init(self, $EnemySpawnZone/EnemySpawnSpot.get_position())

func _on_shoot(item) :
	var shoot_type
	if item.is_in_group("player") :
		shoot_type = Factory.PLAYER_SHOOT
	elif item.is_in_group("enemy") :
		shoot_type = Factory.ENEMY_SHOOT
	
	for i in item.get_children() :
		if i.is_in_group("weapon") :
			var s_item = Factory.create(shoot_type)
			$Items.add_child(s_item)
			s_item.init(self, item.get_position() + i.get_position())

func _on_collision(item1, item2) :
	if item1.is_in_group("enemy") and item2.is_in_group("player") and item2.is_in_group("shoot"):
		item1.queue_free()
		item2.queue_free()
		increment_progress()

func increment_progress() :
	if $HUD/Background/HBoxContainer/Progress.value < 95 :
		$HUD/Background/HBoxContainer/Progress.value += 5
	elif $HUD/Background/HBoxContainer/Progress.value < 100 :
		pass
		#monstruo final

func show_one_button_message(message, button) :
	get_tree().paused = true
	var message_window = Factory.create(Factory.MESSAGE)
	message_window.set_one_button_message(self, message, button)
	$HUD/Pause.add_child(message_window)
	$HUD/Pause.show()

func _on_button_released(button) :
	$HUD/Pause.hide()
	for i in $HUD/Pause.get_children() :
		if i.is_in_group("message") :
			i.queue_free()
	get_tree().paused = false