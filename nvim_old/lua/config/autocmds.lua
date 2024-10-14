vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
	callback = function()
		local lint_status, lint = pcall(require, "lint")
		if lint_status then
			lint.try_lint()
		end
	end,
})
--
--vim.api.nvim_create_autocmd("User", {
--	pattern = "GitConflictDetected",
--	callback = function()
--		vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
--		vim.keymap.set("n", "<leader>gcf", function()
--			engage.conflict_buster()
--			create_buffer_local_mappings()
--		end)
--	end,
--})
