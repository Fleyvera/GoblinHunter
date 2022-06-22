extends KinematicBody2D

var dmgCD = false


#Enemy attributes
export (int) var speed

var life = 20


#Follow Sistem
onready var players = get_node("../Players")




func _ready():
	
	pass 





func _process(delta):
	
	Follow(delta)
	
	
	pass




func Follow(delta):
	
	var playerPos
	var distance1 = 0
	var distance2 = 0
	
	if Global.players == 1:
		
		playerPos = players.get_child(0).position
		
		if players.get_child(0).position > position:
			get_node("AnimatedSprite").flip_h = false
		else:
			get_node("AnimatedSprite").flip_h = true
		
		
	if Global.players == 2:
		
		distance1 = players.get_child(0).position.distance_to(position)
		distance2 = players.get_child(1).position.distance_to(position)
		
		if distance1 <= distance2:
			
			playerPos = players.get_child(0).position
			if players.get_child(0).position > position:
				get_node("AnimatedSprite").flip_h = false
			else:
				get_node("AnimatedSprite").flip_h = true
			
		else:
			
			playerPos = players.get_child(1).position
			if players.get_child(1).position > position:
				get_node("AnimatedSprite").flip_h = false
			else:
				get_node("AnimatedSprite").flip_h = true
		
		
	var dir = (playerPos - position).normalized()
	
	var move = dir.normalized() * speed * delta
	
	move_and_collide(move)
	
	
	
	pass



func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Weapon") and dmgCD == false:
		
		print(life)
		
		dmgCD = true
		life -= area.get_parent().damage
		$ShowDamage.ShowDamage(area.get_parent().damage)
		Death()
		$DmgCDTimer.start()
	
	pass # Replace with function body.


func _on_DmgCDTimer_timeout():
	#Timer que calcula o tempo para tomar dano dnv
	dmgCD = false
	
	pass 




func Death():
	
	if life <= 0:
		
		$XpDropper.call_deferred("Drop")
		$DeathTimer.start()
		$AnimatedSprite.play("Death")
		speed = 0
		$Area2D/CollisionShape2D.set_deferred("disabled",true)
		$CollisionShape2D.set_deferred("disabled",true)
		
		pass
	
	pass




func _on_DeathTimer_timeout():
	
	queue_free()
	
	pass





