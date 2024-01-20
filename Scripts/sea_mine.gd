extends Node2D


#use signals to connect to player health 
func _on_hitbox_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("Detonate")
		await $AnimationPlayer.animation_finished
		queue_free()
	
		
func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		
		queue_free()
