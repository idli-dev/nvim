vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
})

require("treesitter-modules").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"json",
		"toml",
		"markdown",
		"markdown_inline",
		"html",
		"css",
		"javascript",
		"python",
		"c",
	},
	sync_install = false,
	auto_install = true,
	fold = {
		enable = false,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<cr>",
			node_incremental = "<cr>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	indent = {
		enable = true,
	},
})
