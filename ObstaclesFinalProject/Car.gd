extends KinematicBody

var speed = 20
var turn_rate = 0.05 #In radian
var velocity = Vector3.ZERO
var collision
var scene

func _ready():
	pass
	#scene = preload("res://YouWonLabel.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector3.ZERO	#This makes velocity independent from the frame rate
	
	if Input.is_action_pressed("ui_up"):
		#transform.basis.z is the car's local z instead of the global z
		velocity += transform.basis.z * -speed	# -speed is forward in z
	if Input.is_action_pressed("ui_down"):
		velocity += transform.basis.z * speed	# +speed is backward in z
	if Input.is_action_pressed("ui_left"):
		rotate_y(turn_rate)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-turn_rate)
	
	collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name == "Girl":
			collider.queue_free()
		if collider.name == "Destination":
			var girl = get_parent().get_node("Girl")
			if girl == null:
				var youWonLabel = get_parent().get_node("YouWon")
				youWonLabel.visible = true
				get_tree().paused = true
		if "MovingObstacle" in collider.name:
			var youWonLabel = get_parent().get_node("YouLost")
			youWonLabel.visible = true
			get_tree().paused = true
