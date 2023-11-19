class_name Moving_State
extends State

@export var player_movement: Player
@export var animation: AnimationPlayer
@export var velocity = Vector2.ZERO


signal player_actions

func _ready() -> void:
	set_physics_process(false)

func enter() -> void:
	set_physics_process(true)
	#animation.play("moving")

func exit() -> void:
	set_physics_process(false) 	

func _physics_process(delta) -> void:
	#sprite size and direction(flip)
	#move_and_collide or move_and_slide
	#var move = player_movement.move_and _collide(player_movement.velocity * delta)
	#move_and_slide delta is calulated automatically
	#player_actions.emit()
	pass	
	
	

	
	

