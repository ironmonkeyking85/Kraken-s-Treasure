class_name Player
extends CharacterBody2D

@export var buoyancy: float = 100.0
@export var gravity: float = 100.0
@export var pressure: float = 100.0
@export var propulsion: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():

	Globals.Player = self

	pass # Replace with function body.


func _physics_process(delta: float)-> void:
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

	velocity *= propulsion
	move_and_slide()



