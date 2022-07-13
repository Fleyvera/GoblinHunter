extends Node2D


var enemyPool= preload("res://Prefabs/EnemyPool.tscn")


var enemy_num = 0

var time = 1

func _ready():
	
	pass 



func _process(delta):
	
	$Positions.global_position = get_parent().get_node("CameraController").global_position
	
	
	pass

func EnemySpawner():
	
	randomize()
	
	var nEnemyPool = enemyPool.instance()
	
	var enemy = nEnemyPool.spawnEnemy(enemy_num)
	
	var left = Vector2($Positions/Position2D.global_position.x , rand_range($Positions/Position2D.global_position.y , $Positions/Position2D2.global_position.y))
	
	var bottom = Vector2(rand_range($Positions/Position2D2.global_position.x , $Positions/Position2D3.global_position.x) , $Positions/Position2D2.global_position.y)
	
	var right = Vector2($Positions/Position2D3.global_position.x , rand_range($Positions/Position2D3.global_position.y , $Positions/Position2D4.global_position.y) )
	
	var top = Vector2(rand_range($Positions/Position2D4.global_position.x , $Positions/Position2D.global_position.x) , $Positions/Position2D.global_position.y)
	
	#enemy.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
	
	var side = rand_range(0 , 4)
	
	
	if side < 1:
		enemy.global_position = left
	elif side < 2:
		enemy.global_position = bottom
	elif side < 3:
		enemy.global_position = right
	elif side < 4:
		enemy.global_position = top
	
	
	get_owner().add_child(enemy)
	
	
	
	pass



func _on_EnemyTimer_timeout():
	
	$EnemyTimer.wait_time = time
	EnemySpawner()
	
	pass 


func _on_ScaleTimer_timeout():
	
	
	time -= 0.2
	if time <= 0.1:
		time = 0.8
		
	
	pass 
