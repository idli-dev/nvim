-- VIM OPTIONS

-- Basic settings
vim.opt.number = true      -- Line number
vim.opt.scrolloff = 8      -- Keep 8 lines above or below the cursor
vim.opt.sidescrolloff = 10 -- Keep 10 lines right or left of the cursor
vim.opt.wrap = false       -- Turn off wrap
vim.opt.cmdheight = 1      -- Command line height to 1
vim.opt.spell = false      -- Turn off spell

-- Tabbing / Indentation
vim.opt.tabstop = 2                -- Tab width
vim.opt.shiftwidth = 2             -- Indent width
vim.opt.softtabstop = 2            -- Soft tab stop
vim.opt.expandtab = true           -- tabs are spaces!
vim.opt.smartindent = true         -- Smart indenting automatically
vim.opt.autoindent = true          -- Copy indent from current line
vim.opt.grepprg = "rg --vimgrep"   -- Use ripgrep if available
vim.opt.grepformat = "%f:%l:%c:%m" -- Filename,Line number,Column,Content

-- Search settings
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true  -- Case-insensitive search if uppercase is used in search
vim.opt.hlsearch = false  -- Don't highlight on searching
vim.opt.incsearch = true  -- Show search matches as you type!

-- Visual settings
vim.opt.winborder = "single"
vim.opt.background = "dark"
vim.opt.termguicolors = true  -- Enable 24-bit colors
vim.opt.signcolumn = "yes"    -- Always show the signcolumn
vim.opt.showmatch = true      -- Highlight matching brackets
vim.opt.matchtime = 2         -- How long to show matching brackets

vim.opt.showmode = false      -- Don't show mode in command line
vim.opt.pumheight = 10        -- pum = pop-up-menu. This options sets the pop-up-menu height
vim.opt.pumblend = 10         -- Pop up menu transparency
vim.opt.conceallevel = 0      -- Don't hide markups.
vim.opt.lazyredraw = false    -- redraw while executing macros (better UX)
vim.opt.redrawtime = 10000    -- Timeout for syntax highlighting redraw.
vim.opt.maxmempattern = 20000 -- Max memory for pattern matching
vim.opt.synmaxcol = 300       -- Syntax highlighting column list

-- File Handling
vim.opt.backup = false      -- Don't create backup files.
vim.opt.writebackup = false -- Don't backup before overwriting
vim.opt.swapfile = false    -- Don't create swap files
vim.opt.undofile = true     -- Enable persistent undo

-- Define and ensure undo directory exists
local undodir = vim.fn.expand("~/.local/share/nvim/undodir")

if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.undodir = undodir

vim.opt.updatetime = 300                     -- Time in ms to trigger CursorHold
vim.opt.timeoutlen = 500                     -- Time in ms to wait for keymaps,mapped sequences
vim.opt.ttimeoutlen = 0                      -- No wait for keycode sequences
vim.opt.autoread = true                      -- Autoreload file if changed from outside
vim.opt.autowrite = false                    -- Don't auto-save on some events
vim.opt.diffopt:append("vertical")           -- Vertical diff splits
vim.opt.diffopt:append("algorithm:patience") -- Better diff algorithms
vim.opt.diffopt:append("linematch:60")       -- Better diff highlighting (smart line matching)
vim.cmd("set iskeyword+=-")

-- Behaviour settings
vim.opt.errorbells = false             -- Disable error sounds
vim.opt.backspace = "indent,eol,start" -- Make backspace behave naturally
vim.opt.autochdir = false              -- Don't change directory automatically
vim.opt.fillchars = { eob = " " }      -- Removes the annoying tilda's "~"
vim.opt.path:append("**")              -- Seach into subfolders using 'gf'
vim.opt.selection = "inclusive"        -- Use inclusive selection
vim.opt.mouse = "a"                    -- Enable mouse support
vim.opt.modifiable = true              -- Allow editing buffers
vim.opt.encoding = "UTF-8"             -- Use UTF-8 encoding
vim.opt.wildmenu = true                -- Enable command line completion
vim.opt.wildmode = "longest:full:full" -- Completions modes for the command-line
vim.opt.wildignorecase = true          -- Case-insensitive tab completions in commands

-- -- Cursor settings
-- vim.opt.guicursor = {
-- 	"n-c-v:block-nCursor",
-- }

-- Folding Settings
vim.opt.foldmethod = "expr"                          -- Use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99                               -- Keep all folds open by default

-- Split Behaviour
vim.opt.splitbelow = true     -- Horizontal splits open below
vim.opt.splitright = true     -- Vertical splits open right

vim.opt.virtualedit = "block" -- Virtually select whitespaces in block mode
vim.opt.inccommand = "split"  -- Shows the find and replace in splits

-- VIM Autocommands

-- Restore cursor postion
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = last_cursor_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight on Yank for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})
