extends Node2D

var speed: float = 900.0
var delete_cannonball = 0
@onready var direction = get_node("Player")

func _ready():
	pass

func cannon_direction():
	pass
		
		
func _process(delta):
	var origin = Vector2(1, 0)
	if origin == Vector2(1, 0):
		position += transform.y * speed  * delta
	elif origin == Vector2(-1, 0):
		position += -transform.y * speed  * delta	

			
func _on_projectile_collision_body_entered(body):
	if body.is_in_group("Collidable"):
		queue_free()
		
		


func _on_projectile_collision_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
	if area.is_in_group("Hazards"):
		queue_free()
		
	
		
