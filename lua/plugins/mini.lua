vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.surround" },
  { src = "https://github.com/nvim-mini/mini.indentscope" }
})

require("mini.icons").setup()

local group = vim.api.nvim_create_augroup('User_Mini', {
  clear = true
})

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  group = group,
  callback = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
  end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  once = true,
  callback = function()
    require("mini.indentscope").setup({ symbol = "┃" })
  end,
})
