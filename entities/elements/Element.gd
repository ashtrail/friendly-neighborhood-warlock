extends Node2D

export (String) var type

signal spell_cast(type)

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print('clique')
		emit_signal("spell_cast", type)
		$AnimationPlayer.play("clicked")
