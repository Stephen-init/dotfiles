-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function keybind(mode, key, action, desc)
  -- convenience function
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true, desc = desc })
end

-- tab to switch buffers in normal mode
-- keybind("n", "<Tab>", ":bnext<CR>", "next buffer") -- next buffer
-- keybind("n", "<S-Tab>", ":bprevious<CR>", "prev buffer") -- prev buffer

-- close
vim.api.nvim_set_keymap("n", "<leader>q", ":wincmd q<CR>", { noremap = true, silent = true, desc = "close window" })
vim.api.nvim_set_keymap("n", "<leader>cb", ":Bdelete<CR>", { noremap = true, silent = true, desc = "close buffer" })

-- navigating window splits
--keybind("n", "<C-h>", ":TmuxNavigateLeft<CR>")
--keybind("n", "<C-j>", ":TmuxNavigateDown<CR>")
--keybind("n", "<C-k>", ":TmuxNavigateUp<CR>")
--keybind("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- move text in visual block mode
keybind("v", "J", ":move '>+1<CR>gv-gv", "move text up")
keybind("v", "K", ":move '<-2<CR>gv-gv", "move text down")

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
--vim.keymap.set("n", "<A-u>", require("smart-splits").resize_left)
--vim.keymap.set("n", "<A-i>", require("smart-splits").resize_down)
--vim.keymap.set("n", "<A-o>", require("smart-splits").resize_up)
--vim.keymap.set("n", "<A-p>", require("smart-splits").resize_right)
---- moving between splits
--vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
--vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
--vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
--vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- vim.keymap.set("n", "<leader>sa", ":Lspsaga code_action<CR>", {})
-- vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", {})

-- copilot chat
-- vim.keymap.set("n", "<leader>cO", ":CopilotChatOpen<CR>", {})
-- vim.keymap.set("n", "<leader>cC", ":CopilotChatClose<CR>", {})

vim.api.nvim_set_keymap(
  "n",
  "<leader>db",
  ":normal oimport ipdb; ipdb.set_trace()<Esc>",
  { noremap = true, silent = true, desc = "python db" }
)

vim.keymap.set("n", "<leader>bf", require("bafa.ui").toggle, { noremap = true, silent = true, desc = "show buffers" })

-- Helper: Detect if window move is possible
local function can_move(dir)
  return vim.fn.winnr() ~= vim.fn.winnr(dir)
end

-- Try to move inside Neovim, else use Zellij
local function smart_move(dir, zellij_dir)
  if can_move(dir) then
    vim.cmd("wincmd " .. dir)
  else
    vim.fn.system({ "zellij", "action", "move-focus", zellij_dir })
  end
end

-- Final bindings
vim.keymap.set("n", "<C-h>", function()
  smart_move("h", "left")
end, { silent = true })
vim.keymap.set("n", "<C-j>", function()
  smart_move("j", "down")
end, { silent = true })
vim.keymap.set("n", "<C-k>", function()
  smart_move("k", "up")
end, { silent = true })
vim.keymap.set("n", "<C-l>", function()
  smart_move("l", "right")
end, { silent = true })
