#extends CharacterBody2D
#
#@export var speed = 100
#var joystick_vector = Vector2.ZERO
#@onready var camera := $Camera_Player_View
#@onready var collision_shape := $CollisionShape2D
#
#func _physics_process(_delta):
	## Получаем лимиты камеры
	#var limit_left = camera.limit_left
	#var limit_right = camera.limit_right
	#var limit_top = camera.limit_top
	#var limit_bottom = camera.limit_bottom
#
	## Получаем размеры игрока из хитбокса
	#var shape: Shape2D = collision_shape.shape
	#var player_width = 0.0
	#var player_height = 0.0
#
	#if shape is RectangleShape2D:
		#var rect_shape = shape as RectangleShape2D
		#player_width = rect_shape.size.x
		#player_height = rect_shape.size.y
	#
	## Обновляем встроенное свойство velocity на основе вектора джойстика
	#velocity = joystick_vector * speed
	## Вызываем move_and_slide() для движения персонажа
	#move_and_slide()
	#
	## Ограничиваем позицию игрока с учетом его размеров
	#position.x = clamp(position.x, float(limit_left) + player_width / 2, float(limit_right) - player_width / 2)
	#position.y = clamp(position.y, float(limit_top) + player_height / 2, float(limit_bottom) - player_height / 2)

extends CharacterBody2D

@export var speed = 100
var joystick_vector = Vector2.ZERO
@onready var camera := $Camera_Player_View
@onready var collision_shape := $CollisionShape2D
@onready var animated_sprite := $AnimatedSprite2D  # Указываем AnimatedSprite2D

func _physics_process(_delta):
	# Получаем лимиты камеры
	var limit_left = camera.limit_left + 112
	var limit_right = camera.limit_right - 112
	var limit_top = camera.limit_top + 112
	var limit_bottom = camera.limit_bottom - 112

	# Получаем размеры игрока из хитбокса
	var shape: Shape2D = collision_shape.shape
	var player_width = 0.0
	var player_height = 0.0

	if shape is RectangleShape2D:
		var rect_shape = shape as RectangleShape2D
		player_width = rect_shape.size.x
		player_height = rect_shape.size.y
	
	# Определяем основное направление движения
	var dominant_direction = Vector2.ZERO
	if joystick_vector != Vector2.ZERO:
		if abs(joystick_vector.x) > abs(joystick_vector.y):
			# Движение по оси X (вправо или влево)
			if joystick_vector.x > 0:
				dominant_direction = Vector2.RIGHT
				animated_sprite.play("Right")
			else:
				dominant_direction = Vector2.LEFT
				animated_sprite.play("Left")
		else:
			# Движение по оси Y (вверх или вниз)
			if joystick_vector.y > 0:
				dominant_direction = Vector2.DOWN
				animated_sprite.play("Bottom")
			else:
				dominant_direction = Vector2.UP
				animated_sprite.play("Top")
	else:
		# Остановка анимации, если джойстик не задействован
		animated_sprite.stop()
	
	# Обновляем встроенное свойство velocity на основе доминирующего направления
	velocity = dominant_direction * speed
	
	# Вызываем move_and_slide() для движения персонажа
	move_and_slide()
	
	# Ограничиваем позицию игрока с учётом его размеров
	position.x = clamp(position.x, float(limit_left) + player_width / 2, float(limit_right) - player_width / 2)
	position.y = clamp(position.y, float(limit_top) + player_height / 2, float(limit_bottom) - player_height / 2)
