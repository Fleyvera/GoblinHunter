extends Node2D


var isFollowing = false

var attacking = false

var damage = 10

var speed = 300



func _ready():
	pass 



func _process(delta):
	
	var dir = transform.x
	
	translate(dir * speed * delta)
	pass





func _on_DamageArea2D_body_entered(body):
	
	if body.is_in_group("Enemy"):
		
		
		body.Damage(damage)
		queue_free()
		pass
	
	
	pass # Replace with function body.
