return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed= {"lua_ls","pyright","tsserver","html","ruff_lsp"}
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.lua_ls.setup({})

      lspconfig.pyright.setup({
        settings = {
			pyright = {
				disableOrganizeImports = true,
			},
            python = {
                analysis = {
                ignore = { '*' }, -- Using Ruff
                },
            },
        },
      })

      lspconfig.ruff_lsp.setup {
        init_options = {
            settings = {
                -- Any extra CLI arguments for `ruff` go here.
                args = {},
            }
        }
    }
    local symbols = { Error = " ", Warn = " ", Hint = "", Info = "" }

    for name, icon in pairs(symbols) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end

    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {},
    event = 'VeryLazy',
    cmd = { "VenvSelect", "VenvSelectCached" },
    keys = {
        -- Keymap to open VenvSelector to pick a venv.
        { '<leader>vs', '<cmd>VenvSelect<cr>' },
        -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
        { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },

}