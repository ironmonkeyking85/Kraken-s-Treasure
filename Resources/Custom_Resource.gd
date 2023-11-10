extends Resource
class_name CustomResource

@export var speed: int 
@export var gravity: float 
@export var buoyancy: float 

func _ocean_movement(sway: int):
	sway = gravity / buoyancy
	buoyancy = Vector2.AXIS_Y - gravity
	

