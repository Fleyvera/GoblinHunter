extends Node2D


func spawnDamage(valor):
	return get_children()[valor].duplicate()
