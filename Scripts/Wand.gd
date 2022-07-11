extends Node2D

var bulletsPool = preload("res://Prefabs/BulletsPool.tscn")

var inGame = false




var damage = 10

var speed = 3




var manaPool = 5
var mana = 0
var attacking = false


func ManaSystem(delta):
	
	if mana <= 0:
		mana = 0
		attacking = false
	
	if mana >= manaPool:
		attacking = true
	
	if attacking == false:
		mana += delta
	
	
	$ProgressBar.max_value = 5
	$ProgressBar.value = mana
	
	
	pass

func _on_ManaTimer_timeout():
	
	
	
	pass


func _ready():
	pass 



func _process(delta):
	
	isInGame()
	ManaSystem(delta)
	pass


func isInGame():
	
	if get_parent().get_parent().inGame == true and inGame == false:
		inGame = true
		pass
	
	pass





func _on_DetectionArea2D_body_entered(body):
	
	if body.is_in_group("Enemy"):
		if attacking:
			$Sprite.look_at(body.global_position)
			
			Shoot()
			
			$DetectionArea2D/CollisionShape2D.set_deferred("disabled" , true)
			yield(get_tree().create_timer(0.3) , "timeout")
			$DetectionArea2D/CollisionShape2D.set_deferred("disabled" , false)
		
		pass
	
	
	
	pass 

func Shoot():
	
	var nBulletsPool = bulletsPool.instance()
	
	var bullet = nBulletsPool.spawnBullet(0)
	
	bullet.global_position = global_position
	
	bullet.rotation_degrees = $Sprite.rotation_degrees
	
	get_parent().get_parent().get_parent().call_deferred("add_child", bullet)
	
	mana -= 0.2
	



