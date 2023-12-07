extends Sprite2D

@onready var Player = $Logo
var animation_speed = 3
var moving = false
var tile_size = 64
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
	if position.x > 960:
		position.x = 64

	if position.x < 64:
		position.x = 960

	if position.y > 960:
		position.y = 64

	if position.y < 64:
		position.y = 960

func _unhandled_input(event):
	if moving:
		return
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(direction):
	Player.target_position = inputs[direction] * tile_size
	Player.force_raycast_update()
	if !Player.is_colliding():
		#position += inputs[dir] * tile_size
		var tween = create_tween()
		tween.tween_property(self, "position",
			position + inputs[direction] *    tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
