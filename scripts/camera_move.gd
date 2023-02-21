extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var _obj_layer: TileMap = get_node("/root/Game/ObjectLayer")
	var _rect: Rect2 = _obj_layer.get_used_rect()
	$Player.position = _obj_layer.map_to_world(_rect.get_center()) 

