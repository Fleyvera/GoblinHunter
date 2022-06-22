extends RigidBody2D

export (int) var xpAmount


func _ready():
	
	XpAmount()
	Drop()
	
	pass



func _process(delta):
	pass



func XpAmount():
	
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	var XpNum = random.randi_range(1 , 3)
	
	if XpNum == 1:
		
		$Little.show()
		$Medium.hide()
		$Big.hide()
		xpAmount = 1
		
	elif XpNum == 2:
		
		$Little.hide()
		$Medium.show()
		$Big.hide()
		xpAmount = 2
		
	else:
		
		$Little.hide()
		$Medium.hide()
		$Big.show()
		xpAmount = 3
	
	
	
	
	pass





func Drop():
	
	
	randomize()
	
	apply_impulse(Vector2(0 , 0) , Vector2(rand_range(30 , -30) , -30))
	$DropTimer.start()
	
	
	
	pass


func _on_DropTimer_timeout():
	
	mode = 1
	pass 



func Follow(dir):
	
	set_deferred("mode" , 0)
	print("ai")
	linear_velocity = (dir - global_transform.origin) * 2
	$PickTimer.start()
	
	pass


func _on_PickTimer_timeout():
	
	
	queue_free()
	
	
	pass 
