class_name Camera
extends Camera2D

@onready var player = get_node("../Player") as Player

func _ready():
	pass 

func _process(delta):
	#camera zoom needs to be less than 0.7 to work properly and follow the player
	position = player.global_position
	
