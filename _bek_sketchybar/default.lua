local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --default domain
sbar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = 15.0,
		},
		color = colors.white,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
		background = { image = { corner_radius = 9 } },
	},
	label = {
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = 15.0,
		},
		color = colors.red,
		padding_left = settings.paddings,
		padding_right = settings.paddings,
	},
	background = {
		height = 28,
		corner_radius = 4,
		border_width = 0,
		border_color = colors.red,
		image = {
			corner_radius = 9,
			border_color = colors.bar,
			border_width = 1,
		},
	},
	popup = {
		background = {
			border_width = 2,
			corner_radius = 9,
			border_color = colors.red,
			color = colors.bg1,
			shadow = { drawing = true },
		},
		blur_radius = 50,
	},
	padding_left = 5,
	padding_right = 5,
	scroll_texts = true,
})
