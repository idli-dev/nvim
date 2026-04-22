vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
  default_file_explorer = true,
  keymaps = {
    ["<esc><esc>"] = { "actions.close", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>")
