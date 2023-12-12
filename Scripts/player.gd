class_name Player
extends CharacterBody2D

@export var buoyancy: float = 100.0
@export var gravity: float = 100.0
@export var pressure: float = 100.0
@export var propulsion: float = 150.0
@export var health = Globals.player_health
var treasure_amount: int = 0

@export var max_projectile_count = 1
@export var current_projectile_count = 0
# adding "as" and class name allow for auto complete
#@onready var fsm = $"." as StateMachine
var playerprojectile = preload("res://Scenes/player_projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
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
		
	if Input.is_action_just_pressed("Shoot") and current_projectile_count < max_projectile_count:
		_shoot_projectile()
	
				

	velocity *= propulsion
	move_and_slide()
	
func _shoot_projectile():
	var projectile = playerprojectile.instantiate()
	owner.add_child(projectile)
	projectile.transform = $HarpoonGun.global_transform	
	

func _physics_process(delta: float)-> void:
	if health <= 0:
		get_tree().reload_current_scene()


func _on_hitbox_area_entered(area):
	if area.is_in_group("Enemy"):
		health -= 25
		print(health)
	
	if area.is_in_group("Hazards"):
		health -= 50
		print(health)
		
	if health <= 0:
		get_tree().reload_current_scene()
	
