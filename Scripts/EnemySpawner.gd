extends Node2D


var enemysOnGame = 0

var enemyPool= preload("res://Prefabs/EnemyPool.tscn")


export var enemy_num = 0

var enemyCountExplo = 0
var enemyCountRanged = 0

var time = 0.8

var scaleTime = 14

func _ready():
	
	pass 



func _process(delta):
	
	$Positions.global_position = get_parent().get_node("CameraController").global_position
	SpawnSpecials()
	
	print(enemysOnGame)
	
	pass

func EnemySpawner(enemy_num):
	
	
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
	
	if enemysOnGame <= 300:
		$EnemyTimer.wait_time = time
		$ScaleTimer.wait_time = scaleTime
		EnemySpawner(0)
		enemyCountExplo += 1
		enemyCountRanged += 1
		
		enemysOnGame += 1
	pass 


func _on_ScaleTimer_timeout():
	
	
	time -= 0.1
	scaleTime -= 2
	
	if scaleTime <= 2:
		scaleTime = 14
	
	
	if time <= 0.4:
		time = 0.8
	
	pass 


func SpawnSpecials():
	
	if enemyCountExplo >= 15 and enemysOnGame <= 300:
		EnemySpawner(2)
		enemyCountExplo = 0
		
		enemysOnGame += 1
	if enemyCountRanged >= 30 and enemysOnGame <= 300:
		EnemySpawner(1)
		enemyCountRanged = 0
		
		enemysOnGame += 1
	pass

