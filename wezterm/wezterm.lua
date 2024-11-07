local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
-- config.bold_brightens_ansi_colors = "No"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font_size = 15
config.automatically_reload_config = true
config.window_padding = {
	left = 50,
	right = 50,
	top = 50,
	bottom = 8,
}

-- Colorscheme
-- config.color_scheme = "nightfox"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "catppuccin-mocha"
config.colors = {
	-- The default background color
	background = "#08192d",
}
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
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

config.leader = {
	key = "B",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.switch_to_last_active_tab_when_closing_tab = true
config.pane_focus_follows_mouse = true
config.scrollback_lines = 5000
-- session controls
config.unix_domains = {
	{
		name = "unix",
	},
}

-- Move around

-- local move_around = function(window, pane, direction_wez, direction_nvim)
-- 	local result = os.execute(
-- 		"env NVIM_LISTEN_ADDRESS=/tmp/nvim"
-- 			.. pane:pane_id()
-- 			.. " "
-- 			.. wezterm.home_dir
-- 			.. "/.local/bin/wezterm.nvim.navigator"
-- 			.. " "
-- 			.. direction_nvim
-- 	)
-- 	if result then
-- 		window:perform_action(act({ SendString = "\x17" .. direction_nvim }), pane)
-- 	else
-- 		window:perform_action(act({ ActivatePaneDirection = direction_wez }), pane)
-- 	end
-- end
--
-- wezterm.on("move-left", function(window, pane)
-- 	move_around(window, pane, "Left", "h")
-- end)
--
-- wezterm.on("move-right", function(window, pane)
-- 	move_around(window, pane, "Right", "l")
-- end)
--
-- wezterm.on("move-up", function(window, pane)
-- 	move_around(window, pane, "Up", "k")
-- end)
--
-- wezterm.on("move-down", function(window, pane)
-- 	move_around(window, pane, "Down", "j")
-- end)

-- resize pane
-- local vim_resize = function(window, pane, direction_wez, direction_nvim)
-- 	local result = os.execute(
-- 		"env NVIM_LISTEN_ADDRESS=/tmp/nvim"
-- 			.. pane:pane_id()
-- 			.. " "
-- 			.. wezterm.home_dir
-- 			.. "/.local/bin/wezterm.nvim.navigator"
-- 			.. " "
-- 			.. direction_nvim
-- 	)
-- 	if result then
-- 		window:perform_action(act({ SendString = "\x1b" .. direction_nvim }), pane)
-- 	else
-- 		window:perform_action(act({ ActivatePaneDirection = direction_wez }), pane)
-- 	end
-- end
--
-- wezterm.on("resize-left", function(window, pane)
-- 	vim_resize(window, pane, "Left", "u")
-- end)
--
-- wezterm.on("resize-right", function(window, pane)
-- 	vim_resize(window, pane, "Right", "p")
-- end)
--
-- wezterm.on("resize-up", function(window, pane)
-- 	vim_resize(window, pane, "Up", "o")
-- end)
--
-- wezterm.on("resize-down", function(window, pane)
-- 	vim_resize(window, pane, "Down", "i")
-- end)

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
	{
		key = "f",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	{
		key = "q",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	--	-- CTRL + (h,j,k,l) to move between panes
	--	{
	--		key = "h",
	--		mods = "CTRL",
	--		action = act({ EmitEvent = "move-left" }),
	--	},
	--	{
	--		key = "j",
	--		mods = "CTRL",
	--		action = act({ EmitEvent = "move-down" }),
	--	},
	--	{
	--		key = "k",
	--		mods = "CTRL",
	--		action = act({ EmitEvent = "move-up" }),
	--	},
	--	{
	--		key = "l",
	--		mods = "CTRL",
	--		action = act({ EmitEvent = "move-right" }),
	--	},
	--	-- ALT + (h,j,k,l) to resize panes
	--	{
	--		key = "u",
	--		mods = "ALT",
	--		action = act({ EmitEvent = "resize-left" }),
	--	},
	--	{
	--		key = "i",
	--		mods = "ALT",
	--		action = act({ EmitEvent = "resize-down" }),
	--	},
	--	{
	--		key = "o",
	--		mods = "ALT",
	--		action = act({ EmitEvent = "resize-up" }),
	--	},
	--	{
	--		key = "p",
	--		mods = "ALT",
	--		action = act({ EmitEvent = "resize-right" }),
	--	},
	-- Vertical split
	{
		-- |
		key = '"',
		mods = "LEADER|SHIFT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	-- Horizontal split
	{
		-- -
		key = "-",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	-- Swap panes
	{
		-- |
		key = "/",
		mods = "LEADER",
		action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
	},
	-- Attach to muxer (session)
	{
		key = "a",
		mods = "LEADER",
		action = act.AttachDomain("unix"),
	},

	-- Detach from muxer
	{
		key = "d",
		mods = "LEADER",
		action = act.DetachDomain({ DomainName = "unix" }),
	},
	-- Rename current session; analagous to command in tmux
	{
		key = "$",
		mods = "LEADER|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	},
	-- Show list of workspaces
	{
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
}

return config
