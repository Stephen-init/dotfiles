return {
	{
		"edluffy/specs.nvim",
		config = function()
			require("specs").setup({
				show_jumps = true,
				min_jump = 30,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 10, -- time increments used for fade/resize effects
					blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 10,
					winhl = "PMenu",
					fader = require("specs").linear_fader,
					resizer = require("specs").shrink_resizer,
				},
				ignore_filetypes = {},
				ignore_buftypes = {
					nofile = true,
				},
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
			t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
			t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
			t["zt"] = { "zt", { "250" } }
			t["zz"] = { "zz", { "250" } }
			t["zb"] = { "zb", { "250" } }

			require("neoscroll.config").set_mappings(t)
		end,
	}, --	{
	--		"echasnovski/mini.nvim",
	--		config = function()
	--			require("mini.animate").setup()
	--		end,
	--	},
}
