return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      persist_mode = true,
      auto_scroll = true,
      direction = "float",
    })
  end,
}
