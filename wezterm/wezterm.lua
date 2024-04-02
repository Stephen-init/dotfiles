local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.bold_brightens_ansi_colors = "No"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 14

-- config.window_padding = {
-- 	left = 10,
-- 	right = 10,
-- 	top = 10,
-- 	bottom = 10,
-- }

-- Colorscheme
-- config.color_scheme = "nightfox"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

-- Tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
--config.status_update_interval = 1000
config.hide_tab_bar_if_only_one_tab = true

return config

