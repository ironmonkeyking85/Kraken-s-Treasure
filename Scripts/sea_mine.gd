extends Node2D

@onready var explod_vfx = $Hitbox/Sprite2D/GPUParticles2D
@onready var animation_player = $AnimationPlayer

func _ready():
	explod_vfx.emitting = false
	
#use signals to connect to player health 
func _on_hitbox_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("Detonate")
		explod_vfx.emitting = true
		$Hitbox/CollisionShape2D.scale.x = 2.5 
		$Hitbox/CollisionShape2D.scale.y = 2.5
		await $AnimationPlayer.animation_finished
		queue_free()
		
func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":	
		$AnimationPlayer.play("Detonate")
		explod_vfx.emitting = true
		$Hitbox/CollisionShape2D.scale.x = 2.5 
		$Hitbox/CollisionShape2D.scale.y = 2.5
		await $AnimationPlayer.animation_finished
		queue_free()
		
func _on_area_2d_area_entered(area):
	if area.name == "Hurtbox":
		$AnimationPlayer.play("Armed")
		await $AnimationPlayer.animation_finished
		$AnimationPlayer.play("Detonate")
		explod_vfx.emitting = true
		$Hitbox/CollisionShape2D.scale.x = 2.5 
		$Hitbox/CollisionShape2D.scale.y = 2.5
		await $AnimationPlayer.animation_finished
		queue_free()		
		
		
