-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymap helper
local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

-- Navigation
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")

-- Window Navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

-- Window Resizing
map("n", "<C-Up>", "<cmd>resize +2<cr>", "Increase height")
map("n", "<C-Down>", "<cmd>resize -2<cr>", "Decrease height")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease width")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase width")

-- System Clipboard
map({ "n", "v" }, "<leader>y", '"+y', "Yank to system clipboard")
map("n", "<leader>Y", '"+Y', "Yank line to system clipboard")
map({ "n", "v" }, "<leader>p", '"+p', "Paste from system clipboard")

-- Misc
map("n", "<leader>w", "<cmd>w<cr>", "Save file")
map("n", "<leader>q", "<cmd>q<cr>", "Quit")
map("n", "<leader>Q", "<cmd>qa!<cr>", "Force quit all")

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		local map = vim.keymap.set

		-- LSP Navigation
		map("n", "<leader>ld", vim.lsp.buf.definition, opts)
		map("n", "<leader>li", vim.lsp.buf.implementation, opts)
		map("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
		map("n", "<leader>lr", vim.lsp.buf.references, opts)
		map("n", "<leader><leader>", vim.lsp.buf.hover, opts)

		-- Actions
		map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
		map("n", "<leader>ln", vim.lsp.buf.rename, opts)

		-- Formatting
		map("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		-- Diagnostics
		map("n", "<leader>le", function()
			vim.diagnostic.open_float({
				border = "single",
			})
		end, opts)
	end,
})
