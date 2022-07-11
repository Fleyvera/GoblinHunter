extends Node2D




func _ready():
	
	get_parent().get_parent().life = get_parent().get_parent().maxLife
	
	pass 



func _process(delta):
	
	pass


func _on_Timer_timeout():
	
	queue_free()
	
	pass 
