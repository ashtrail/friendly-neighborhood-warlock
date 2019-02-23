extends Node2D

const SCROLLS = [
	{
		name = "Lava Stream",
		spells = ["fire", "earth"]
	},
	{
		name = "Bless",
		spells = ["water", "light"]
	},
	{
		name = "Raise the Dead",
		spells = ["earth", "dark"]
	},
	{
		name = "Golem Invocation",
		spells = ["earth", "light"]
	},
	{
		name = "Divine Bolt",
		spells = ["thunder", "light"]
	},
]

var score = 0

var current_request = null

func _ready():
	randomize()
	generate_new_request()
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
	return scroll.spells == spells

func find_matching_scroll(spells):
	for scroll in SCROLLS:
		if compare_spells(scroll, spells):
			return scroll
	return null

func generate_new_request():
	$UI.hide_request()
	$RequestTimer.start()
	yield($RequestTimer, "timeout")
	var random_scroll = randi() % SCROLLS.size()
	current_request = SCROLLS[random_scroll]
	$UI.show_request(current_request)

func _on_Spells_scroll_submitted(spells):
	var scroll = find_matching_scroll(spells)
	if scroll == null:
		scroll =  { name = "GARBAGE", spells = [], }
	$UI.show_result(scroll)
	if scroll == current_request:
		# gain score
		add_score(5)
		generate_new_request()
	elif scroll.name == "GARBAGE":
		# lose score
		add_score(-10)
		print("GARBAGE !")
	else:
		# lose score
		add_score(-5)
		print("BAD !")

func _on_UI_request_rejected():
	print("Rejected !")
	# lose score
	add_score(-5)
	generate_new_request()


func _on_GameTimer_timeout():
	Global.score = score
	if score >= Global.required_score:
		get_tree().change_scene("res://levels/Win.tscn")
	else:
		get_tree().change_scene("res://levels/Lose.tscn")
