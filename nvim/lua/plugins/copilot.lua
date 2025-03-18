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

  {
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("codecompanion").setup({
          adapters = {
            chat = {
              copilot = {
                model = "claude-3-7-sonnet",
              },
            },
            inline = {
              copilot = {
                model = "claude-3-7-sonnet",
              },
            },
          },
          display = {
            action_palette = {
              width = 95,
              height = 10,
              prompt = "Prompt ", -- Prompt used for interactive LLM calls
              provider = "default", -- default|telescope|mini_pick
              opts = {
                show_default_actions = true, -- Show the default actions in the action palette?
                show_default_prompt_library = true, -- Show the default prompt library in the action palette?
              },
            },
          },
          strategies = {
            inline = {
              keymaps = {
                accept_change = {
                  modes = { n = "ga" },
                  description = "Accept the suggested change",
                },
                reject_change = {
                  modes = { n = "gr" },
                  description = "Reject the suggested change",
                },
              },
            },
          },
        })
        vim.keymap.set({ "n", "v" }, "<leader>ac", ":CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })
        vim.keymap.set({ "n", "v" }, "<leader>aa", ":CodeCompanionActions<CR>", { desc = "Open Code Companion Prompt" })
        vim.keymap.set(
          { "n", "v" },
          "<leader>at",
          ":CodeCompanion Toggle<CR>",
          { desc = "Toggle Code Companion inline" }
        )
        vim.keymap.set(
          { "n", "v" },
          "<leader>ar",
          ":CodeCompanionContextReset<CR>",
          { desc = "Reset Code Companion context" }
        )
      end,
    },
  },
}
