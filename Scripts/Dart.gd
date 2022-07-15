extends Node2D


var enemyDamage

var speed


func _ready():
	
	
	pass 



func _physics_process(delta):
	
	var dir = transform.x
	
	translate(dir * speed * delta)
	pass




func _on_DeleteTimer_timeout():
	
	
	queue_free()
	
	pass 
