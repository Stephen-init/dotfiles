return {
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-a>", -- Accept the suggestion with Ctrl+a
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        filetypes = {
          -- Enabled for most common file types
          ["*"] = true,
        },
      })
    end,
  },

  -- Copilot CMP integration
  {
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
      },
      config = function()
        require("codecompanion").setup({
          adapters = {
            chat = {
              copilot = {
                model = "claude-3-7-sonnet-20250219",
              },
            },
            inline = {
              copilot = {
                model = "claude-3-7-sonnet-20250219",
              },
            },
          },
          auto_completion = {
            -- Enable auto-completion
            enabled = true,
            -- Auto-completion options for nvim-cmp
            accept_word = "<C-f>", -- Key to press to accept a word suggestion
            accept_line = "<C-l>", -- Key to press to accept a line suggestion
          },
          cmp = {
            enabled = true,
            -- Integration with nvim-cmp
            -- Set this to false if you want to use your own configuration
            -- for nvim-cmp source
            updateLazyCmpConfig = true,
          },
          context = {
            -- Configure how much context to include
            include_cursor_position = true, -- Include cursor position in context
            language_servers = true, -- Include language server information
            lines_after = 20, -- Number of lines to include after cursor
            lines_before = 20, -- Number of lines to include before cursor
          },
          default_adapter = {
            chat = "copilot", -- Set Copilot as default chat adapter
            inline = "copilot", -- Set Copilot as default inline adapter
          },
          keymaps = {
            -- Define keymaps for different actions
            next_completion = "<C-n>", -- Go to next completion
            prev_completion = "<C-p>", -- Go to previous completion
            accept_completion = "<C-y>", -- Accept the current completion
            dismiss_completion = "<C-e>", -- Dismiss the current completion

            -- Chat-specific keymaps
            draft_message = "<leader>cd", -- Draft a new message
            submit_message = "<C-CR>", -- Submit the current message
            accept_diff = "<C-y>", -- Accept the diff suggestion
          },
          ui = {
            -- UI configuration options
            border = "rounded", -- Border style for floating windows
            chat = {
              auto_focus = true, -- Automatically focus the chat window when opened
              auto_scroll = true, -- Automatically scroll to the bottom of the chat
            },
          },
        })

        -- Setup keymaps globally
        vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })
        vim.keymap.set("n", "<leader>ct", ":CodeCompanionToggle<CR>", { desc = "Toggle Code Companion inline" })
        vim.keymap.set("n", "<leader>cr", ":CodeCompanionContextReset<CR>", { desc = "Reset Code Companion context" })
      end,
    },
  },
}
