extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var camera = $Camera2D
	var player_start = $scifi_map/Locations/PlayerStart
	var _zoof = player_start.position.x
	camera.position.x = player_start.position.x
	camera.position.y = player_start.position.y

