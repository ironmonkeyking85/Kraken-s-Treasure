extends Node2D

var speed: float = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += -transform.y * speed * delta
	
	
func _on_projectile_collision_body_entered(body):
	if body.is_in_group("Collidable"):
		queue_free()


func _on_projectile_collision_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
