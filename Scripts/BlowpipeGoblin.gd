extends KinematicBody2D

var dmgCD = false

var isAlive = true

var shooting = false

var shootDelay = false

var playerPos

var time = 0.0

var setTime = 1.0

#Enemy attributes
export (int) var speed = 190

var trueSpeed = speed

var life = 20

var enemyDamage = 10

var shotSpeed = 200

#Follow Sistem
onready var players = get_node("../Players")

const bulletsPool = preload("res://Prefabs/BulletsPool.tscn")


func _ready():
	
	SetupLifeBar()
	
	pass 


func _physics_process(delta):
	
	if isAlive:
		FollowAndShoot(delta)
	pass


func _process(delta):
	
	ProcessLifeBar()
	DamageCoolDown()
	print(shooting)
	pass



func Follow(delta):
	
	
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



func _on_DetectionArea_area_entered(area):
	
	if area.is_in_group("Player"):
		shooting = true
	
	
	pass 


func _on_DetectionArea_area_exited(area):
	
	if area.is_in_group("Player"):
		shooting = false
	
	pass 


func FollowAndShoot(delta):
	
	
	
	if shooting == false and isAlive:
		Follow(delta)
		$AnimatedSprite.play("Walk")
		$ShootTimer.stop()
		shootDelay = false
	elif shooting == true:
		$mira.look_at(playerPos)
		$AnimatedSprite.play("Shooting")
		if shootDelay == false:
			Shoot()
			$ShootTimer.start()
			shootDelay = true
	pass

func Shoot():
	
	var nBulletsPool = bulletsPool.instance()
	
	var bullet = nBulletsPool.spawnBullet(1)
	
	bullet.global_position = global_position
	
	bullet.rotation_degrees = $mira.rotation_degrees
	
	bullet.enemyDamage = enemyDamage
	
	bullet.speed = shotSpeed
	
	get_parent().get_parent().call_deferred("add_child", bullet)
	
	
	pass


func _on_ShootTimer_timeout():
	
	shootDelay = false
	
	pass 
