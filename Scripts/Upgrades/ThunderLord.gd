extends Node2D

var damage = 20

onready var player = get_parent().get_parent()

var pos = Vector2()


func _ready():
	
	
	
	pass 



func _process(delta):
	
	global_position = pos
	
	pass


func _on_Timer_timeout():
	
	
	randomize()
	
	var spawnThunderPos = Vector2(rand_range(player.global_position.x - 150 , player.global_position.x + 150) , rand_range(player.global_position.y - 200 , player.global_position.y + 80))
	
#	pos = spawnThunderPos
	
	$Area2D.global_position = spawnThunderPos 
	$ThunderSprite.global_position = Vector2($Area2D.global_position.x , $Area2D.global_position.y + 0)
	
	$ThunderSprite.frame = 0
	$ThunderSprite.show()
	$ThunderSprite.play()
	$TimerStop.start()
	$Area2D/CollisionShape2D.set_deferred("disabled" , false)
	
	pass


func _on_TimerStop_timeout():
	
	$ThunderSprite.hide()
	$ThunderSprite.frame = 0
	$ThunderSprite.stop()
	$Area2D/CollisionShape2D.set_deferred("disabled" , true)
	
	
	pass 
