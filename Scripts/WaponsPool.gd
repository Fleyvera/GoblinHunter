extends Node2D


func spawnWeapon(valor):
	return get_children()[valor].duplicate()

func spawnRandomWeapon():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()
