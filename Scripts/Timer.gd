extends Node2D

var secs = 0

var mins = 0

func _ready():
	pass 



func _process(delta):
	
	TimerSystem()
	
	pass


func _on_Timer_timeout():
	
	secs += 1
	
	pass 

func TimerSystem():
	
	if secs < 10 and mins < 10:
		$Label.set_text("0" + str(mins)  + ":0" + str(secs))
	elif secs < 10 and mins >= 10:
		$Label.set_text(str(mins)  + ":0" + str(secs))
	elif secs >= 10 and mins < 10:
		$Label.set_text("0" + str(mins)  + ":" + str(secs))
	elif secs >= 10 and mins >= 10:
		$Label.set_text(str(mins)  + ":" + str(secs))
	
	
	if secs > 59:
		secs = 0
		mins += 1
	
	
	pass
