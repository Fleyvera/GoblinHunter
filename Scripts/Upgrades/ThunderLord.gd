extends Node2D

var level = 0
var leveling = 0
var percentage = 10


#Atributos
var damage = 20.0
var speed = 2.0
var area = 0.5

onready var player = get_parent().get_parent()

var pos = Vector2()


func LevelingUpgrade():
	
	if leveling != level:
		
		#Damage
		var dmgPrcnt
		dmgPrcnt = (damage / 100) * percentage
		damage += dmgPrcnt
		
		
		#Speed
		var spdPrcnt
		spdPrcnt = (speed / 100) * percentage
		speed -= spdPrcnt
		$Timer.wait_time = speed
		
		
		#Range
		var rngPrcnt
		rngPrcnt = scale.x / 100 * percentage
		scale += Vector2(rngPrcnt, rngPrcnt)
		
		
		leveling = level
	
	
	pass


func _ready():
	
	
	
	pass 




func _process(delta):
	
	global_position = pos
	
	LevelingUpgrade()
	
	
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
