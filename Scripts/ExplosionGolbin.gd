extends KinematicBody2D

var dmgCD = false

var isAlive = true

#Enemy attributes
export (int) var speed = 190

var trueSpeed = speed

var life = 20

var enemyDamage = 10

var explosionDamage = 20

#Follow Sistem
onready var players = get_node("../Players")



func setPhysic():
	
	
	
	pass



func _ready():
	
	SetupLifeBar()
	
	pass 


func _physics_process(delta):
	
	if isAlive:
		Follow(delta)
	pass


func _process(delta):
	
	
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
	
	var move = dir.normalized() * trueSpeed
	
	move_and_slide(move)
	
	
	
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
			trueSpeed = 0
		else:
			$Area2D/CollisionShape2D.disabled = false
			trueSpeed = speed
	
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
		yield(get_tree().create_timer(0.4) , "timeout")
		$AnimatedSprite.hide()
		$CPUParticles2D.emitting = true
		$ExplosionArea/CollisionShape2D.set_deferred("disabled",false)
		get_parent().get_node("EnemySpawner").enemysOnGame -= 1
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



func _on_ExplosionArea_area_entered(area):
	
	if area.is_in_group("Enemy"):
		area.get_parent().Damage(20)
	
	pass


func _on_DetectionArea_area_entered(area):
	
	
	if area.is_in_group("Player"):
		life = 0
		Death()
	
	pass 
