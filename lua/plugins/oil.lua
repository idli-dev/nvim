return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "-", ":Oil --float<cr>" },
	},
	opts = {
		default_file_explorer = true,
		keymaps = {
			["<esc><esc>"] = { "actions.close", mode = "n" },
		},
		view_options = {
			show_hidden = true,
		},
	},
}
