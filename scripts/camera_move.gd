extends Node

onready var _rect: Rect2
onready var _obj_layer: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	_obj_layer = get_node("/root/Game/ObjectLocations")
	_rect = _obj_layer.get_used_rect()
	$Player.position = _obj_layer.map_to_world(_rect.get_center())
	print($Player.position)
