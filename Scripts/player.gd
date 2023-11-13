class_name Player
extends CharacterBody2D

var speed: float = 100.0
var buoyancy: float = 100.0
var gravity: float = 100.0
var pressure: float = 100.0
var propulsion: float = 100.0

enum States {MOVING, SHOOTING, DAMAGED, DISTORYED}




func _physics_process(delta: float) -> void:
	

	move_and_slide()
