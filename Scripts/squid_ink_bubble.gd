extends Node2D

@onready var timer = $Timer
@export var speed: float = 1000.0
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.y * speed  * delta

func _shoot_at_player():
	pass
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	pass 


func _on_ink_collision_body_entered(body):
	if body.name == "Player":
		pass


func _on_timer_timeout():
	pass 
