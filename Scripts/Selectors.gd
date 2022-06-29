extends Node2D


var upPool = preload("res://Prefabs/UpgradePool.tscn")

export var upgrade_num = 0



func _ready():
	pass 



#func _process(delta):
#	pass


func UpgradeSpawner():
	
	var nUpPool = upPool.instance()
	
	var upgrade = nUpPool.spawnUpgrade(upgrade_num)
	
#	weapon.scale = Vector2(10 ,10)
	
	get_parent().get_parent().get_parent().get_parent().get_node("Upgrades").add_child(upgrade)
	
	pass
