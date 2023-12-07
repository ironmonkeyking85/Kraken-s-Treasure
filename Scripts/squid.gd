extends CharacterBody2D

@export var speed = 500
@export var health = Globals.enemy_health

func _process(delta) -> void:
	
	move_and_slide()


	


func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		health -= 50
		printt("hit")
	if 	health == 0:
		queue_free()
