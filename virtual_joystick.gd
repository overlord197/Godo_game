extends Control

@export var max_distance = 65
var joystick_vector = Vector2.ZERO

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:  # Начало касания
			var touch_pos = event.position - ($BG.position + $BG.get_rect().size / 2)
			if touch_pos.length() > max_distance:
				touch_pos = touch_pos.normalized() * max_distance
			joystick_vector = touch_pos / max_distance
			$Circle.position = touch_pos + $BG.get_rect().size / 2 - $Circle.get_rect().size / 2
		else:  # Завершение касания
			joystick_vector = Vector2.ZERO
			$Circle.position = $BG.get_rect().size / 2 - $Circle.get_rect().size / 2
	elif event is InputEventScreenDrag:
		var touch_pos = event.position - ($BG.position + $BG.get_rect().size / 2)
		if touch_pos.length() > max_distance:
			touch_pos = touch_pos.normalized() * max_distance
		joystick_vector = touch_pos / max_distance
		$Circle.position = touch_pos + $BG.get_rect().size / 2 - $Circle.get_rect().size / 2
