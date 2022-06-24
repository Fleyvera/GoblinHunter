extends Node2D


var enemyPool= preload("res://Prefabs/EnemyPool.tscn")


var enemy_num = 0


func _ready():
	
	pass 



func _process(delta):
	
	
	
	
	pass

func EnemySpawner():
	
	var nEnemyPool = enemyPool.instance()
	
	var enemy = nEnemyPool.spawnEnemy(enemy_num)
	
	enemy.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
	
	get_owner().add_child(enemy)
	
	pass



func _on_EnemyTimer_timeout():
	
	randomize()
	var time = rand_range(0.5 , 0.9)
	$EnemyTimer.wait_time = time
	EnemySpawner()
	
	pass # Replace with function body.
