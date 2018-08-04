extends Node

const LEVEL = "Level"
const PLAYER = "Player"
const ENEMY = "Enemy"
const SHOOT = "Shoot"

var types = [LEVEL, PLAYER, ENEMY, SHOOT]

func create(type):
	var correct_type = false
	for i in types :
		if i == type :
			correct_type = true
			break
	if correct_type :
		print("res://scenes/"+ type +".tscn")
		var i = load("res://scenes/"+ type +".tscn").instance()
		return i