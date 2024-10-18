return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = { "stylua", "shfmt", "black", "isort", "docformatter", "pyright", "ruff" }
  end,
}
