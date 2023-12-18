extends HBoxContainer


enum AIR_TANKS {tanks}

var scuba_tank = preload("res://Assets/Interactables/scuba tank.png")

@export var health: AIR_TANKS

func health_update(value):
	match health:
		AIR_TANKS.tanks:
			update_tanks(value)
			
func update_tanks(value):
	for i in get_child_count():
		get_child(i).visible = value > i
