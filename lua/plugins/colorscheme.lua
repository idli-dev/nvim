return {
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		lazy = false,
		config = function()
			-- basic colorscheme setup
			vim.opt.termguicolors = true
			vim.opt.background = "dark"

			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_disable_italic_comment = false
			vim.g.gruvbox_material_enable_bold = true

			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_dim_inactive_windows = 0
			vim.g.gruvbox_material_float_style = "blend"
			vim.g.gruvbox_material_ui_contrast = "low"

			-- subtle diagnostics
			vim.g.gruvbox_material_diagnostic_text_highlight = 1
			vim.g.gruvbox_material_diagnostic_line_highlight = 0
			vim.g.gruvbox_material_diagnostic_virtual_text = "grey"

			-- minimal float cleanup (no overrides, just consistent floats)
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "gruvbox-material",
				group = vim.api.nvim_create_augroup("gruvbox_material_minimal", { clear = true }),
				callback = function()
					vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
					vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
				end,
			})

			vim.cmd("colorscheme gruvbox-material")
		end,
	},
}
