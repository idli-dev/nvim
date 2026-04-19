local map = vim.keymap.set
local opts = { silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core navigation
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "H", "^", opts)
map("n", "L", "$", opts)

map({ "n", "v" }, "J", "5j", opts)
map({ "n", "v" }, "K", "5k", opts)

map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Better indenting in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up/down (visual + normal)
map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', opts)
map({ "n", "v" }, "<leader>p", '"+p', opts)
map({ "n", "v" }, "<leader>d", '"_d', opts)

-- Search improvements
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
