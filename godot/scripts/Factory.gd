extends Node

const LEVEL = "Level"
const PLAYER = "Player"
const BASIC_ENEMY = "BasicEnemy"
const INTERMEDIATE_ENEMY = "IntermediateEnemy"
const ADVANCE_ENEMY = "AdvanceEnemy"
const PLAYER_SHOOT = "PlayerShoot"
const ENEMY_SHOOT = "EnemyShoot"
const MESSAGE = "Message"

var types = [LEVEL, PLAYER, BASIC_ENEMY, INTERMEDIATE_ENEMY, ADVANCE_ENEMY, PLAYER_SHOOT, ENEMY_SHOOT, MESSAGE]

func create(type):
	var correct_type = false
	if types.has(type) :
		correct_type = true
	if correct_type :
		var i = load("res://scenes/"+ type +".tscn").instance()
		return i