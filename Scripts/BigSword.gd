extends Node2D


var inGame = false


var attacking = false

var damage = 15.0

var speed = 3.0


func _ready():
	$Timer.start()
	pass 


func LimitSystem():
	
	$Timer.wait_time = speed
	
	if speed <= 0.7:
		speed = 0.7
	
	
	
	pass


func _process(delta):
	
	
	
	LimitSystem()
	
	attack()
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
	
	


func _on_Area2D_body_entered(body):
	
	
	if body.is_in_group("Enemy"):
		
		
		body.call_deferred("Damage" , damage)
	
	
	
	pass 
