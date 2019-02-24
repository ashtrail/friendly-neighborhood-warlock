extends Node2D

var Spell : PackedScene = preload('res://entities/SpellBall.tscn')

func cast_spell(type : String):
	var muzzle_pos = $Warlock.get_muzzle_pos()
	var spell = Spell.instance()
	self.add_child(spell)
	spell.modulate = Global.COLOR_MAP[type]
	var angle = $Canvas.position.angle_to(muzzle_pos)
	spell.rotation = angle
	spell.position = muzzle_pos
	print('muzzle pos')
	print(muzzle_pos)
	print('canvas pos')
	print($Canvas.position)
	$Tween.interpolate_property(spell, "position", muzzle_pos,
			$Canvas.position, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	# explosion
	object.destroy()
#	var explosion : CPUParticles2D = Explosion.instance()
#	explosion.modulate = object.modulate
#	explosion.position = object.position
#	self.add_child(explosion)
#	object.queue_free()

func _on_Spells_spell_cast(type):
	cast_spell(type)
