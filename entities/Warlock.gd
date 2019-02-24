extends Node2D

func _ready():
	$AnimationPlayer.play("idle")

func get_muzzle_pos() -> Vector2:
	return $Body/Arm/Muzzle.get_global_position()