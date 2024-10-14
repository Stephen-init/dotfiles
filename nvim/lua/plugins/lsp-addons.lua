return {
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
}
