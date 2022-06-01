extends Node2D


onready var pN = get_node("PlayersNumber")


func _ready():
	
	PlayersNumberSelector()
	
	pass 



func _process(delta):
	
	PlayersNumberSelectorTest()
	
	pass


func PlayersNumberSelector():
	
	pN.add_item("1")
	pN.add_item("2")
	
	pass

func PlayersNumberSelectorTest():
	
	if pN.selected == 0:
		Global.players = 1
	elif pN.selected == 1:
		Global.players = 2
	
	pass



func _on_StartButton_pressed():
	
	get_tree().change_scene("res://Scenes/Game.tscn")
	
	pass



