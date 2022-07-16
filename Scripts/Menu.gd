extends Node2D


onready var pN = get_node("PlayersNumber")
onready var resolution = get_node("Resolution")

func _ready():
	
	OS.min_window_size = Vector2(960,540)
	ResolutionSelector()
	PlayersNumberSelector()
	
	pass 



func _process(delta):
	
	PlayersNumberSelectorTest()
	ResolutionSelectorTest()
	pass


func ResolutionSelector():
	
	resolution.add_item("960x540")
	resolution.add_item("1280x960")
	resolution.add_item("Borderless")
	
	
	
	pass


func ResolutionSelectorTest():
	
	
	pass



func PlayersNumberSelector():
	
	pN.add_item("SinglePlayer")
	pN.add_item("2 Players Coop")
	
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





func _on_Resolution_item_selected(index):
	
	var current_selected = index
	
	if current_selected == 0:
		OS.set_window_size(Vector2(960,540))
		OS.window_borderless = false
	elif current_selected == 1:
		OS.set_window_size(Vector2(1280,960))
		OS.window_borderless = false
	elif current_selected == 2:
		OS.set_window_size(Vector2(1920,1080))
		OS.window_borderless = true
		OS.window_position = Vector2( 0, 0 )
	pass 


func _on_CheckBox_toggled(button_pressed):
	
	
	OS.window_fullscreen = !OS.window_fullscreen
	
	if button_pressed == true:
		resolution.disabled = true
	else:
		resolution.disabled = false
	pass 
