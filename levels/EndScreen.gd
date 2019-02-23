extends Node2D

export (PackedScene) var next_scene = null

func _ready():
	$UI/Score.text = str(Global.score)

func _on_Restart_pressed():
	get_tree().change_scene_to(next_scene)
