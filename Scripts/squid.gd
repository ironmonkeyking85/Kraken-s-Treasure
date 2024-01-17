extends CharacterBody2D

@export var speed = 500
@export var health = Globals.enemy_health


func _process(_delta) -> void:
	
	move_and_slide()


func _on_hurtbox_area_entered(area):
	if area.name == "ProjectileCollision":
		health -= 25
	if health <= 0:	
		queue_free()
	



