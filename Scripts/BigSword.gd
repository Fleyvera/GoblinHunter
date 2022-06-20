extends Node2D


var inGame = false


var attacking = false

var damage = 10

var speed = 0.7


func _ready():
	
	pass 



func _process(delta):
	
	isInGame()
	attack()
	pass


func isInGame():
	
	if get_parent().get_parent().inGame == true and inGame == false:
		inGame = true
		$Timer.start()
		pass
	
	pass


func _on_Timer_timeout():
	
	#attack visual
	
	$AnimatedSprite.visible = true
	$AnimatedSprite.play("Attack")
	attacking = true
	yield(get_tree().create_timer(0.7) , "timeout")
	attacking = false
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 0
	$AnimatedSprite.visible = false
	$Timer.start()
	
	
	pass


func attack():
	
	if attacking == true:
		yield(get_tree().create_timer(0.5) , "timeout")
		$Area2D/CollisionShape2D.set_deferred("disabled",false)
		yield(get_tree().create_timer(0.1) , "timeout")
		$Area2D/CollisionShape2D.set_deferred("disabled",true)
	
	
