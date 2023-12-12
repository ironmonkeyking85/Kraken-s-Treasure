extends Node2D

@export var health = Globals.enemy_health
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_hitbox_body_entered(body):
	if body.name == "Player":
		Globals.player_health -= 50
		$AnimationPlayer.play("Detonate")
		await $AnimationPlayer.animation_finished
		queue_free()
		
		


func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		health -= 1
		queue_free()
