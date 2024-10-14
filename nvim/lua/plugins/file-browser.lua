return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>sB",
        ":Telescope file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "kiyoon/telescope-insert-path.nvim",
    config = function()
      local path_actions = require("telescope_insert_path")
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              -- E.g. Type `[i`, `[I`, `[a`, `[A`, `[o`, `[O` to insert relative path and select the path in visual mode.
              -- Other mappings work the same way with a different prefix.
              ["-"] = path_actions.insert_reltobufpath_visual,
              ["="] = path_actions.insert_abspath_visual,
              -- If you want to get relative path that is relative to the cwd, use
              -- `relpath` instead of `reltobufpath`
              -- You can skip the location postfix if you specify that in the function name.
              -- ["<C-o>"] = path_actions.insert_relpath_o_visual,
            },
          },
        },
      })
    end,
  },
}
