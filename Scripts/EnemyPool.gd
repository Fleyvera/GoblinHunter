extends Node2D


func spawnEnemy(valor):
	return get_children()[valor].duplicate()

func spawnRandomEnemy():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()
