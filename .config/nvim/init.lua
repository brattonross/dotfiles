vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

require("brattonross.set")
require("brattonross.remap")
require("brattonross.autocommands")

-- Ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Go!
require("lazy").setup("plugins", {
	lazy = true,
	ui = {
		border = "rounded",
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
