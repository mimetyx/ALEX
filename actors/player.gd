extends KinematicBody2D


export var player_speed = 275 # How fast the player will move (pixels/sec).
var final_velocity = Vector2.ZERO
var orientation = -90
onready var player = $AnimatedSprite
onready var gun = $AnimatedSprite/Gun
onready var shoot_timer = $AnimatedSprite/Gun/Cooldown
	

# Called when the node enters the scene tree for the first time.
#func _ready():
#	var _background = get_node("/root/Game/CollisionLayer")
#	var _rect = _background.get_used_rect()
#	map_size = Vector2(_rect.position.x + _rect.size.x * _background.cell_size.x, 
#					  _rect.position.y + _rect.size.y * _background.cell_size.y)
#	var _zoof = 0
	
		
func _physics_process(delta):
	var velocity = Vector2.ZERO  # player movement vector
	if Input.is_action_pressed("move_left"):
		player.frame = 0
		velocity.x = -1
		orientation = -180
	if Input.is_action_pressed("move_right"):
		player.frame = 0
		velocity.x = 1
		orientation = 0		
	if Input.is_action_pressed("move_forward"):
		player.frame = 0
		velocity.y = -1
		orientation = -90
	if Input.is_action_pressed("move_backward"):
		player.frame = 0
		velocity.y = 1
		orientation = 90

	rotation_degrees = orientation
	final_velocity = Vector2.ZERO
	if velocity.length() > 0:
		final_velocity = velocity.normalized() * player_speed
	var _collision = move_and_collide(final_velocity * delta)

	if Input.is_action_just_pressed("fire_gun") and shoot_timer.is_stopped():
		var gun_direction = Vector2.ZERO
		var offset = Vector2.ZERO
		if orientation == -180:
			gun_direction = Vector2(-1, 0)
			offset = Vector2(-40, -18)
		elif orientation == 0:
			gun_direction = Vector2(1, 0)
			offset = Vector2(-8, -6)
		elif orientation == -90:
			gun_direction = Vector2(0, -1)
			offset = Vector2(-18, -28)
		elif orientation == 90:
			gun_direction = Vector2(0, 1)
			offset = Vector2(-30, 4)
		gun.shoot(gun_direction, offset)
		shoot_timer.start()
		player.frame = 0
	elif velocity == Vector2.ZERO:
		player.frame = 2		
