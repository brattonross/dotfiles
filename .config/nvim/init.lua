vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

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
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "rounded",
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

require("brattonross.set")
require("brattonross.remap")
require("brattonross.autocommands")

vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#43484E", bg = "None" })
vim.api.nvim_set_hl(0, "winbar", {
	fg = "#777B84",
	bg = "None",
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
