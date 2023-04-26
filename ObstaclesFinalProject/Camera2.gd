extends Camera

var player
var playerPrevTransX
var playerPrevTransZ
var playerPrevRotateY

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_parent().get_parent().get_node("Car")
	# Get the player's initial coordinates and rotation
	playerPrevTransX = player.translation.x
	playerPrevTransZ = player.translation.z
	playerPrevRotateY = player.rotation.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# This sets the camera to be the drivers view
	# If player has translated then the car needs to move to the players new position
	if playerPrevTransX != player.translation.x:
		translation.x = player.translation.x
		playerPrevTransX = player.translation.x
	if playerPrevTransZ != player.translation.z:
		translation.z = player.translation.z
		playerPrevTransZ = player.translation.z
		
	# If player has rotated then the car needs to rotate to the players new angle
	if playerPrevRotateY != player.rotation.y:
		# Check clockwise or counterclockwise
		# Right or clockwise
		if playerPrevRotateY > player.rotation.y:
			rotate_y(-0.05)
		# Left or counterclockwise
		if playerPrevRotateY < player.rotation.y:
			rotate_y(0.05)
		playerPrevRotateY = player.rotation.y


