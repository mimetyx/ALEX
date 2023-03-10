class_name Bullet
extends RigidBody2D

	
func _on_Bullet_body_entered(_body):
	$BulletSprite.free()
	queue_free()
