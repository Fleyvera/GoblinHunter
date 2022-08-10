extends TileMap



# If you want to randomize on runtime:
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	for cell_position in get_used_cells():
		var num = rng.randi_range(0, 4)
		var randTiles = rng.randi_range(0,100)
		if randTiles <= 95:
			set_cellv(cell_position, 1)
		else:
			set_cellv(cell_position, num)
	

