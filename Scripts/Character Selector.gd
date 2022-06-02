extends Node2D

var characterPool = preload("res://Prefabs/CharacterPool.tscn")

var nCharacterPool


var player2
var charNum2 = 0


var player

var charTotal
var charNum = 0

func _ready():
	
	SelectorNum()
	
	if Global.players == 1:
		p1InvokeChar(charNum)
	else:
		p1InvokeChar(charNum)
		p2InvokeChar(charNum2)
	
	get_tree().paused = true
	
	
	pass 


func _process(delta):
	
	JoyStickSelect()
	
	pass


func SelectorNum():
	
	
	if Global.players == 1:
		$p1Selector.global_position = $pSoloPos.global_position
	else:
		$p1Selector.global_position = $p1Pos.global_position
		$p2Selector.global_position = $p2Pos.global_position
	pass



func _on_ReadyButton_pressed():
	
	get_tree().paused = false
	
	if Global.players == 1:
		p1Instance()
	else:
		p1Instance()
		p2Instance()
	
	queue_free()
	pass 



func p1InvokeChar(valor):
	
	nCharacterPool = characterPool.instance()
	
	charTotal = nCharacterPool.get_child_count() - 1
	
	player = nCharacterPool.spawnCharacter(valor)
	
	player.scale = Vector2(3 , 3)
	
	get_node("p1Selector").add_child(player)
	
	pass

func p1Instance():
	
	var realPlayer = player.duplicate()
	realPlayer.inGame = true
	realPlayer.global_position = $p1Pos.global_position
	get_owner().get_node("Players").add_child(realPlayer)
	
	pass


func _on_p1Left_pressed():
	
	if charNum < charTotal:
		player.queue_free()
		charNum += 1
		p1InvokeChar(charNum)
	
	pass 


func _on_p1Right_pressed():
	
	if charNum > 0:
		player.queue_free()
		charNum -= 1
		p1InvokeChar(charNum)
	
	
	pass 


func p2InvokeChar(valor):
	
	nCharacterPool = characterPool.instance()
	
	charTotal = nCharacterPool.get_child_count() - 1
	
	player2 = nCharacterPool.spawnCharacter(valor)
	
	player2.scale = Vector2(3 , 3)
	
	get_node("p2Selector").add_child(player2)
	
	pass

func p2Instance():
	
	var realPlayer2 = player2.duplicate()
	realPlayer2.inGame = true
	realPlayer2.player2 = true
	realPlayer2.global_position = $p2Pos.global_position
	get_owner().get_node("Players").add_child(realPlayer2)
	
	
	pass

func _on_p2Left_pressed():
	
	if charNum2 < charTotal:
		player2.queue_free()
		charNum2 += 1
		p2InvokeChar(charNum2)
	
	pass # Replace with function body.


func _on_p2Right_pressed():
	
	if charNum2 > 0:
		player2.queue_free()
		charNum2 -= 1
		p2InvokeChar(charNum2)
	
	
	pass # Replace with function body.


func JoyStickSelect():
	
	if Input.is_action_just_pressed("ArrowLeft"):
		_on_p2Left_pressed()
	elif Input.is_action_just_pressed("ArrowRight"):
		_on_p2Right_pressed()
	
	pass
