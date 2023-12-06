extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 0 ##Use 90 for testing
	
	
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
	
	if Input.is_action_pressed("left"):
		$Logo.pos.x -= $Logo.speed * delta
	
	if Input.is_action_pressed("right"):
		$Logo.pos.x += $Logo.speed * delta

	if Input.is_action_pressed("up"):
		$Logo.pos.y -= $Logo.speed * delta

	if Input.is_action_pressed("down"):
		$Logo.pos.y += $Logo.speed * delta
