class_name Moving_State
extends State

@export var player_movement: Player
@export var animation: AnimationPlayer
@export var velocity = Vector2.ZERO


signal player_actions

func _ready():
	set_physics_process(false)

func enter() -> void:
	set_physics_process(true)
	#animation.play("moving")

func exit() -> void:
	set_physics_process(false) 	

func _physics_process(delta):
	pass	
	
	

	
	

