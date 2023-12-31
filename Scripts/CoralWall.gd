extends Node2D





func _on_wall_collision_body_entered(body):
	if body.name == "Player":
		Globals.player_health -= 1
