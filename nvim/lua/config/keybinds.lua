local function keybind(mode, key, action)
	-- convenience function
	vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

-- mapping leader function
keybind("", "<Space>", "<Nop>")

-- insert new lines, staying in normal mode
keybind("n", "<leader>o", "o<ESC>")
keybind("n", "<leader>O", "O<ESC>")

-- paste in insert mode
keybind("i", "<C-V>", "<C-O>p")

-- cancel search highlight with esc
keybind("n", "<ESC>", ":noh<CR>")

-- tab to switch buffers in normal mode
keybind("n", "<Tab>", ":bnext<CR>") -- next buffer
keybind("n", "<S-Tab>", ":bprevious<CR>") -- prev buffer

-- window splits
keybind("n", "<leader>s", ":wincmd s<CR>") -- split horizontally
keybind("n", "<leader>v", ":wincmd v<CR>") -- split vertically
keybind("n", "<leader>=", ":wincmd =<CR>") -- even out splits
keybind("n", "<leader>q", ":wincmd q<CR>") -- close window split
keybind("n", "<leader>cb", ":Bdelete<CR>") -- close buffer, but keep window open

-- navigating window splits
--keybind("n", "<C-h>", ":TmuxNavigateLeft<CR>")
--keybind("n", "<C-j>", ":TmuxNavigateDown<CR>")
--keybind("n", "<C-k>", ":TmuxNavigateUp<CR>")
--keybind("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- maintain visual selection after changing indent
keybind("v", "<", "<gv")
keybind("v", ">", ">gv")

-- move text in visual block mode
keybind("v", "J", ":move '>+1<CR>gv-gv")
keybind("v", "K", ":move '<-2<CR>gv-gv")

-- debug
vim.keymap.set("n", "<leader>db", ":nnoremap gp iHi<Esc>")
--

-- telescope
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end)
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

-- neo-tree
keybind("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
-- vim.keymap.set("n", "<leader>ef", ":Neotree buffers reveal float<CR>", {})

-- gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
vim.keymap.set("n", "<leader>dt", ":Gitsigns diffthis HEAD~1<CR>", {})
vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", {})

-- lsp
-- vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- todo
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

keybind("n", "<leader>td", ":TodoQuickFix<CR>")

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set("n", "<A-u>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-i>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-o>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-p>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<leader>sa", ":Lspsaga code_action<CR>", {})
vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", {})

-- copilot chat
vim.keymap.set("n", "<leader>co", ":CopilotChatOpen<CR>", {})
vim.keymap.set("n", "<leader>cc", ":CopilotChatClose<CR>", {})

vim.api.nvim_set_keymap(
	"n",
	"<leader>db",
	":normal oimport ipdb; ipdb.set_trace()<Esc>",
	{ noremap = true, silent = true }
)

-- toggle term
vim.keymap.set("v", "<leader>st", ":ToggleTermSendVisualLines <T_ID><CR>", {})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>md", "<cmd>set modifiable<CR>", {})
