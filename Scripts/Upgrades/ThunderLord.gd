extends Node2D

var level = 0
var leveling = 0
var percentage = 10


#Atributos
var damage = 20
var speed = 2
var area = 0.5

onready var player = get_parent().get_parent()

var pos = Vector2()


func LevelingUpgrade():
	
	if leveling != level:
		
		#Damage
		damage = damage / percentage * level + damage
		
		
		#Speed
		$Timer.wait_time = speed
		speed = speed - (speed / percentage * level) 
		
		
		#Range
		scale = Vector2(area / percentage * level + area, area / percentage * level + area)
		
		leveling = level
	
	
	pass


func _ready():
	
	
	
	pass 




func _process(delta):
	
	global_position = pos
	
	LevelingUpgrade()
	
	print(damage)
	
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


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		body.Damage(damage)
		
		pass
	
	
	pass 
