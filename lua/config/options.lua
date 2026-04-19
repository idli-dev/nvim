local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.mouse = "a"
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = { "menu", "menuone", "noselect" }

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.winblend = 0

opt.winborder = "single"

opt.pumblend = 0
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.splitbelow = true
opt.splitright = true

opt.laststatus = 3
opt.showmode = false

-- Tabs & Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true

-- Wrapping
opt.wrap = false
opt.linebreak = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files & Encoding
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"
opt.autoread = true

-- Completion & Cmdline
opt.wildmode = { "longest", "list", "full" }
opt.wildignore:append({
  "*.o", "*.obj", "*.bin",
  "*.jpg", "*.png", "*.gif",
  "*.zip", "*.tar.gz",
  "node_modules/*",
})
vim.opt.iskeyword:append("-")

-- Performance
opt.lazyredraw = true
opt.synmaxcol = 300

-- Folding (Treesitter / expr-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

-- Diagnostics (built-in LSP UX)
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "single",
    source = "if_many",
  },
})

-- Neovim 0.10+ / 0.12 niceties
opt.shortmess:append("c")
opt.fillchars = {
  eob = " ",
}

-- Optional: disable some built-ins for startup speed
local disabled_builtins = {
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "matchit",
  "matchparen",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
}

for _, plugin in ipairs(disabled_builtins) do
  g["loaded_" .. plugin] = 1
end
