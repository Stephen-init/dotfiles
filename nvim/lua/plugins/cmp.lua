vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#0e1116" })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#172036" })
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#fdafaf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#fdafaf", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#fdafaf", bg = "NONE" })

return {

  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.experimental.ghost_text = {
      enabled = true,
      hl_group = "CmpItemAbbr",
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
