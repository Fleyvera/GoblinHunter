extends Node2D

var bulletsPool = preload("res://Prefabs/BulletsPool.tscn")

var inGame = false




var damage = 10.0

var speed = 150.0




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
		
	if attacking == false:
		$DetectionArea2D/CollisionShape2D.disabled = true
	else:
		$DetectionArea2D/CollisionShape2D.disabled = false
	
	
	$ProgressBar.show()
	pass

func _ready():
	
	pass 



func _process(delta):
	
	
	ManaSystem(delta)
	pass





func _on_DetectionArea2D_area_entered(area):
	
	
	
	if area.is_in_group("Enemy"):
		
		$Sprite.look_at(area.global_position)
		
		Shoot()

	
	pass 



func Shoot():
	
	var nBulletsPool = bulletsPool.instance()
	
	var bullet = nBulletsPool.spawnBullet(0)
	
	bullet.global_position = global_position
	
	bullet.rotation_degrees = $Sprite.rotation_degrees
	
	bullet.damage = damage
	
	bullet.speed = speed
	
	get_parent().get_parent().get_parent().call_deferred("add_child", bullet)
	
	mana -= 0.2
	





