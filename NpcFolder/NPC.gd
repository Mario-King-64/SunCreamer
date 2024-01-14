extends CharacterBody2D

@onready var animation = $AnimationNPC

func _ready():
	animation.play("Clean")

func _npc_animation():
	if animation.is_playing():
		if Input.is_action_pressed("Primary Action"):
			animation.play("Creamed")
			animation.stop()
			await get_tree().create_timer(6.6).timeout
			animation.play("Clean")

func _hitbox():
	if $"../Player".position.x > $".".position.x-16 and $"../Player".position.x < $".".position.x+16:
		if $"../Player".position.y > $".".position.y-24 and $"../Player".position.y < $".".position.y+16:
			_npc_animation()

func _physics_process(delta):
	_hitbox()
