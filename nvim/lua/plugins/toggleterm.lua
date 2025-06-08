return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    persist_mode = true, -- Keep terminals alive between toggle operations
    auto_scroll = true, -- Automatically scroll to bottom on output
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local term1 = Terminal:new({ id = 1, direction = "float", hidden = true })
    local term2 = Terminal:new({ id = 2, direction = "float", hidden = true })

    vim.keymap.set({ "n", "t" }, "<C-\\>", function()
      term1:toggle()
    end, { desc = "Toggle floating terminal 1" })

    vim.keymap.set({ "n", "t" }, "<C-]>", function()
      term2:toggle()
    end, { desc = "Toggle floating terminal 2" })
  end,
}
