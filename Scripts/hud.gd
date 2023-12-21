extends CanvasLayer



func _ready():
	pass

func _process(delta):
	$Treasure.text =  var_to_str(Globals.gold_coins)

	
