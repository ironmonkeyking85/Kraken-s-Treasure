extends Label

var speed = 100
var direction = Vector2(0, -1)
# Called when the node enters the scene tree for the first time.
func _ready():
	direction.y  = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	
	modulate.a -= delta / 1.0
	if modulate.a <=   0:
		queue_free()
	
