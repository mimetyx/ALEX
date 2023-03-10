class_name Gun
extends Position2D
# Represents a weapon that spawns and shoots bullets.
# The Cooldown timer controls the cooldown duration between shots.


const BULLET_VELOCITY = 750.0
const Bullet = preload("res://objects/bullet.tscn")

onready var sound_shoot = $Shoot
onready var timer = $Cooldown


# This method is only called by Player.gd.
func shoot(direction: Vector2, offset: Vector2):
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	bullet.global_position = global_position + offset
	bullet.linear_velocity = BULLET_VELOCITY * direction
	bullet.set_as_toplevel(true)
	add_child(bullet)
	sound_shoot.play()
	timer.start()
	return true
