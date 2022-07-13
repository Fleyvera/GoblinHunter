extends KinematicBody2D

var dmgCD = false

var isAlive = true

#Enemy attributes
export (int) var speed

var life = 20

var enemyDamage = 10

#Follow Sistem
onready var players = get_node("../Players")




func _ready():
	
	SetupLifeBar()
	
	pass 





func _process(delta):
	
	Follow(delta)
	ProcessLifeBar()
	DamageCoolDown()
	
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


func Damage(damage):
	
	#Acoes quando tomar dano
	if dmgCD == false:
		dmgCD = true
		life -= damage
		$ShowDamage.ShowDamage(damage)
		Death()
		if isAlive:
			$DmgCDTimer.start()
	
	
	pass

func DamageCoolDown():
	
	if isAlive:
		if dmgCD:
			$Area2D/CollisionShape2D.disabled = true
			speed = 0
		else:
			$Area2D/CollisionShape2D.disabled = false
			speed = 100
	
	pass 



func _on_DmgCDTimer_timeout():
	#Timer que calcula o tempo para tomar dano dnv
	dmgCD = false
	
	pass 


func Death():
	#Tudo que precisa para morrer
	
	if life <= 0:
		
		isAlive = false
		$DeathTimer.start() #ativa timer morte
		$AnimatedSprite.play("Death")
		speed = 0
		$CollisionShape2D.set_deferred("disabled",true)
		$Area2D/CollisionShape2D.set_deferred("disabled",true)
		
		pass
	
	pass



func _on_DeathTimer_timeout():
	#acaba timer morte
	$XpDropper.call_deferred("Drop")
	queue_free()
	
	pass

func SetupLifeBar():
	
	$LifeBar/LifeProgress.max_value = life
	
	pass


func ProcessLifeBar():
	
	
	
	$LifeBar/LifeProgress.value = life
	
	pass



