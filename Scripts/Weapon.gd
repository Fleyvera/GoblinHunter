extends Node2D


var wpPool = preload("res://Prefabs/WaponsPool.tscn")

export var weapon_num = 0


func _ready():
	
	WeaponSpawner()
	
	pass



func _process(delta):
	pass

func WeaponSpawner():
	
	var nWpPool = wpPool.instance()
	
	var weapon = nWpPool.spawnWeapon(weapon_num)
	
	add_child(weapon)
	
	pass
