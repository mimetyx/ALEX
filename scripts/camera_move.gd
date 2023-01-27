extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var _camera = $Camera2D
	var player_start = $scifi_map/Locations/PlayerStart
	var _player = $Player
	_player.position = player_start.position
