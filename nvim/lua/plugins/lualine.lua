return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local lint_progress = function()
      local linters = require("lint").get_running()
      if vim.bo.filetype == "python" then
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.buf_get_clients(bufnr)
        if next(clients) == nil then
          return "󰦕 "
        end
        local c = {}
        for _, client in pairs(clients) do
          if client.name == "pyright" then
            table.insert(c, "flake8")
          end
          if client.name == "ruff" then
            table.insert(c, "ruff")
          end
        end
        return "󱉶 " .. table.concat(c, ", ")
      end

      if #linters == 0 then
        return "󰦕"
      end
      return "󱉶 " .. table.concat(linters, ", ")
    end

    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.buf_get_clients(bufnr)
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return "\u{f085}  " .. table.concat(c, ", ")
    end

    local formatters = function()
      ok, conform = pcall(require, "conform")
      return "󰕮 " .. table.concat(conform.formatters_by_ft[vim.bo.filetype], ", ")
    end

    opts.component_separators = { left = "", right = "" }
    opts.section_separators = { left = "", right = "" }

    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {},
      lualine_x = { clients_lsp, lint_progress, formatters, "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
    opts.extensions = { "nvim-tree", "lazy" }
  end,
}
