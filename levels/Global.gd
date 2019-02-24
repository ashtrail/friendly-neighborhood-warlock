extends Node

var score : int = 0
const required_score : int = 200

const SCROLLS = [
	{
		name = "Lava Gush",
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
		name = "Summon Golem",
		spells = ["earth", "light"]
	},
	{
		name = "Divine Bolt",
		spells = ["thunder", "light"]
	},
	{
		name = "Sun Ray",
		spells = ["fire", "light"]
	},
	{
		name = "Smoke Bomb",
		spells = ["fire", "water"]
	},
	{
		name = "Rain Dance",
		spells = ["fire", "water", "water"]
	},
	{
		name = "Storm",
		spells = ["fire", "water", "thunder"]
	},
	{
		name = "Fiendfyre",
		spells = ["fire", "dark"]
	},
]

const TEXTURE_MAP = {
	"fire": preload("../sprites/elements/fire.png"),
	"water": preload("../sprites/elements/water.png"),
	"earth": preload("../sprites/elements/earth.png"),
	"thunder": preload("../sprites/elements/thunder.png"),
	"light": preload("../sprites/elements/light.png"),
	"dark": preload("../sprites/elements/dark.png"),
}

const COLOR_MAP = {
	"fire": Color("#dd0000"),
	"water": Color("#00b6dd"),
	"earth": Color("#9c4224"),
	"thunder": Color("ffe234"),
	"light": Color("#fffcea"),
	"dark": Color("#6f007c"),
}

const CUSTOMER_TEXTURES = [
	preload("../sprites/customers/01.png"),
	preload("../sprites/customers/02.png")
]

const SPELL_SFX = {
	"fire": [
		preload("res://sfx/fire1.wav"),
		preload("res://sfx/fire2.wav"),
		preload("res://sfx/fire3.wav"),
	],
	"water": [
		preload("res://sfx/water1.wav"),
		preload("res://sfx/water2.wav"),
		preload("res://sfx/water3.wav"),
	],
	"earth": [
		preload("res://sfx/earth1.wav"),
		preload("res://sfx/earth2.wav"),
		preload("res://sfx/earth3.wav"),
	],
	"thunder": [
		preload("res://sfx/thunder1.wav"),
		preload("res://sfx/thunder2.wav"),
		preload("res://sfx/thunder3.wav"),
	],
	"light": [
		preload("res://sfx/light1.wav"),
		preload("res://sfx/light2.wav"),
		preload("res://sfx/light3.wav"),
	],
	"dark": [
		preload("res://sfx/dark1.wav"),
		preload("res://sfx/dark2.wav"),
		preload("res://sfx/dark3.wav"),
	],
}

const REJECT_SFX = [
	preload("res://sfx/reject1.wav"),
	preload("res://sfx/reject2.wav"),
	preload("res://sfx/reject3.wav"),
]

#const SUBMIT_SFX = [
#	preload("res://sfx/submit1.wav"),
#	preload("res://sfx/submit2.wav"),
#	preload("res://sfx/submit3.wav"),
#]

const SUCCESS_SFX = [
	preload("res://sfx/success1.wav"),
	preload("res://sfx/success2.wav"),
	preload("res://sfx/success3.wav"),
]


const FAIL_SFX = [
	preload("res://sfx/fail1.wav"),
	preload("res://sfx/fail2.wav"),
	preload("res://sfx/fail3.wav"),
]

const CANCEL_SFX = [
	preload("res://sfx/cancel1.wav"),
	preload("res://sfx/cancel2.wav"),
	preload("res://sfx/cancel3.wav"),
]

