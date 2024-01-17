extends Node2D

@onready var AirTankContainer = $HUD/AirTank2
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	AirTankContainer.setMaxTanks(player.max_health)
	AirTankContainer.updateTanks(player.current_health)
	player.health_changed.connect(AirTankContainer.updateTanks)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
