extends Node2D


func spawnUpgrade(valor):
	return get_children()[valor].duplicate()
