extends Node2D

var level = 0

var xp = 0


func _ready():
	
	
	
	
	pass 



func _process(delta):
	
	
	XpSystem()
	
	pass


func _on_Area2D_area_entered(area):
	
	#Sistema de pegar xp
	
	if area.is_in_group("Xp"):
		#Se for do grupo xp
		
		
		#adiciona xp e deleta do mapa
		xp += area.get_parent().xpAmount
		area.get_parent().Follow(get_parent().global_position)
#		area.get_parent().queue_free()
		
	
	
	pass 



func XpSystem():
	
	$CanvasLayer/ProgressBar.value = xp
	$CanvasLayer/Label.set_text("Level " + str(level))
	
	
	if xp >= 100:
		
		level += 1
		xp = 0
	
	
	pass
