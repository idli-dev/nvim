vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
})

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.indentscope").setup({ symbol = "┃" })
