extends CharacterBody2D

@export var speed: int = 128
@onready var animations = $AnimationPlayer

func _ready():
	Start()

func Start():
	position = Vector2(212,80)

func EndByKey():
	if Input.is_action_pressed("Stop"):
		get_tree().quit()

func HandleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func UpdateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animations.play("Walk" + direction)

func border_control():
	if position.x > 1016:
		position.x = 1016
	if position.x < 08:
		position.x = 08
	if position.y > 1008:
		position.y = 1008
	if position.y < 16:
		position.y = 16

func _physics_process(delta):
	HandleInput()
	move_and_slide()
	border_control()
	UpdateAnimation()
	EndByKey()
