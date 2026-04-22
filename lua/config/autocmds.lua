local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

-- ── HIGHLIGHT ON YANK ────────────────────────────────────────────────
au("TextYankPost", {
  group = ag("HighlightYank", { clear = true }),
  desc = "Flash highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

-- ── RESUME LAST CURSOR POSITION ──────────────────────────────────────
au("BufReadPost", {
  group = ag("RestoreCursor", { clear = true }),
  desc = "Go to last cursor position when reopening a file",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lines = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ── TRIM TRAILING WHITESPACE ─────────────────────────────────────────
au("BufWritePre", {
  group = ag("TrimWhitespace", { clear = true }),
  desc = "Remove trailing whitespace on save",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- ── CLOSE UTILITY WINDOWS WITH Q ─────────────────────────────────────
au("FileType", {
  group = ag("QuickClose", { clear = true }),
  desc = "Close utility windows with just q",
  pattern = { "help", "qf", "man", "checkhealth", "lspinfo", "notify" },
  callback = function(ev)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = ev.buf, silent = true })
  end,
})
