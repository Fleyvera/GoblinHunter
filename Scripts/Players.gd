extends Node2D

var characterPool = preload("res://Prefabs/CharacterPool.tscn")

var player_num = 0

func _ready():
	
#	if Global.players == 1:
#
#		var nCharacterPool = characterPool.instance()
#
#		var player = nCharacterPool.spawnCharacter(player_num)
#
#		player.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
#
#		add_child(player)
#
#	elif Global.players == 2:
#
#		var nCharacterPool = characterPool.instance()
#
#		var player = nCharacterPool.spawnCharacter(player_num)
#
#		player.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
#
#		add_child(player)
#
#		nCharacterPool = characterPool.instance()
#
#		player = nCharacterPool.spawnCharacter(player_num)
#
#		player.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
#
#		add_child(player)
	
	pass 



func _process(delta):
	
	
	
	pass
