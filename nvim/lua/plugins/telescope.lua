return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					oldfiles = {
						cwd_only = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				-- .. other settings
				extensions = {
					file_browser = {
						-- hijack_netrw = true,
						theme = "ivy",
						mappings = {
							i = {
								["<C-y>"] = function()
									local entry = require("telescope.actions.state").get_selected_entry()
									local cb_opts = vim.opt.clipboard:get()
									if vim.tbl_contains(cb_opts, "unnamed") then
										vim.fn.setreg("*", entry.path)
									end
									if vim.tbl_contains(cb_opts, "unnamedplus") then
										vim.fn.setreg("+", entry.path)
									end
									vim.fn.setreg("", entry.path)
								end,
							},
						},
					},
				},
			})
		end,
	},
	{
		"kiyoon/telescope-insert-path.nvim",
		config = function()
			local path_actions = require("telescope_insert_path")
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							-- E.g. Type `[i`, `[I`, `[a`, `[A`, `[o`, `[O` to insert relative path and select the path in visual mode.
							-- Other mappings work the same way with a different prefix.
							["-"] = path_actions.insert_reltobufpath_visual,
							["="] = path_actions.insert_abspath_visual,
							-- If you want to get relative path that is relative to the cwd, use
							-- `relpath` instead of `reltobufpath`
							-- You can skip the location postfix if you specify that in the function name.
							-- ["<C-o>"] = path_actions.insert_relpath_o_visual,
						},
					},
				},
			})
		end,
	},
}
