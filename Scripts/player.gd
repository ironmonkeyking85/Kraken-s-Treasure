class_name Player
extends CharacterBody2D

signal health_changed

enum PLAYERSTATES {MOVEMENT, ATTACK, HURT, DEAD, GAMEOVER}

@export var buoyancy: float = 100.0
@export var gravity: float = 100.0
@export var pressure: float = 100.0
@export var propulsion: float = 150.0
@export var max_health = Globals.player_health
@export var current_health: int = max_health
var treasure_amount: int = 0
var current_stataes = PLAYERSTATES.MOVEMENT

@export var max_projectile_count = 1
@export var current_projectile_count = 0
# adding "as" and class name allow for auto complete
#@onready var fsm = $"." as StateMachine
var playerprojectile = preload("res://Scenes/player_projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
	

func _physics_process(delta: float)-> void:
	match current_stataes:
		PLAYERSTATES.MOVEMENT:
			_movement(delta)
		PLAYERSTATES.ATTACK:
			_attack()	
			
func _movement(delta: float):
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
	if Input.is_action_just_pressed("Shoot") and current_projectile_count < max_projectile_count:
		_attack()	
		
	velocity *= propulsion
	move_and_slide()
	
func _attack():
	var projectile = playerprojectile.instantiate()
	owner.add_child(projectile)
	projectile.transform = $HarpoonGun.global_transform	
	
func _on_hurtbox_body_entered(body):
	if body.is_in_group("Enemy"):
		current_health -= 2
		health_changed.emit(current_health)
	if current_health <= 0:
		get_tree().reload_current_scene()
		


func _on_hazard_area_area_entered(area):
	if area.is_in_group("Hazards"):
		current_health -= 2
		health_changed.emit(current_health)	
	if area.name == "WallCollision":
		current_health -= 1
		health_changed.emit(current_health)				
	if current_health <= 0:
		get_tree().reload_current_scene()
