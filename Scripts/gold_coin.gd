extends Node2D







func _on_coin_pick_up_body_entered(body):
	if body.name == "Player":
		Globals.gold_coins += 1
		$AnimationPlayer.play("Coin_picked_up")
		await $AnimationPlayer.animation_finished
		queue_free()
		
