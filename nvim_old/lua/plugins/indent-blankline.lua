return {
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "┌",
						left_bottom = "└",
						right_arrow = "─",
					},
					style = "#00ffff",
				},
			})
		end,
	},

	--    "lukas-reineke/indent-blankline.nvim",
	--    lazy = false,
	--    opts = {},
	--    main = "ibl",
	--    config = function()
	--        require("ibl").setup()
	--    end,
}
