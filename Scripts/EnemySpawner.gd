extends Node2D


var enemyPool= preload("res://Prefabs/EnemyPool.tscn")


var enemy_num = 0

var time = 1

func _ready():
	
	pass 



func _process(delta):
	
	
	
	
	pass

func EnemySpawner():
	
	randomize()
	
	var nEnemyPool = enemyPool.instance()
	
	var enemy = nEnemyPool.spawnEnemy(enemy_num)
	
	var left = Vector2($Position2D.global_position.x , rand_range($Position2D.global_position.y , $Position2D2.global_position.y))
	
	var bottom = Vector2(rand_range($Position2D2.global_position.x , $Position2D3.global_position.x) , $Position2D2.global_position.y)
	
	var right = Vector2($Position2D3.global_position.x , rand_range($Position2D3.global_position.y , $Position2D4.global_position.y) )
	
	var top = Vector2(rand_range($Position2D4.global_position.x , $Position2D.global_position.x) , $Position2D.global_position.y)
	
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
	
	
	print(time)
	pass



func _on_EnemyTimer_timeout():
	
	randomize()
	$EnemyTimer.wait_time = time
	EnemySpawner()
	
	pass 


func _on_ScaleTimer_timeout():
	
	
	time -= 0.2
	if time <= 0.2:
		time = 1
	
	pass 
