extends GPUParticles2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot") and Input.is_action_just_pressed("Left"):
		$".".emitting = true
	elif  Input.is_action_just_pressed("Shoot") and Input.is_action_just_pressed("Right"):
		$".".emitting = true
	elif Input.is_action_just_pressed("Shoot") and Input.is_action_just_pressed("Up"):
		$".".emitting = true
	elif  Input.is_action_just_pressed("Shoot") and Input.is_action_just_pressed("Down"):
		$".".emitting = true	
	elif Input.is_action_just_released("Shoot"):
		$".".emitting = false
		

		
			
