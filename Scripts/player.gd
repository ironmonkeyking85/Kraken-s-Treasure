class_name Player
extends CharacterBody2D

signal health_changed

enum PLAYERSTATES {MOVEMENT, ATTACK, HURT, DEAD, GAMEOVER}

@export var buoyancy: float = 25.0
@export var gravity: float = 100.0
@export var propulsion: float = 100.0
@export var max_health = Globals.player_health
@export var current_health: int = max_health
@export var player_rotation_speed = 10.0
@export var max_projectile_count = 1
@export var current_projectile_count = 0
@export var attack_rate = 0.25
var treasure_amount: int = 0
var current_states = PLAYERSTATES.MOVEMENT
var can_attack = true
var vfx_active = true
# adding "as" and class name allow for auto complete
var playerprojectile = preload("res://Scenes/player_projectile.tscn")
var canon_bubbles = preload("res://Scenes/canon_bubbles.tscn")
func _ready():
	$AttackCoolDown.wait_time = attack_rate
		
func _physics_process(delta: float)-> void:
	match current_states:
		PLAYERSTATES.MOVEMENT:
			_movement(delta)
		PLAYERSTATES.ATTACK:
			_attack()
	move_and_slide()
		
func _movement(_delta: float):	
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		$Animation.play("moving left")
	if Input.is_action_pressed("Right"):
		velocity.x += 1 
		$Animation.play("moving right")
	if Input.is_action_pressed("Up"):
		velocity.y -= 1	
	if Input.is_action_pressed("Down"):
		velocity.y += 1			
	elif  velocity.x == 0 and Input.is_action_just_pressed("Shoot"):
		_attack()
		_canon_vfx()
		$Animation.play("idle")
	
	var direction = Vector2(0, 0)
	if Input.is_action_pressed("Left") and Input.is_action_just_pressed("Shoot") and  can_attack:
		direction.x -= 1
		_attack()
		_canon_vfx()
	elif Input.is_action_pressed("Right") and Input.is_action_just_pressed("Shoot") and  can_attack:
		direction.x += 1	
		_attack()
		_canon_vfx()
	velocity *= propulsion
	move_and_slide()
	
func _attack():
	can_attack = false
	$AttackCoolDown.start()
	var projectile = playerprojectile.instantiate()
	get_tree().root.add_child(projectile)
	projectile.start($CannonBall.global_transform)
		
func _on_attack_cool_down_timeout():
	can_attack = true
	
func _canon_vfx():
	vfx_active = false
	$Action_timer.start()
	var muzzle_bubbles = canon_bubbles.instantiate()
	get_tree().root.add_child(muzzle_bubbles)
	muzzle_bubbles.start($CannonBall.global_transform)
	
	
func _on_action_timer_timeout():
	queue_free()
	vfx_active = true
		
		
#func _on_hurtbox_body_entered(body):
#	if body.is_in_group("Enemy"):
#		current_health -= 2
#		health_changed.emit(current_health)
#	if current_health <= 0:
#		pass
		#get_tree().reload_current_scene()
		
func _on_hazard_area_area_entered(area):
	if area.is_in_group("Hazards"):
		current_health -= 2
		health_changed.emit(current_health)	
	if area.name == "WallCollision":
		current_health -= 1
		health_changed.emit(current_health)				
	if current_health <= 0:
		get_tree().reload_current_scene()



func _on_hurtbox_area_entered(area):
	if area.is_in_group("Enemy"):
		current_health -= 2
		health_changed.emit(current_health)
	if current_health <= 0:
		get_tree().reload_current_scene()

