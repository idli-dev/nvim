vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("mason").setup()

require("mason-lspconfig").setup({
	automatic_enable = true,
	ensure_installed = {
		"emmylua_ls",
		"superhtml",
		-- add these if you actually want web dev support:
		-- "cssls",
		-- "ts_ls",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

local group = vim.api.nvim_create_augroup("User_Lsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(event)
		local opts = { buffer = event.buf }
		local map = vim.keymap.set

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "J", vim.diagnostic.open_float, opts)
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "gI", vim.lsp.buf.implementation, opts)
	end,
})
