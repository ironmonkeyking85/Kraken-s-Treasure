extends CharacterBody2D

enum ENEMYSTATES {IDLE, ATTACK, HURT, DEAD,}

@export var speed = 500.0
@export var buoyancy = 25.0
@export var health = Globals.enemy_health
var current_states = ENEMYSTATES.IDLE

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
			
func _process(_delta) -> void:
	$AnimationPlayer.play("Idle")
	move_and_slide()


func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		health -= 2
		_hit_labal(health)
		$AnimationPlayer.play("Hurt")
	if health <= 0:
		_hit_labal(health)	
		$AnimationPlayer.play("Dead")
		queue_free()
	

func _on_hitbox_body_entered(body):
	pass # Replace with function body.
	
func _hit_labal(health: int):
	var floating_text = load("res://Scenes/floating_text.tscn").instantiate()
	floating_text.text = var_to_str(-health) # Display negative damage as positive
	get_parent().add_child(floating_text)
	floating_text.global_position = global_position + Vector2(0, -20) # Adjust position above character 	


func _on_sees_player_body_entered(body):
	if body.name == "Player":
		pass


func _on_timer_timeout():
	pass # Replace with function body.

func _idle(delta):
	pass
func _attack():
	pass	
func _hurt():
	pass
func _dead():
	pass	
