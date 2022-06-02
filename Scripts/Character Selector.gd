extends CanvasLayer

var optionsNum
var options
var total

func _ready():
	
	get_tree().paused = true
	
	options = get_node("Panel/Options")
	total = options.get_child_count() - 1
	optionsNum = 1
	
	pass 


func _process(delta):
	pass


func _on_ReadyButton_pressed():
	get_tree().paused = false
	queue_free()
	pass 

func CharacterSelector():
	
	
	
	pass


func _on_p1Left_pressed():
	
	if optionsNum < total:
		options.get_child(optionsNum).hide()
		optionsNum -= 1
		options.get_child(optionsNum).show()
	
	
	pass 


func _on_p1Right_pressed():
	
	if optionsNum > 0:
		options.get_child(optionsNum).hide()
		optionsNum += 1
		options.get_child(optionsNum).show()
	
	
	pass 
