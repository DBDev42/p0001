extends Node

func _ready():
	var player = Factory.create(Factory.PLAYER)
	$Items.add_child(player)
	player.init(self, Vector2(1080/2, 1920*19/20))
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
	var enemy = Factory.create(Factory.ENEMY)
	$EnemySpawnZone/EnemySpawnSpot.set_offset(randi())
	$Items.add_child(enemy)
	enemy.init(self, $EnemySpawnZone/EnemySpawnSpot.get_position())

func _on_shoot(item) :
	for i in item.get_children() :
		if i.is_in_group("weapon") :
			print(item.get_position() + i.get_position())
			var s_item = Factory.create(Factory.SHOOT)
			$Items.add_child(s_item)
			s_item.init(self, item.get_position() + i.get_position())

func _on_collision(item1, item2) :
	print("collision")
	print(item1.get_name())
	print(item2.get_name())
	if item1.is_in_group("enemy") and item2.is_in_group("shoot") :
		item1.queue_free()
		item2.queue_free()