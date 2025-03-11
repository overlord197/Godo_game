extends CharacterBody2D

@export var speed = 200
var joystick_vector = Vector2.ZERO

func _physics_process(delta):
	# Рассчёт скорости
	var velocity = joystick_vector * speed
	# Движение
	move_and_slide()
