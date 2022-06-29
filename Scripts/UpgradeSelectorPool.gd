extends Node2D



func spawnUpgradeSelector(valor):
	return get_children()[valor].duplicate()


func spawnRandomUpgradeSelector():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()
