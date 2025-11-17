return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    lazy = false,
    config = function()
      -- Core settings (must be before colorscheme)
      vim.opt.termguicolors = true
      vim.opt.background = "dark" -- or "light"

      -- Gruvbox Material configuration
      vim.g.gruvbox_material_background = "hard" -- 'hard', 'medium', 'soft'
      vim.g.gruvbox_material_foreground = "mix"  -- 'material', 'mix', 'original'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_disable_italic_comment = false
      vim.g.gruvbox_material_enable_bold = true

      -- UI tweaks
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.g.gruvbox_material_float_style = "blend" -- 'bright', 'dim', 'blend'
      vim.g.gruvbox_material_ui_contrast = "low"   -- 'low', 'high'

      -- Diagnostics
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 0
      vim.g.gruvbox_material_diagnostic_virtual_text = "grey" -- 'grey','colored','highlighted'


      -- Optional Telescope refinements
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox-material",
        group = vim.api.nvim_create_augroup("gruvbox_material_telescope", {}),
        callback = function()
          local set = vim.api.nvim_set_hl
          set(0, "TelescopeBorder", { link = "FloatBorder" })
          set(0, "TelescopePromptBorder", { link = "FloatBorder" })
          set(0, "TelescopePromptTitle", { link = "Title" })
          set(0, "TelescopeResultsTitle", { fg = "NONE", bg = "NONE" })
          set(0, "TelescopeSelection", { bold = true })
        end,
      })
      vim.cmd [[hi Statusline guibg=NONE ]]
      vim.cmd.colorscheme("gruvbox-material")
    end,
  }
}
