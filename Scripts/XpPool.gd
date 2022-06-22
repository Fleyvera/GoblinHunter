extends Node2D


func spawnXp(valor):
	return get_children()[valor].duplicate()

func spawnRandomXp():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()
