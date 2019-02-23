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
