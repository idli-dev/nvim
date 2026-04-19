vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" }
})

require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["<esc><esc>"] = { "actions.close", mode = "n" },
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "-", ":Oil<cr>")
