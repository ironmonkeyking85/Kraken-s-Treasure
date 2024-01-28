extends GPUParticles2D


@export var speed: float = 1000.0
var velocity = Vector2.ZERO

func _ready():
	pass

func start(_transform):
	transform = _transform
	velocity = transform.x * speed
	
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()