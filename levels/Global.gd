extends Node

var score : int = 0
const required_score : int = 200

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

const TEXTURE_MAP = {
	"fire": preload("../sprites/elements/fire.png"),
	"water": preload("../sprites/elements/water.png"),
	"earth": preload("../sprites/elements/earth.png"),
	"thunder": preload("../sprites/elements/thunder.png"),
	"light": preload("../sprites/elements/light.png"),
	"dark": preload("../sprites/elements/dark.png"),
}
