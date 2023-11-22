class_name Player
extends CharacterBody2D

@export var buoyancy: float = 100.0
@export var gravity: float = 100.0
@export var pressure: float = 100.0
@export var propulsion: float = 150.0
# adding "as" and class name allow for auto complete
@onready var fsm = $"." as StateMachine
@onready var moving_state = $StateMachine/MovingState as Moving_State
@onready var shooting_state = $StateMachine/ShootingState as Shooting_state
@onready var damaged_state = $StateMachine/DamagedState as Damaged_state
@onready var distoryed_state = $StateMachine/DistoryedState as Distoryed_state


var playerprojectile = preload("res://Scenes/player_projectile.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
#connect states together here
#connect mothod needs arguments to work, change_state is not being called parentheses"()"	aren't needed.
#bind allow you to pass in the arguments.
#Change Player to state you want to connect to.
#moving_state.player_actions.connect(fsm.change_state.bind(Player)) 
	pass
	
func _process(delta) -> void:
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("Right"):
		velocity.x += 1
		
	if Input.is_action_pressed("Left"):
		velocity.x -= 1

	if Input.is_action_pressed("Up"):
		velocity.y -= 1

	if Input.is_action_pressed("Down"):
		velocity.y += 1	
		
	if Input.is_action_pressed("Shoot"):
		_shoot_projectile()			

	velocity *= propulsion
	move_and_slide()
	
func _shoot_projectile():
	var projectile = playerprojectile.instantiate()
	owner.add_child(projectile)
	projectile.transform = $HarpoonGun.global_transform	

func _physics_process(delta: float)-> void:
	pass



