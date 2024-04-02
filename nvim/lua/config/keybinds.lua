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
keybind("n", "<leader>cb", ":enew<bar>bd #<CR>") -- close window, but keep buffer open

-- navigating window splits
keybind("n", "<C-h>", ":TmuxNavigateLeft<CR>")
keybind("n", "<C-j>", ":TmuxNavigateDown<CR>")
keybind("n", "<C-k>", ":TmuxNavigateUp<CR>")
keybind("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- maintain visual selection after changing indent
keybind("v", "<", "<gv")
keybind("v", ">", ">gv")

-- move text in visual block mode
keybind("v", "J", ":move '>+1<CR>gv-gv")
keybind("v", "K", ":move '<-2<CR>gv-gv")

-- trouble
vim.keymap.set("n", "<leader>tt", function()
	require("trouble").toggle()
end)

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
vim.keymap.set("n", "<leader>dv", ":DiffviewFileHistory<CR>", {})

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

-- Press <C-b> to call specs!
vim.api.nvim_set_keymap("n", "<C-b>", ':lua require("specs").show_specs()', { noremap = true, silent = true })

-- You can even bind it to search jumping and more, example:
vim.api.nvim_set_keymap("n", "n", 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
