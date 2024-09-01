return {
	-- {
	-- 	"edluffy/specs.nvim",
	-- 	config = function()
	-- 		require("specs").setup({
	-- 			show_jumps = true,
	-- 			min_jump = 30,
	-- 			popup = {
	-- 				delay_ms = 0, -- delay before popup displays
	-- 				inc_ms = 10, -- time increments used for fade/resize effects
	-- 				blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
	-- 				width = 10,
	-- 				winhl = "PMenu",
	-- 				fader = require("specs").linear_fader,
	-- 				resizer = require("specs").shrink_resizer,
	-- 			},
	-- 			ignore_filetypes = {},
	-- 			ignore_buftypes = {
	-- 				nofile = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing = "linear", -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
		end,
	}, --	{
	--		"echasnovski/mini.nvim",
	--		config = function()
	--			require("mini.animate").setup()
	--		end,
	--	},
	{
		"machakann/vim-highlightedyank",
		lazy = false,
	},
}
