return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true,
			solid = false,
		},
		show_end_of_buffer = false,
		term_colors = true,
		lsp_styles = {
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		color_overrides = {},
		custom_highlights = {
			StatusLine = NONE,
		},
		default_integrations = true,
		auto_integrations = false,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	},
}
