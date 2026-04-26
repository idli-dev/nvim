vim.o.autowriteall = true

local group = vim.api.nvim_create_augroup("Auto_Save", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost", "BufLeave" }, {
  group = group,
  pattern = "*",
  command = "silent! w",
})
