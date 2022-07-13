extends Node2D


var weapon

var level = 0

var leveling = 0

var dmgPrcnt

var percentage = 25

func _ready():
	
	weapon = get_parent().get_parent().get_node("Weapon").get_child(0)
	
	dmgPrcnt = (weapon.damage / 100) * percentage
	weapon.damage += dmgPrcnt
	
	pass 



func _process(delta):
	
	LevelingUpgrade()
	
	pass


func LevelingUpgrade():
	
	if leveling != level:
		#Damage
		
		dmgPrcnt = (weapon.damage / 100) * percentage
		weapon.damage += dmgPrcnt
		
		
		leveling = level
	
	pass
