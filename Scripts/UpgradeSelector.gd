extends Node2D

var upSelectorPool = preload("res://Prefabs/UpgradeSelectorPool.tscn")

var upSelecQuantity = 1

var selected = 1


func _ready():
	
	UpgradeSelectorSpawner()
	
	pass 


func _process(delta):
	
	Mouse()
	MarkPos()
	SelectByKeyboard()
	
	
	pass


#Selection logic for all inputs, mouse, keyboard and joystick
func Mouse():
	
	var mPos = get_global_mouse_position()
	
	$CanvasLayer/Mouse.global_position = mPos
	
	pass


func MarkPos():
	
	if selected == 1:
		$CanvasLayer/Mark.global_position = $CanvasLayer/Up1.global_position
	if selected == 2:
		$CanvasLayer/Mark.global_position = $CanvasLayer/Up2.global_position
	if selected == 3:
		$CanvasLayer/Mark.global_position = $CanvasLayer/Up3.global_position


func _on_Up1Area_area_entered(area):
	
	if area.name == "Mouse":
		selected = 1
	
	pass # Replace with function body.


func _on_Up2Area_area_entered(area):
	
	if area.name == "Mouse":
		selected = 2
	
	
	pass # Replace with function body.


func _on_Up3Area_area_entered(area):
	
	if area.name == "Mouse":
		selected = 3

	
	pass # Replace with function body.


func SelectByKeyboard():
	
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("p2Right"):
		if selected == 1:
			selected = 2
		elif selected == 2:
			selected = 3
	
	
	if Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("p2Left"):
		if selected == 3:
			selected = 2
		elif selected == 2:
			selected = 1

func UpgradeSelectorSpawner():
	
	randomize()
	
	var rng = RandomNumberGenerator.new()
	
	var nUpSelectorPool = upSelectorPool.instance()
	
	
	#Sorteia primeiro UPGRADE
	var upgradesSelector_num = rng.randi_range(0 , upSelecQuantity)
	
	var Up1 = upgradesSelector_num
	
	var upgradeSelector = nUpSelectorPool.spawnUpgradeSelector(Up1)
	
	get_node("CanvasLayer/Up1").add_child(upgradeSelector)
	
	#Sorteia segundo UPGRADE
	upgradesSelector_num = rng.randi_range(0 , upSelecQuantity)
	
	var Up2 = upgradesSelector_num
	
#	if Up2 == Up1:
#		Up2+=1
	
	
	upgradeSelector = nUpSelectorPool.spawnUpgradeSelector(Up2)
	
	get_node("CanvasLayer/Up2").add_child(upgradeSelector)
	
	#Sorteia terceiro UPGRADE
	upgradesSelector_num = rng.randi_range(0 , upSelecQuantity)
	
	var Up3 = upgradesSelector_num
	
#	if Up3 == Up1 or Up3 == Up1:
#		Up3+=1
#	if Up3 == Up1 or Up3 == Up1:
#		Up3+=1
	
	upgradeSelector = nUpSelectorPool.spawnUpgradeSelector(Up3)
	
	get_node("CanvasLayer/Up3").add_child(upgradeSelector)
	
	pass




func _on_ConfirmButton_pressed():
	
	if selected == 1:
		$CanvasLayer/Up1.get_child(1).UpgradeSpawner()
		get_tree().paused = false
		queue_free()
	if selected == 2:
		$CanvasLayer/Up2.get_child(1).UpgradeSpawner()
		get_tree().paused = false
		queue_free()
	if selected == 3:
		$CanvasLayer/Up3.get_child(1).UpgradeSpawner()
		get_tree().paused = false
		queue_free()
	
	pass 


