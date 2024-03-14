extends CharacterBody2D

enum ENEMYSTATES {IDLE, ATTACK, HURT, DEAD,}

@export var speed:float = 500.0
@export var buoyancy = 25.0
@export var health = Globals.enemy_health
var current_states = ENEMYSTATES.IDLE
var can_attack = true
var bubble_shot = preload("res://Scenes/ink_bubble.tscn")
@onready var player = get_node("../../Player")


func _ready():
	$AnimationPlayer.play("Idle")
	
func _physics_process(delta):
	match current_states:
		ENEMYSTATES.IDLE:
			_idle(delta)
		ENEMYSTATES.ATTACK:
			_attack()
		ENEMYSTATES.HURT:
			_hurt()	
		ENEMYSTATES.DEAD:
			_dead()	
			
	move_and_slide()

func _process(delta):
	_rotation_to_target(player,delta)
				
func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		_hurt()
	if health <= 0:
		_dead()
	

func _on_hitbox_body_entered(body):
	pass # Replace with function body.
	
func _hit_labal(health: int):
	var floating_text = load("res://Scenes/floating_text.tscn").instantiate()
	floating_text.text = var_to_str(-health) # Display negative damage as positive
	get_parent().add_child(floating_text)
	floating_text.global_position = global_position + Vector2(0, -20) # Adjust position above character 	



func _on_timer_timeout():
	_attack()

func _idle(delta):
	current_states = ENEMYSTATES.IDLE
	
func _attack():
	
	var ink_bubble = bubble_shot.instantiate()
	get_tree().root.add_child(ink_bubble)
	
	
			
func _hurt():
	$AnimationPlayer.play("Hurt")
	health -= 1
	_hit_labal(health)
	
	
func _dead():
	$AnimationPlayer.play("Dead")
	_hit_labal(health)
	await $AnimationPlayer.animation_finished
	queue_free()	
	
func _on_state_finished():
	current_states = ENEMYSTATES.IDLE	


func _on_sees_player_area_entered(area):
	if area.name == "Hazard Area":
		_attack()
		
func _rotation_to_target(player, delta):
	# Define the speed at which the enemy rotates towards the player
	var rotation_speed = 5000.0

# Calculate the direction vector from the enemy to the player
# Subtracting the enemy's global position from the player's global position gives the direction vector
	var player_position = player.global_position - global_position

# Calculate the angle between the enemy's current forward direction and the direction to the player
# This gives the angle the enemy needs to rotate to face the player
	var enemy_rotation = $".".transform.y.angle_to(player_position)

# Rotate the enemy towards the player
# The sign function determines the direction of rotation (clockwise or counterclockwise)
# The min function ensures the rotation does not exceed the angle to the player, preventing overshooting
# The rotation speed is multiplied by delta to make the rotation frame-rate independent
	$".".rotate(sign(enemy_rotation)* min(delta * rotation_speed, abs(enemy_rotation)))

	
	 
	
		
		
		
