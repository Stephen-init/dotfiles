return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = { "stylua", "shfmt", "pyright", "ruff" }
  end,
}
