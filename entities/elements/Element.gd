extends Node2D

export (String) var type
export (Array) var sfx

signal spell_cast(type)

func _ready():
	$AnimationPlayer.play("idle")


func get_sfx() -> AudioStreamSample:
	var index = randi() % Global.SPELL_SFX[type].size()
	return Global.SPELL_SFX[type][index]

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print('clique')
		emit_signal("spell_cast", type)
		$AnimationPlayer.play("clicked")
		$AudioStreamPlayer.stream = get_sfx()
		$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	$AnimationPlayer.play("idle")
