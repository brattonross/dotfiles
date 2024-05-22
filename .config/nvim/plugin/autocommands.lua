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

-- Set winbar except for terminal windows and floating windows
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "" or vim.bo.buftype == "terminal" or vim.bo.buftype == "nofile" then
			return
		end

		local filepath = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":~:.")
		local separator = " ❯ "
		local parts = vim.fn.split(filepath, "/")
		local res = vim.fn.filter(parts, function(_, v)
			return v ~= "" and v ~= nil
		end)
		local winbar_str = vim.fn.join(res, separator)

		vim.wo.winbar = " " .. winbar_str

		vim.cmd("highlight WinBar guifg=@text guibg=None")
		vim.cmd("highlight WinBarNC guifg=@text guibg=None")
	end,
	group = augroup("winbar"),
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
