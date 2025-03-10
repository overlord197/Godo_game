extends Node2D

# Флаг, чтобы предотвратить повторное взаимодействие
var interacted = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Сработал сигнал body_entered от:", body.name)
	if not interacted and body.is_in_group("Player"):
		print("Игрок вошёл в зону!")
		interacted = true
		$AnimationPlayer.play("Disappear")
