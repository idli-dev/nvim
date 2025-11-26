return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"

      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_disable_italic_comment = false
      vim.g.gruvbox_material_enable_bold = true

      -- full transparency
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.g.gruvbox_material_float_style = "blend"
      vim.g.gruvbox_material_ui_contrast = "low"

      -- diagnostics tuned down
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "grey"
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
