extends Node2D


var xpPool = preload("res://Prefabs/XpPool.tscn")



func _ready():
	
	
	
	pass 



func _process(delta):
	
	
	
	pass



func Drop():
	
	var newXpPool = xpPool.instance()
	
	var newXp = newXpPool.spawnXp(0)
	
	newXp.global_position = global_position
	
	get_parent().get_parent().add_child(newXp)
	
	pass
