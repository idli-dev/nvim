local k = vim.keymap.set

k("n", "H", "^")
k("v", "H", "^")
k({ "n", "v" }, "L", "$")
k("n", "j", "gj")
k("n", "k", "gk")

k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("v", "<", "<gv")
k("v", ">", ">gv")
k("v", "<A-j>", ":m '>+1<CR>gv=gv")
k("v", "<A-k>", ":m '<-2<CR>gv=gv")
k("n", "<A-j>", ":m .+1<CR>==")
k("n", "<A-k>", ":m .-2<CR>==")

k({ "n", "v" }, "<leader>y", '"+y')
k({ "n", "v" }, "<leader>p", '"+p')

k("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
k("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
k("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
k("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

k("n", "<leader>cd", "<cmd>lcd %:p:h<CR>")
