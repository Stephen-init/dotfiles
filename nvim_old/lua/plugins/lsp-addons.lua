return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort",
					"black",
					"eslint_d", -- js linter
					"flake8",
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				log_level = vim.log.levels.DEBUG,
				format_on_save = {
					timeout_ms = 3000,
					async = false,
					quiet = false,
				},
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
					python = { "black", "isort" },
				},
				formatters = {
					black = {
						prepend_args = { "--fast" },
					},
				},
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({ ui = {
				code_action = "",
			} })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- Lazy
	{
		"dgagn/diagflow.nvim",
		-- event = 'LspAttach', This is what I use personnally and it works great
		opts = {},
		config = function()
			require("diagflow").setup({
				show_sign = true, -- set to true if you want to render the diagnostic sign before the diagnostic message
				border_chars = {
					top_left = "┌",
					top_right = "┐",
					bottom_left = "└",
					bottom_right = "┘",
					horizontal = "",
					vertical = "",
				},
				show_borders = false, -- ...
			})
		end,
	},

	--{
	--	"mfussenegger/nvim-lint",
	--	config = function()
	--		require("lint").linters_by_ft = {
	--			python = { "ruff" },
	--		}
	--	end,
	--},
	--    {
	--    "lewis6991/hover.nvim",
	--    config = function()
	--        require("hover").setup({
	--            init = function()
	--                -- Require providers
	--                require("hover.providers.lsp")
	--                -- require('hover.providers.gh')
	--                -- require('hover.providers.gh_user')
	--                -- require('hover.providers.jira')
	--                -- require('hover.providers.man')
	--                -- require('hover.providers.dictionary')
	--            end,
	--            preview_opts = {
	--                border = 'single'
	--            },
	--            -- Whether the contents of a currently open hover window should be moved
	--            -- to a :h preview-window when pressing the hover keymap.
	--            preview_window = false,
	--            title = true,
	--            mouse_providers = {
	--                'LSP'
	--            },
	--            mouse_delay = 1000
	--        })
	--    end
	--}
}
