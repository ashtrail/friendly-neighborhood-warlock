extends Node2D

var score = 0

var current_request = null

func _ready():
	randomize()
	generate_new_request(true)
	$GameTimer.start()

func _process(_delta):
	$UI/Timer.text = str(floor($GameTimer.time_left))

func add_score(value):
	if score + value < 0:
		score = 0
	else:
		score += value
	$UI.update_score(score)

func compare_spells(scroll, spells):
	var required = scroll.spells.duplicate()
	required.sort()
	var input = spells.duplicate()
	input.sort()
	return required == input

func find_matching_scroll(spells):
	for scroll in Global.SCROLLS:
		if compare_spells(scroll, spells):
			return scroll
	return null

func generate_new_request(first = false):
	$UI.hide_request()
#	$RequestTimer.start()
#	yield($RequestTimer, "timeout")
	if first:
		$Customer.init()
	else:
		$Customer.renew()

func get_fail_sfx() -> AudioStreamSample:
	var index = randi() % Global.FAIL_SFX.size()
	return Global.FAIL_SFX[index]

func _on_Spells_scroll_submitted(spells):
	var scroll = find_matching_scroll(spells)
	if scroll == null:
		scroll =  { name = "GARBAGE", spells = [], }
	$UI.show_result(scroll)
	if scroll == current_request:
		# gain score
		var index = randi() % Global.SUCCESS_SFX.size()
		var sfx : AudioStreamSample = Global.SUCCESS_SFX[index]
		$AudioStreamPlayer.stream = sfx
		add_score(10)
		generate_new_request()
	elif scroll.name == "GARBAGE":
		# lose score
		$AudioStreamPlayer.stream = get_fail_sfx()
		add_score(-5)
		print("GARBAGE !")
	else:
		# lose score
		$AudioStreamPlayer.stream = get_fail_sfx()
		# add_score(-5)
		print("BAD !")
	$AudioStreamPlayer.play()

func _on_UI_request_rejected():
	print("Rejected !")
	var index = randi() % Global.REJECT_SFX.size()
	var sfx : AudioStreamSample = Global.REJECT_SFX[index]
	$AudioStreamPlayer.stream = sfx
	$AudioStreamPlayer.play()
	# lose score
	add_score(-5)
	generate_new_request()


func _on_GameTimer_timeout():
	Global.score = score
	if score >= Global.required_score:
		get_tree().change_scene("res://levels/Win.tscn")
	else:
		get_tree().change_scene("res://levels/Lose.tscn")


func _on_Customer_ready_to_order():
	print("wtf")
	var random_scroll = randi() % Global.SCROLLS.size()
	current_request = Global.SCROLLS[random_scroll]
	$UI.show_request(current_request)
