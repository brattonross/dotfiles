-- ui
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.signcolumn = "yes"

vim.opt.list = false
vim.opt.listchars:append({
	eol = "↵",
	space = "·",
	tab = "» ",
})

-- search
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = false

vim.opt.formatoptions:remove("o")

vim.opt.swapfile = false
