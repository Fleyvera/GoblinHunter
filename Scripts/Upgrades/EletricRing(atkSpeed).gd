extends Node2D


var weapon

var level = 0

var leveling = 0

var spdPrcnt

var percentage = 20


func _ready():
	
	weapon = get_parent().get_parent().get_node("Weapon").get_child(0)
	
	if weapon.name == "Wand":
		spdPrcnt = (weapon.speed / 100) * percentage
		weapon.speed += spdPrcnt
	
	if weapon.name == "BigSword":
			spdPrcnt = (weapon.speed / 100) * percentage
			weapon.speed -= spdPrcnt
	
	
	pass 



func _process(delta):
	
	LevelingUpgrade()
	
	pass


func LevelingUpgrade():
	
	
	
	if leveling != level:
		
		if weapon.name == "Wand":
			spdPrcnt = (weapon.speed / 100) * percentage
			weapon.speed += spdPrcnt
		
		if weapon.name == "BigSword":
			spdPrcnt = (weapon.speed / 100) * percentage
			weapon.speed -= spdPrcnt
		
		
		leveling = level
	
	pass
