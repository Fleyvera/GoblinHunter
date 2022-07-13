extends Node2D


var player

var level = 0

var leveling = 0

var spdPrcnt

var percentage = 15


func _ready():
	
	player = get_parent().get_parent()
	
	
	spdPrcnt = (player.speed / 100) * percentage
	player.speed += spdPrcnt
	
	pass 



func _process(delta):
	
	LevelingUpgrade()
	
	pass


func LevelingUpgrade():
	
	if leveling != level:
		
		spdPrcnt = (player.speed / 100) * percentage
		player.speed += spdPrcnt
		
		
		leveling = level
	
	pass
