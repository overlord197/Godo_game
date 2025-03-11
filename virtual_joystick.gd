extends Control

@export var max_distance = 100
var joystick_vector = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:  # Проверка, было ли касание
			var touch_pos = event.position - $BG.position
			if touch_pos.length() > max_distance:
				touch_pos = touch_pos.normalized() * max_distance
			joystick_vector = touch_pos / max_distance
			$Circle.position = touch_pos
		else:  # Если событие завершено
			joystick_vector = Vector2.ZERO
			$Circle.position = Vector2.ZERO
	elif event is InputEventScreenDrag:
		var touch_pos = event.position - $BG.position
		if touch_pos.length() > max_distance:
			touch_pos = touch_pos.normalized() * max_distance
		joystick_vector = touch_pos / max_distance
		$Circle.position = touch_pos
