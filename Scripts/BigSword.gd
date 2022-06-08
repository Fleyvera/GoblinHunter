extends KinematicBody2D






func _ready():
	
	if get_parent().get_parent().inGame == false:
		
		$Timer.start()
		
	
	pass 



func _process(delta):
	pass


func _on_Timer_timeout():
	
	$AnimatedSprite.visible = true
	$AnimatedSprite.play("Attack")
	$CollisionShape2D.disabled = false
	$Area2D/CollisionShape2D.disabled = false
	yield(get_tree().create_timer(0.7) , "timeout")
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 0
	$AnimatedSprite.visible = false
	$CollisionShape2D.disabled = true
	$Area2D/CollisionShape2D.disabled = true
	$Timer.start()
	
	
	pass



