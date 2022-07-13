extends Node2D

var level = 0

var xp = 0

var xpTarget = 100.0

var percentage = 10.0


var inGame = false


var upgradeSelector = preload("res://Prefabs/UpgradeSelector.tscn")


var push = false


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
	
	Push()
	
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
	
	$CanvasLayer/Layer/ProgressBar.max_value = xpTarget
	$CanvasLayer/Layer/ProgressBar.value = xp
	$CanvasLayer/Layer/Label.set_text("Level " + str(level))
	
	print(xpTarget)
	
	if xp >= xpTarget:
		
		level += 1
		xp = 0
		var xpPrcnt
		xpPrcnt = (xpTarget / 100) * percentage
		xpTarget += xpPrcnt
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


func PushEnemy():
	
	push = true
	
	pass


func Push():
	
	if push:
		$PushBody/CollisionShape2D.disabled = false
		$PushBody.scale += Vector2(0.3 , 0.3)
		if $PushBody.scale >= Vector2(5 , 5):
			$PushBody/CollisionShape2D.disabled = true
			$PushBody.scale = Vector2(1 ,1)
			push = false
			
	
	pass

