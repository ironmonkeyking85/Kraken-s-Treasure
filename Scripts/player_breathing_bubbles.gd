extends GPUParticles2D



@export var speed: float = 1000.0
var velocity = Vector2.ZERO


func start(_transform):
	transform = _transform
	velocity = transform.x * speed
