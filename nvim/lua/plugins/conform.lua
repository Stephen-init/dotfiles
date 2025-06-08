return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "docformatter", "ruff_format" }, -- docformatter runs before ruff
    },
    formatters = {
      docformatter = {
        command = "docformatter",
        args = {
          "--in-place",
          "--wrap-summaries",
          "88",
          "--wrap-descriptions",
          "88",
          "--pre-summary-newline",
          "--make-summary-multi-line",
          "$FILENAME",
        },
        stdin = false,
      },
    },
  },
}
