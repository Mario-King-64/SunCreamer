extends Sprite2D

var tile_size = 16
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	print(position)
	position = Vector2.ONE * tile_size
	print(position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Border Control
	if position.x > 1008:
		position.x = 16

	if position.x < 16:
		position.x = 1008

	if position.y > 1008:
		position.y = 16

	if position.y < 16:
		position.y = 1008

func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(direction):
	position += inputs[direction] * tile_size
