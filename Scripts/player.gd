class_name Player
extends CharacterBody2D

signal health_changed

enum PLAYERSTATES {MOVEMENT, ATTACK, HURT, DEAD, GAMEOVER}
var current_states = PLAYERSTATES.MOVEMENT

@export var buoyancy: float = 25.0
@export var gravity: float = 100.0
@export var propulsion: float = 100.0
@export var max_health = Globals.player_health
@export var current_health: int = max_health
@export var player_rotation_speed = 10.0
@export var max_projectile_count = 1
@export var current_projectile_count = 0
@export var attack_rate = 0.25
@export var canon_vfx_rate = 0.25
var treasure_amount: int = 0
var can_attack = true

# adding "as" and class name allow for better auto complete
var playerprojectile = preload("res://Scenes/player_projectile.tscn")
@onready var canon_bubbles = $CanonMuzzle
@onready var breathing = $BreathingBubbles

func _ready():
	$AttackCoolDown.wait_time = attack_rate
	$Action_timer.wait_time = canon_vfx_rate

func _physics_process(delta: float)-> void:
	match current_states:
		PLAYERSTATES.MOVEMENT:
			_movement(delta)
		PLAYERSTATES.ATTACK:
			_attack()
		PLAYERSTATES.DEAD:
			_death()	
# Player movement and actions area##############		
func _movement(_delta: float):	
	velocity.x = 0
	velocity.y = 0
# Quarter turn directional controls	
	if  Input.is_action_pressed("Down") and Input.is_action_pressed("Right"):
		velocity.y += 1
		velocity.x += 1
		$Animation.play("down&right")
	elif  Input.is_action_pressed("Down") and Input.is_action_pressed("Left"):
		velocity.y += 1
		velocity.x -= 1
		$Animation.play("down&left")
	elif  Input.is_action_pressed("Up") and Input.is_action_pressed("Left"):
		velocity.y -= 1
		velocity.x -= 1
		$Animation.play("up&left")
	elif  Input.is_action_pressed("Up") and Input.is_action_pressed("Right"):
		velocity.y -= 1
		velocity.x += 1
		$Animation.play("up&right")		
# Four directional controls		
	elif  Input.is_action_pressed("Left"):
		velocity.x -= 1
		$Animation.play("moving left", )
	elif  Input.is_action_pressed("Right"):
		velocity.x += 1 
		$Animation.play("moving right")
	elif  Input.is_action_pressed("Up"):
		velocity.y -= 1	
		$Animation.play("moving down" )
	elif  Input.is_action_pressed("Down"):
		velocity.y += 1
		$Animation.play("moving up")
		
	elif velocity.x == 0 and velocity.y == 0:
		$Animation.play("idle")
				
	velocity *= propulsion
	move_and_slide()
#Controller input for shooting
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("Left") and Input.is_action_just_pressed("Shoot") and  can_attack:
		$Canonshot.play()
		_attack()
	elif Input.is_action_pressed("Right") and Input.is_action_just_pressed("Shoot") and  can_attack:
		$Canonshot.play()
		_attack()
	elif Input.is_action_pressed("Up") and Input.is_action_just_pressed("Shoot") and  can_attack:
		$Canonshot.play()
		_attack()
	elif Input.is_action_pressed("Down") and Input.is_action_just_pressed("Shoot") and  can_attack:
		$Canonshot.play()
		_attack()			
		
			
# Area for instantiated prjectiles###################	
func _attack():
	can_attack = false
	$AttackCoolDown.start()
	var projectile = playerprojectile.instantiate()
	get_tree().root.add_child(projectile)
	projectile.start($CannonBall.global_transform)		
func _on_attack_cool_down_timeout():
	can_attack = true	
#############################################
# State manager
func _on_state_finished():
	current_states = PLAYERSTATES.MOVEMENT
##############################################	
#Player death and respawn area###############
func _death():
	$Animation.play("dead")
	get_tree().reload_current_scene()
#############################################	
# Collision, hazards, and stage interactions area############
func _on_hazard_area_area_entered(area):
	if area.is_in_group("Hazards"):
		current_health -= 2
		health_changed.emit(current_health)	
	if area.name == "WallCollision":
		current_health -= 1
		health_changed.emit(current_health)				
	if current_health <= 0:
		current_states = PLAYERSTATES.DEAD

func _on_hurtbox_area_entered(area):
	if area.is_in_group("Enemy"):
		current_health -= 2
	if area.is_in_group("enemy_projectile"):
		current_health -= 1	
		health_changed.emit(current_health)
	if current_health <= 0:
		current_states = PLAYERSTATES.DEAD	
###############################################	
		

