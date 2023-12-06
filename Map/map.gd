extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 0 ##Use 90 for testing
	
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
#	for i in test_array:
#		print(i)
#	print(test_array[0])

func _process(delta):
#	$Logo.rotation_degrees += 100 * delta
	
	##Flow -> if rotation > 245 -> 0
#	if $Logo.rotation_degrees > 245:
#		$Logo.rotation_degrees = 0

	if $Logo.position.x > 1024:
		$Logo.pos.x = 0
	
	if $Logo.position.x < 0:
		$Logo.pos.x = 1024
	
	if $Logo.position.y > 1024:
		$Logo.pos.y = 0
	
	if $Logo.position.y < 0:
		$Logo.pos.y = 1024
	
var tile_size = 64
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	position += inputs[dir] * tile_size
