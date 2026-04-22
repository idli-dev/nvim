local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

o.number = true
o.relativenumber = false
o.signcolumn = "yes:1"

o.wrap = false
o.linebreak = true
o.breakindent = true
o.sidescroll = 10
o.sidescrolloff = 10

o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.smarttab = true

o.autoindent = true
o.smartindent = true
o.copyindent = true
o.preserveindent = true

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true
o.inccommand = "split"
o.virtualedit = "block"

o.winborder = "single"

o.scrolloff = 8
o.cursorline = true
o.cursorlineopt = "number"

o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"

o.undofile = true
o.undolevels = 10000
o.backup = false
o.swapfile = false
o.writebackup = false

local undodir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
o.undodir = undodir

o.showmode = false
o.laststatus = 3
o.cmdheight = 1
o.ruler = false
o.showcmd = true

o.completeopt = { "menu", "menuone", "noselect", "popup", "fuzzy" }
o.pumheight = 10

o.mouse = "a"
o.confirm = true
o.hidden = true
o.autoread = true

o.backspace = { "indent", "eol", "start" }
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")

o.timeoutlen = 300
o.updatetime = 200
o.lazyredraw = true
o.synmaxcol = 300

if vim.fn.executable("rg") == 1 then
  o.grepprg = "rg --vimgrep --smart-case --hidden"
  o.grepformat = "%f:%l:%c:%m"
end
