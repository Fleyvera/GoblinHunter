extends Node2D


var enemyPool= preload("res://Prefabs/EnemyPool.tscn")


var enemy_num = 0


func _ready():
	
	Spawn()
	
	pass 



func _process(delta):
	
	
	
	
	pass

func EnemySpawner():
	
	var nEnemyPool = enemyPool.instance()
	
	var enemy = nEnemyPool.spawnEnemy(enemy_num)
	
	enemy.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y))
	
	add_child(enemy)
	
	pass


func Spawn():
	
	randomize()
	var time = rand_range(1 , 5)
	EnemySpawner()
	yield(get_tree().create_timer(time) , "timeout")
	Spawn()
	
	pass
