extends Node2D


func spawnCharacter(valor):
	return get_children()[valor].duplicate()

func spawnRandomCharacter():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()


func spawnCharacterSprite(valor):
	return get_children()[valor].get_node("AnimatedSprite").duplicate()
