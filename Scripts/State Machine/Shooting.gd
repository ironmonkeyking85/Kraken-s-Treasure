class_name Shooting_state
extends State

#var playerprojectile = preload("res://Scenes/player_projectile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass	
	#if Input.is_action_pressed("Shoot"):
		#_shoot_projectile()

#func _shoot_projectile():
	#var projectile = playerprojectile.instantiate()
	#owner.add_child(projectile)
	#projectile.transform = $HarpoonGun.global_transform
