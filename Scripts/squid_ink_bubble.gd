extends Node2D

@export var speed: float = 50.0
var velocity = Vector2.ZERO


func _physics_process(delta):
	position += transform.x * speed * delta
	$Sprite2D.rotate + 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func start(_transform):
	transform = _transform
	velocity = transform * speed

func set_direction(new_direction):
	velocity = new_direction.normalized()
	
func _rotation_to_target(player, delta):
	# Define the speed at which the enemy rotates towards the player
	var rotation_speed = 5000.0
# Calculate the direction vector from the enemy to the player
# Subtracting the enemy's global position from the player's global position gives the direction vector
	var player_position = player.global_position - global_position
# Calculate the angle between the enemy's current forward direction and the direction to the player
# This gives the angle the enemy needs to rotate to face the player
	var enemy_rotation = $".".transform.y.angle_to(player_position) + .4
# Rotate the enemy towards the player
# The sign function determines the direction of rotation (clockwise or counterclockwise)
# The min function ensures the rotation does not exceed the angle to the player, preventing overshooting
# The rotation speed is multiplied by delta to make the rotation frame-rate independent
	$".".rotate(sign(enemy_rotation)* min(delta * rotation_speed, abs(enemy_rotation)))	
	
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_ink_collision_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("inkhit")
		queue_free()
	if body.is_in_group("WallCollision"):
		$AnimationPlayer.play("inkhit")	
		queue_free()
	


func _on_timer_timeout():
	queue_free()


func _on_ink_collision_area_entered(area):
	pass
