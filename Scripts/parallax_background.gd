extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("water ripple")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
