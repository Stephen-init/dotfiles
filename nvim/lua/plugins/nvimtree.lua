return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = {
			filters = { dotfiles = false, custom = { "^.git$" } },
			view = {
				preserve_window_proportions = false,
				adaptive_size = true,
				---
			},
			--
			actions = {
				--
				open_file = {
					resize_window = false,
					--
				},
				--
			},
		},
	},
	"nvim-tree/nvim-web-devicons",
}

-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	init = function() vim.g.neo_tree_remove_legacy_commands = true end,
-- 	config = function()
-- 		vim.fn.sign_define("DiagnosticSignError",
--         {text = " ", texthl = "DiagnosticSignError"})
-- 		vim.fn.sign_define("DiagnosticSignWarn",
-- 			{text = " ", texthl = "DiagnosticSignWarn"})
-- 		vim.fn.sign_define("DiagnosticSignInfo",
-- 			{text = " ", texthl = "DiagnosticSignInfo"})
-- 		vim.fn.sign_define("DiagnosticSignHint",
-- 			{text = "󰌵", texthl = "DiagnosticSignHint"})
-- 		require("neo-tree").setup({
-- 			default_component_configs = {
-- 				git_status = {
-- 					symbols = {
-- 					-- Change type
-- 					added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
-- 					modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
-- 					deleted   = "✖",-- this can only be used in the git_status source
-- 					renamed   = "󰁕",-- this can only be used in the git_status source
-- 					-- Status type
-- 					untracked = "",
-- 					ignored   = "",
-- 					unstaged  = "M",
-- 					staged    = "",
-- 					conflict  = "",
-- 					}
-- 				},
-- 			}
-- 		})
-- 	end,
-- }
