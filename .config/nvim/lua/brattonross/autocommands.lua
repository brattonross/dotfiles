local function augroup(name)
	return vim.api.nvim_create_augroup("brattonross_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = augroup("highlight_on_yank"),
	pattern = "*",
})

-- Resize splits on VimResized
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
	group = augroup("resize_splits"),
})

-- Set wrap and spellcheck for certain filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = augroup("filetype_settings"),
})

-- Prevent auto commenting on new line
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = augroup("comments_on_new_line"),
})

-- Set winbar except for terminal windows
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "" or vim.bo.filetype == "toggleterm" then
			return
		end

		vim.wo.winbar = " %m %f "
	end,
})

-- Ensure that netrw buffers use the correct keybindings
-- Also, set winbar for netrw buffers
vim.api.nvim_create_autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true })

		vim.wo.winbar = " %m %f "
	end,
	group = augroup("netrw_mappings"),
})

-- Disable relative line numbers and signcolumn in terminal windows
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
	group = augroup("terminals"),
})
