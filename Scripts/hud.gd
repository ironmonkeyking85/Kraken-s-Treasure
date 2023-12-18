extends CanvasLayer

func _process(delta):
	$Treasure.text = "Gold:" + var_to_str(Globals.gold_coins)
