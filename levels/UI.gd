extends Control

signal request_rejected()

func show_request(scroll):
	$Request/Name.text = scroll.name
	$Request.visible = true

func hide_request():
	$Request.visible = false

func show_result(scroll):
	$Result/Name.text = scroll.name
	$Result.visible = true
	$Result/Timer.start()
	yield($Result/Timer, "timeout")
	$Result.visible = false

func update_score(score):
	$Score.text = str(score)

func _on_Reject_pressed():
	emit_signal("request_rejected")

func _on_Cancel_pressed():
	print('wesh')
	var index = randi() % Global.CANCEL_SFX.size()
	var sfx : AudioStreamSample = Global.CANCEL_SFX[index]
	$AudioStreamPlayer.stream = sfx
	$AudioStreamPlayer.play()
