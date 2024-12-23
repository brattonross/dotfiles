vim.keymap.set("n", "<CR>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd.nohl()
		return ""
	end
	return vim.keycode("<CR>")
end, { expr = true })
