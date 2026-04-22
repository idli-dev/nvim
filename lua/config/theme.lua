vim.pack.add({ "https://github.com/casedami/neomodern.nvim" })
require("neomodern").setup({
	bg = "transparent",
	theme = "moon",
	gutter = {
		cursorline = false,
		dark = false,
	},
	diagnostics = {
		darker = true,
		undercurl = true,
		background = true,
	},
})

require("neomodern").load()
vim.opt.fillchars:append({ eob = " " })
vim.cmd([[ hi StatusLine guibg=NONE ]])
