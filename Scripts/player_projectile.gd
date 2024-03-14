extends Node2D

@onready var contact_paticales = $ContactParticales
@onready var timer = $Timer
@export var speed: float = 1000.0
var velocity = Vector2.ZERO


func _ready():
	contact_paticales.emitting = false

func start(_transform):
	transform = _transform
	velocity = transform.x * speed
		
func _process(delta):
	position += transform.y * speed  * delta


			
func _on_projectile_collision_body_entered(body):
	if body.is_in_group("Collidable"):
		contact_paticales.emitting = true
		timer.start()
			
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
		
func _on_projectile_collision_area_entered(area):
	if area.is_in_group("Shootable_enemy"):
		contact_paticales.emitting = true
		timer.start()
		
	elif area.is_in_group("Interactable_Hazards"):
		contact_paticales.emitting = true
		timer.start()
		
	elif area.is_in_group("WallCollision"):
		contact_paticales.emitting = true
		timer.start()	
		
func _on_timer_timeout():
	queue_free()
	

