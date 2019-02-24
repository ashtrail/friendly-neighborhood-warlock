extends Node2D

signal scroll_submitted(spells)
signal scroll_canceled()
signal spell_cast(type)

var spells = []

func _ready():
	for element in get_parent().get_node("Elements").get_children():
		element.connect("spell_cast", self, "_on_Element_spell_cast")

func clear():
	spells = []
	for slot in $Slots.get_children():
		slot.texture = null;

func submit():
	emit_signal("scroll_submitted", spells)
	clear()

func cancel():
	emit_signal("scroll_canceled")
	clear()

func add_spell(type):
	var index = spells.size()
	spells.push_back(type)
	var slots = $Slots.get_children()
	var slot : Sprite = slots[index]
	slot.texture = Global.TEXTURE_MAP[type]

func _on_Element_spell_cast(type):
	print("cast " + type)
	emit_signal("spell_cast", type)
	if spells.size() < 3:
		add_spell(type)
	else:
		print("houlala trop de spells")
