return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"json",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"markdown",
			"markdown_inline",
			"python",
			"c",
			"cpp",
			"rust",
			"toml",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
