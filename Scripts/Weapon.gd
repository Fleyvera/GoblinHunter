extends Node2D


var wpPool = preload("res://Prefabs/WeaponsPool.tscn")

export var weapon_num = 0


func _ready():
	
	WeaponSpawner()
	
	pass



func _process(delta):
	pass

func WeaponSpawner():
	
	var nWpPool = wpPool.instance()
	
	var weapon = nWpPool.spawnWeapon(weapon_num)
	
#	weapon.scale = Vector2(10 ,10)
	
	add_child(weapon)
	
	pass
