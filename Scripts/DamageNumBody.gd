extends RigidBody2D



func _ready():
	
	randomize()
	
	apply_impulse(Vector2(0 , 0) , Vector2(rand_range(60 , -60) , -60))
	
	pass 



func _process(delta):
	pass


func _on_Timer_timeout():
	
	queue_free()
	
	pass 
