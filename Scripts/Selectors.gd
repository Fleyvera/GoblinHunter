extends Node2D

#sistema de melhorar upgrade

export(String) var upgrade_name = ""

onready var upgrade = get_parent().get_parent().get_parent().get_parent().get_node("Upgrades").get_node_or_null(upgrade_name)


#Sistema de spanwar upgrade
var upPool = preload("res://Prefabs/UpgradePool.tscn")

export(int) var upgrade_num = 0



func _ready():
	
	#Modificando texto do upgrade com lv junto
	if upgrade != null:
		$Title.set_text(upgrade_name + " Lv: " + str(upgrade.level + 1))
	
	
	pass 



#func _process(delta):
#	pass

func UpgradeSpawner():
	
	if upgrade == null:
		var nUpPool = upPool.instance()
		
		var upgrade = nUpPool.spawnUpgrade(upgrade_num)
		
#	weapon.scale = Vector2(10 ,10)
		
		get_parent().get_parent().get_parent().get_parent().get_node("Upgrades").add_child(upgrade)
	else:
		
		upgrade.level += 1
	pass


