extends HBoxContainer

@onready var AirTankClass = preload("res://UI/In-game HUD/air_tank_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func setMaxTanks(max: int):
		for i in range(max):
			var tanks = AirTankClass.instantiate()
			add_child(tanks)	
			
func updateTanks(currentTanks: int):
	var tanks = get_children()
	
	for i in range(currentTanks):
		tanks[i].update(true)
		
	for i in range(currentTanks, tanks.size()):
		tanks[i].update(false)	
		
	
