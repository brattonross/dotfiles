vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("brattonross_TermOpen", {}),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.scrolloff = 0
		vim.bo.filetype = "terminal"
	end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<leader>tt", function()
	vim.cmd.tabnew()
	vim.cmd.term()
end)
