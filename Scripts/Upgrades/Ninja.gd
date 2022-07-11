extends Node2D


var level = 0
var leveling = 0
var percentage = 10


#Atributos
var damage = 10
var speed = 0.01
var area = 0.5


func LevelingUpgrade():

	if leveling != level:
		
		#Damage
		damage = damage / percentage * level + damage
		
		
		#Speed
		speed = speed / percentage * level + speed
		
		
		#Range
		scale = Vector2(area / percentage * level + area, area / percentage * level + area)
		
		leveling = level

	pass



func _ready():
	
	
	
	pass 



func _process(delta):
	
	Spin()
	ShurikenQnt()
	LevelingUpgrade()
	
	
	
	
	pass



func Spin():
	
	
	rotation += speed
	
	$Shurinken/Sprite.rotation -= 0.1
	
	$Shurinken2/Sprite.rotation -= 0.1
	
	$Shurinken3/Sprite.rotation -= 0.1
	
	$Shurinken4/Sprite.rotation -= 0.1
	
	
	pass


func ShurikenQnt():
	
	if level == 1:
		$Shurinken2/Sprite.show()
		$Area2D2/CollisionShape2D.disabled = false
	elif level == 2:
		$Shurinken3/Sprite.show()
		$Area2D3/CollisionShape2D.disabled = false
	elif level == 3:
		$Shurinken4/Sprite.show()
		$Area2D4/CollisionShape2D.disabled = false
	
	
	pass


func _on_Area2D_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		body.Damage(damage)
		
		pass
	
	pass 


func _on_Area2D2_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		body.Damage(damage)
		
		pass
	
	
	pass 


func _on_Area2D3_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		body.Damage(damage)
		
		pass
	
	pass 


func _on_Area2D4_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		body.Damage(damage)
		
		pass
	
	pass 
