extends KinematicBody2D

#Sistemas do jogo
var inGame = false
export var player2 = false

#Movimento
var dir = Vector2()
var anim = ""

#Sistema de dano
var dmgCD = false

#Atributos
var speed = 350
var life = 100



func _ready():
	
	SetUpLifeSystem()
	
	pass


func _process(delta):
	
	if inGame:
		Move(delta)
	
	Anim()
	
	LifeSystem()
	
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

#Iniciando sistema de vida com a vida maxima
func SetUpLifeSystem():
	
	$LifeBar/LifeProgress.max_value = life
	
	pass


#Sistema de vida
func LifeSystem():
	
	
	$LifeBar/LifeProgress.value = life
	
	if inGame:
		$LifeBar.show()
	
	if life <= 0:
		get_tree().change_scene("res://Scenes/Menu.tscn")
	
	pass



#Teste para tomar dano
func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Enemy") and dmgCD == false:
		life -= area.get_parent().damage
		#Ativa cool down de dano
		dmgCD = true
		$DmgCDTimer.start()
	
	
	pass 


func _on_DmgCDTimer_timeout():
	
	dmgCD = false
	
	pass 
