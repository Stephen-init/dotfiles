--return {
--  "nvim-lualine/lualine.nvim",
--  opts = function(_, opts)
--    local lint_progress = function()
--      local linters = require("lint").get_running()
--      if vim.bo.filetype == "python" then
--        local bufnr = vim.api.nvim_get_current_buf()
--        local clients = vim.lsp.get_clients({ bufnr = bufnr })
--        if #clients == 0 then
--          return "󰦕 "
--        end
--        local c = {}
--        for _, client in ipairs(clients) do
--          if client.name == "pyright" then
--            table.insert(c, "flake8")
--          end
--          if client.name == "ruff" then
--            table.insert(c, "ruff")
--          end
--        end
--        return "󱉶 " .. table.concat(c, ", ")
--      end
--
--      if #linters == 0 then
--        return "󰦕"
--      end
--      return "󱉶 " .. table.concat(linters, ", ")
--    end
--
--    local clients_lsp = function()
--      local bufnr = vim.api.nvim_get_current_buf()
--      local clients = vim.lsp.get_clients({ bufnr = bufnr })
--      if #clients == 0 then
--        return ""
--      end
--
--      local c = {}
--      for _, client in ipairs(clients) do
--        table.insert(c, client.name)
--      end
--      return "  " .. table.concat(c, ", ")
--    end
--
--    local formatters = function()
--      local ok, conform = pcall(require, "conform")
--      if not ok then
--        return ""
--      end
--      local available = conform.list_formatters()
--      if #available == 0 then
--        return ""
--      end
--      return "󰕮 " .. table.concat(available, ", ")
--    end
--
--    local toggleterm_status = function()
--      local ok, toggleterm = pcall(require, "toggleterm.terminal")
--      if not ok then
--        return ""
--      end
--      local active_terms = {}
--      -- Corrected line: fixed function name and loop variables
--      for _, term in pairs(toggleterm.get_all()) do
--        if term:is_open() then
--          -- Use explicit display names based on IDs
--          table.insert(active_terms, "Term" .. term.id)
--        end
--      end
--      return #active_terms > 0 and " " .. table.concat(active_terms, ", ") or ""
--    end
--
--    opts.component_separators = { left = "", right = "" }
--    opts.section_separators = { left = "", right = "" }
--
--    opts.sections = {
--      lualine_a = { "mode" },
--      lualine_b = { "branch" },
--      lualine_c = {}, -- Explicitly empty
--      lualine_x = { clients_lsp, lint_progress, formatters, toggleterm_status, "filetype" },
--      lualine_y = { "progress" },
--      lualine_z = { "location" },
--    }
--  end,
--}
