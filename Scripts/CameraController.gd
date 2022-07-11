extends Node2D

#Follow Sistem
onready var players = get_node("../Players")



func _ready():
	pass 

 
func _process(delta):
	
	
	Follow(delta)
	
	pass


func Follow(delta):
	
	var camPos
	var player1Pos
	var player2Pos
	var distance
	
	if Global.players == 1:
		
		camPos = players.get_child(0).global_position
		
		
		
		
	if Global.players == 2:
		
		player1Pos = players.get_child(0).global_position
		player2Pos = players.get_child(1).global_position
		
		distance = player1Pos.distance_to(player2Pos)
		
		if distance >= 900:
			$Camera2D.zoom += Vector2(0.01 , 0.01)
			if $Camera2D.zoom >= Vector2(1.8 , 1.8):
				$Camera2D.zoom = Vector2(1.8 , 1.8)
		else:
			$Camera2D.zoom -= Vector2(0.01 , 0.01)
			if $Camera2D.zoom <= Vector2(1.6 , 1.6):
				$Camera2D.zoom = Vector2(1.6 , 1.6)
		
		if distance >= 1700:
			players.get_child(0).global_position = global_position - Vector2(20 , 0)
			players.get_child(1).global_position = global_position + Vector2(20 , 0)
		
		
		camPos = (player1Pos + player2Pos) / 2
	
	
	
	
	global_position =  camPos
	
	
	
	pass
