extends KinematicBody


# Declare member variables here. Examples:
var velocity = Vector3.ZERO
var speed = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	velocity.x = speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.name == "Wall3" or collision.collider.name == "Wall4":
			speed *= -1
