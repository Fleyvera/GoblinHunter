extends Node2D


var damagePool = preload("res://Prefabs/DamagePool.tscn")

var nDamagePool

func _ready():
	
	nDamagePool = damagePool.instance()
	
	pass 



func _process(delta):
	pass


func ShowDamage(valor):
	
	var formatedValor =  "%.0f" % valor
	
	var newValor = nDamagePool.spawnDamage(0)
	
	newValor.get_child(0).set_text(str(formatedValor))
	
	add_child(newValor)
	
	pass
