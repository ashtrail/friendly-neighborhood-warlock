extends Sprite

func destroy():
	$Sprite.visible = false
	$Explosion.emitting = true
	$Explosion.restart()
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
