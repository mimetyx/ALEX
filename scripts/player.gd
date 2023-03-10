extends KinematicBody2D


var map_size 
export var player_speed = 250 # How fast the player will move (pixels/sec).


# Called when the node enters the scene tree for the first time.
func _ready():
	var _background = get_node("/root/Game/CollisionLayer")
	var _rect = _background.get_used_rect()
	map_size = Vector2(_rect.position.x + _rect.size.x * _background.cell_size.x, 
					  _rect.position.y + _rect.size.y * _background.cell_size.y)
	var _zoof = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO  # player movement vector
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite.frame = 0
		velocity.x += -1
		rotation_degrees = -180
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.frame = 0
		velocity.x += 1
		rotation_degrees = 0
	if Input.is_action_pressed("move_forward"):
		$AnimatedSprite.frame = 0
		velocity.y += -1
		rotation_degrees = -90
	if Input.is_action_pressed("move_backward"):
		$AnimatedSprite.frame = 0
		velocity.y += 1
		rotation_degrees = 90
	if Input.is_action_pressed("fire"):
		
	if velocity == Vector2.ZERO:
		$AnimatedSprite.frame = 2
	if velocity.length() > 0:
		velocity = velocity.normalized() * player_speed

	#position += velocity * delta
	#position.x = clamp(position.x, 0, map_size.x)
	#position.y = clamp(position.y, 0, map_size.y)	
	# Using move_and_collide.
	var collision = move_and_collide(velocity * delta)
	
