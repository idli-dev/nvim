vim.pack.add({
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/lewis6991/gitsigns.nvim"
})

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("gitsigns").setup()

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
