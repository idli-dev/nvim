return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = false,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>" },
		{ "<leader>fn", "<cmd>Telescope find_files cwd=~/.config/nvim theme=dropdown<cr>" },
		{ "<leader>fd", "<cmd>Telescope find_files cwd=~/dotfiles hidden=true theme=dropdown<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep theme=ivy<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags theme=ivy<cr>" },
		{ "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<cr>" },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				borderchars = {
					"─", -- top
					"│", -- right
					"─", -- bottom
					"│", -- left
					"┌", -- top-left
					"┐", -- top-right
					"┘", -- bottom-right
					"└", -- bottom-left
				},
			},
		})

		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("fzf")
	end,
}
