extends CharacterBody2D

@onready var NumAni = $AnimationNum
var value
var points = value

func _count_points():
	if NumAni.is_playing():
		NumAni.stop()
	if points == value:
		NumAni.play(value)
	if points == 9:
		pass
		get_tree().quit()

func _physics_process(delta):
	_count_points()
