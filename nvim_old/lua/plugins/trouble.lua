return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				type = "float",
				relative = "editor",
				border = "rounded",
				title = "Preview",
				title_pos = "center",
				position = { 0, -2 },
				size = { width = 0.3, height = 0.3 },
				zindex = 200,
			},
		},
	},

	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle focus=true win.position=right<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
