extends RigidBody2D

export (int) var xpAmount

var isFollowing = false

onready var players = get_node("../Players")

var speed = 10

func _ready():
	
	XpAmount()
	Drop()
	
	pass



func _process(delta):
	
	Follow(delta)
	
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
	
	apply_impulse(Vector2(0 , 0) , Vector2(rand_range(0 , 0) , -30))
	$DropTimer.start()
	
	
	
	pass


func _on_DropTimer_timeout():
	
	mode = 1
	pass 


func Follow(delta):
	
	
	var playerPos
	var distance1 = 0
	var distance2 = 0
	
	if isFollowing:
		set_deferred("mode" , 3)
		
		if Global.players == 1:
			
			playerPos = players.get_child(0).position
			
			
		if Global.players == 2:
			
			distance1 = players.get_child(0).position.distance_to(position)
			distance2 = players.get_child(1).position.distance_to(position)
			
			if distance1 <= distance2:
				
				playerPos = players.get_child(0).position
				
			
			else:
				
				playerPos = players.get_child(1).position
				
			
		
		
		var dir = (playerPos - position).normalized()
		
		speed += 10
		
		var move = dir.normalized() * speed * delta
		
		position += move
	
	
	pass


