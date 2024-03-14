extends Node2D

@export var speed: float = 1000.0

func start(_pos, _dir):
	position = _pos
	rotation = _dir.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed  * delta

	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_ink_collision_body_entered(body):
	if body.name == "Player":
		queue_free()


func _on_timer_timeout():
	queue_free()
