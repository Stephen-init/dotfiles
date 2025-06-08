local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 40,
	color = colors.bar.bg,
	padding_right = 7,
	padding_left = 7,
	corner_radius = 9,
	margin = 10,
	blur_radius = 30,
})
