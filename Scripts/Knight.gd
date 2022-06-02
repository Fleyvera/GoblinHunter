extends KinematicBody2D

var inGame = false

export var player2 = false

var speed = 350
var dir = Vector2()

var anim = ""

func _ready():
	
	pass


func _process(delta):
	
	if inGame:
		Move(delta)
	
	Anim()
	
	
	pass



func Move(delta):
	
		#Movimento
	
	dir = Vector2()
	
	if player2 == false:
		
		if Input.is_action_pressed("Left"):
			dir += Vector2(-1 , 0)
			get_node("AnimatedSprite").flip_h = true
		
		if Input.is_action_pressed("Right"):
			dir += Vector2(1 , 0)
			get_node("AnimatedSprite").flip_h = false
		
		if Input.is_action_pressed("Up"):
			dir += Vector2(0 , -1)
		
		if Input.is_action_pressed("Down"):
			dir += Vector2(0 , 1)
	else:
		
		if Input.is_action_pressed("p2Left"):
			dir += Vector2(-1 , 0)
			get_node("AnimatedSprite").flip_h = true
		
		if Input.is_action_pressed("p2Right"):
			dir += Vector2(1 , 0)
			get_node("AnimatedSprite").flip_h = false
		
		if Input.is_action_pressed("p2Up"):
			dir += Vector2(0 , -1)
		
		if Input.is_action_pressed("p2Down"):
			dir += Vector2(0 , 1)
	
	move_and_collide(dir.normalized() * speed * delta)
	
	pass


func Anim():

	#Anim

	if dir != Vector2():
		anim = "Walk"
	else:
		anim = "Idle"
	get_node("AnimatedSprite").play(anim)
	
	
	pass







