extends Node2D


var wpPool = preload("res://Prefabs/WeaponsPool.tscn")

export var weapon_num = 0

var inGame = false

var wpSpawned = false


func _ready():
	
	
	
	pass



func _process(delta):
	
	isInGame()
	
	if inGame and wpSpawned == false:
		WeaponSpawner()
		wpSpawned = true
	
	
	pass

func isInGame():
	
	if get_parent().inGame == true and inGame == false:
		inGame = true
		pass
	
	pass


func WeaponSpawner():
	
	var nWpPool = wpPool.instance()
	
	var weapon = nWpPool.spawnWeapon(weapon_num)
	
#	weapon.scale = Vector2(10 ,10)
	
	add_child(weapon)
	
	pass
