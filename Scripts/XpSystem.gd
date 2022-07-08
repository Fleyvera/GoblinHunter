extends Node2D

var level = 0

var xp = 0

var inGame = false


var upgradeSelector = preload("res://Prefabs/UpgradeSelector.tscn")





func _ready():
	pass 


func UpgradeSelection():
	
	var nUpgradeSelector = upgradeSelector.instance()
	
	get_parent().add_child(nUpgradeSelector)
	
	get_tree().paused = true
	pass


func _process(delta):
	
	isInGame()
	
	playerNumPos()
	
	XpSystem()
	
	pass

func _on_DetectionArea_area_entered(area):
	
		
	#Sistema de pegar xp
	
	if area.is_in_group("Xp"):
		#Se for do grupo xp
		
		
		#xp começa a seguir
		
		area.get_parent().isFollowing = true

		
	pass 


func _on_PickUpArea_area_entered(area):
	
	if area.is_in_group("Xp"):
		xp += area.get_parent().xpAmount
		area.get_parent().queue_free()
		
	pass 



func XpSystem():
	
	$CanvasLayer/Layer/ProgressBar.value = xp
	$CanvasLayer/Layer/Label.set_text("Level " + str(level))
	
	
	if xp >= 10:
		
		level += 1
		xp = 0
		UpgradeSelection()
	
	pass

#Determina a posicao da barra de xp pra cada player
func playerNumPos():
	
	
	if get_parent().player2 == true:
		$CanvasLayer/Layer.position.y = 45
	
	
	pass

func isInGame():
	
	if get_parent().inGame == true and inGame == false:
		inGame = true
		pass
	
	if inGame:
		$CanvasLayer/Layer.show()
	
	pass



