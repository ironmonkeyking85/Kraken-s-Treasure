extends Node2D

@export var speed: float = 1000.0
var velocity = Vector2.ZERO


func start(_transform):
	transform = _transform
	velocity = transform.x * speed
		
func _process(delta):
	position += transform.y * speed  * delta


			
func _on_projectile_collision_body_entered(body):
	if body.is_in_group("Collidable"):
		queue_free()
		
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
		
func _on_projectile_collision_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
	if area.is_in_group("Hazards"):
		queue_free()
		

