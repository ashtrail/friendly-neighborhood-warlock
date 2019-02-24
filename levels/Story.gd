extends Node2D

func play():
	$AudioStreamPlayer.stop()
	get_tree().change_scene("res://levels/Tuto.tscn")


func _process(delta):
	if Input.is_action_just_pressed("skip"):
		play()


func _on_Timer_timeout():
	$AnimationPlayer.play("story")
	$AudioStreamPlayer.play()
	yield($AnimationPlayer, "animation_finished")
	play()
