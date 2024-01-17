extends Panel

@onready var sprite = $Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update(full: bool):
	if full: sprite.frame = 0
	else: sprite.frame = 1




