return {

  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#0e1116" })
    vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#172036" })
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#a6adc8", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#cba6f7", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#cba6f7", bg = "NONE" })

    opts.experimental.ghost_text = {
      enabled = false,
      hl_group = "CmpGhostText",
    }

    opts.window = {
      completion = {
        border = "double",
        winhighlight = "Normal:CmpNormal,FloatBorder:CmpNormal,Search:None",
      },
      documentation = {
        border = "double",
        winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocNormal,Search:None",
      },
    }
  end,
}
