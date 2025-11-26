return {
  'MeanderingProgrammer/render-markdown.nvim',
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },
  opts = {
    completions = { lsp = { enabled = true } },
    heading = {
      sign = false,
      position = 'inline',
      width = 'block',
      left_margin = 0.5,
      left_pad = 0.2,
      right_pad = 0.2,
      backgrounds = {
        'NONE',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
    },

    bullet = {
      left_pad = 3
    },
    checkbox = {
      enabled = true,
      render_modes = false,
      bullet = false,
      left_pad = 3,
      right_pad = 0,
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
      },
      scope_priority = nil,
    },
  },
}
