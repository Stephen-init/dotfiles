return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    local signs = {
      add = { text = "+" },
      change = { text = "m" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
      untracked = { text = "?" },
    }
    opts.signs = signs
  end,
}
