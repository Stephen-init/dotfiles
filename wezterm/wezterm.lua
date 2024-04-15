local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
-- config.bold_brightens_ansi_colors = "No"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 15

config.window_padding = {
	left = 50,
	right = 50,
	top = 50,
	bottom = 8,
}

-- Colorscheme
-- config.color_scheme = "nightfox"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.5
config.macos_window_background_blur = 70
config.text_background_opacity = 0.9
-- Tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
--config.status_update_interval = 1000
config.hide_tab_bar_if_only_one_tab = true

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.keys = {

	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

	{ key = "d", mods = "OPT", action = wezterm.action({ SendString = "\x1b\x7f" }) },

	{ key = "d", mods = "CMD", action = wezterm.action({ SendString = "\x15" }) },
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ SendString = "\x1bOH" }) },
	{ key = "RightArrow", mods = "CMD", action = wezterm.action({ SendString = "\x1bOF" }) },
	-- Clears the scrollback and viewport leaving the prompt line the new first line.
}

return config
