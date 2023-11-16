class_name Player

extends CharacterBody2D


var buoyancy: float = 100.0
var gravity: float = 100.0
var pressure: float = 100.0
var propulsion: float = 100.0

func _ready():
	
	Globals.Player = self
	

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
