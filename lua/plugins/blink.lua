vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("^1.*"),
  },
})

require("blink.cmp").setup({
  keymap = { preset = "default" },

  completion = {
    menu = { auto_show = false, scrollbar = false },
    documentation = { auto_show = false, window = { scrollbar = false } },
    ghost_text = { enabled = true },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = {
    implementation = "prefer_rust",
  },
})
