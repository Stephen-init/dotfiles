return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = {
      filters = { dotfiles = false, custom = { "^.git$" } },
      view = {
        preserve_window_proportions = false,
        adaptive_size = true,
        ---
      },
      --
      actions = {
        --
        open_file = {
          resize_window = false,
          --
        },
        --
      },
    },
  },
  "nvim-tree/nvim-web-devicons",
}
