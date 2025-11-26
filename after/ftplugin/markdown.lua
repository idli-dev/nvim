-- Minimal markdown ftplugin for clean scratchpad
-- Place in: ftplugin/markdown.lua

local o = vim.opt

-- Basic UI cleanup
o.number = false
o.relativenumber = false
o.signcolumn = "no"
o.cursorline = false
o.foldenable = false
o.list = false
o.colorcolumn = ""
o.laststatus = 0
o.statusline = ""
o.showtabline = 0
o.winbar = ""
-- Minimal highlight override
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })

-- ftplugin/markdown.lua
vim.opt_local.formatoptions:append({ "r", "n" })
