extends Node2D



var damage

var speed


func _ready():
	
	
	pass 



func _process(delta):
	
	var dir = transform.x
	
	translate(dir * speed * delta)
	pass




func _on_DamageArea2D_area_entered(area):
	
	if area.is_in_group("Enemy"):
		
		area.get_parent().Damage(damage)
		
		queue_free()
	
	pass 


func _on_DeleteTimer_timeout():
	
	
	queue_free()
	
	pass 
