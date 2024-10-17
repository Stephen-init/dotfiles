return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft.python = { "black", "isort", "docformatter" }
  end,
}
