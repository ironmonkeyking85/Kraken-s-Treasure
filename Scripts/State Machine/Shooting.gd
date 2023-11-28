class_name Shooting_state
extends State

# Attack sound resource path
const attack_sound : String = "AttackAudio"

# Timer for controlling the attack cooldown
@onready var attack_timer : Timer = get_node("attack_timer")

# Audio player for the attack sound
var audio_attack : AudioStreamPlayer = null
# Preloaded player projectile scene
var playerprojectile = preload("res://Scenes/player_projectile.tscn")

# Initialize the shooting state with a reference to the character body.
#The super() method in the context of this code is used to call the corresponding 
#method in the parent class (State).
func Initialize(characterBody : CharacterBody2D) -> void:
	super(characterBody)
# Initialize the audio attack player with the specified sound resource.
	audio_attack = audio_attack.get_node(attack_sound)

func enter() -> void:
	super()
	
	audio_attack.play()
	
	attack_timer.start()
	

func exit() -> void:
	super()

func input(event : InputEvent) -> StateMachine.PlAYERSTATES:
	return StateMachine.PlAYERSTATES.INVALID
	
func main_update(_delta : float) -> StateMachine.PlAYERSTATES:
	return StateMachine.PlAYERSTATES.INVALID
	
func physics_update(_delta: float) -> StateMachine.PlAYERSTATES:
	if Input.is_action_pressed("Shoot"):
		_shoot_projectile()			

	if (attack_timer.is_stopped()):
		return StateMachine.PlAYERSTATES.IDLE
		
	elif (attack_timer.is_stopped()):
		return StateMachine.PlAYERSTATES.MOVING
		
	return StateMachine.PlAYERSTATES.INVALID

# Function to shoot a projectile.
func _shoot_projectile():
# Instantiate a new projectile from the preloaded scene.	
	var projectile = playerprojectile.instantiate()
# Add the projectile as a child to the owner (character body).	
	owner.add_child(projectile)
# Set the projectile's transform to the HarpoonGun node's global transform.	
	projectile.transform = $HarpoonGun.global_transform		

