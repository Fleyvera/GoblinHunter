extends KinematicBody2D


var speed = 200
var dir = Vector2()

var anim = ""

func _ready():
	pass


func _process(delta):
	
	Move(delta)
	
	#Anim()
	
	
	pass



func Move(delta):
	
		#Movimento
	
	dir = Vector2()
	
	if Input.is_action_pressed("Left"):
		dir += Vector2(-1 , 0)
	
	if Input.is_action_pressed("Right"):
		dir += Vector2(1 , 0)
	
	if Input.is_action_pressed("Up"):
		dir += Vector2(0 , -1)
	
	if Input.is_action_pressed("Down"):
		dir += Vector2(0 , 1)
	
	move_and_collide(dir.normalized() * speed * delta)
	
	pass


#func Anim():
#
#	#Anim
#
#	if dir != Vector2():
#		anim = "Walk"
#	else:
#		anim = "Idle"
#
#
#
#	get_node("AnimatedSprite").play(anim)
#
#	pass








