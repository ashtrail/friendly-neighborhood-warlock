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
