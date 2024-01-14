class_name Spray
extends CharacterBody2D

@export var speed: int = 1
@onready var SprayAni = $AnimationSpray

func _SprayAni():
	if SprayAni.is_playing():
		SprayAni.stop()
	else:
		var SprayDir
		if $"..".direction == "up": 
			SprayDir = "Up"

		elif $"..".direction == "right":
			SprayDir = "Right"

		elif $"..".direction == "Down":
			SprayDir = "Down"

		elif $"..".direction == "left":
			SprayDir = "Left"

		if Input.is_action_pressed("Primary Action"):
			SprayAni.play("Spray" + SprayDir)

func _physics_process(delta):
	_SprayAni()
