extends Node2D

signal ready_to_order()

export (int) var distance = 500
export (float) var duration = 0.5

var door : Vector2
var counter : Vector2

func _ready():
	randomize()
	door = position
	counter = Vector2(door.x + distance, door.y)

func choose_random_customer():
	print('switching customer texture')
	var index = randi() % Global.CUSTOMER_TEXTURES.size()
	var texture = Global.CUSTOMER_TEXTURES[index]
	$Sprite.texture = texture

func init():
	choose_random_customer()
	enter()

func renew():
	$Sprite.flip_h = true
	leave()
	yield($Leave, "tween_completed")
	choose_random_customer()
	$Sprite.flip_h = false
	enter()

func leave():
	$Leave.start()
	$Leave.interpolate_property(self, "position", counter, door, duration,
			Tween.TRANS_CUBIC, Tween.EASE_IN)

func enter():
	$Enter.interpolate_property(self, "position", door, counter, duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Enter.start()

func _on_Enter_tween_completed(_object, _key):
	emit_signal("ready_to_order")
