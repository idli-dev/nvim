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
		"emmet_language_server",
		"cssls",
		"vtsls",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		html = { "superhtml" },
		css = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

local k = vim.keymap.set

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "single",
		source = "if_many",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("User_Lsp_Attach", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		local map = function(lhs, rhs, desc)
			k("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		map("gd", vim.lsp.buf.definition, "Goto definition")
		map("gD", vim.lsp.buf.declaration, "Goto declaration")
		map("gr", vim.lsp.buf.references, "Goto references")
		map("gi", vim.lsp.buf.implementation, "Goto implementation")
		map("gt", vim.lsp.buf.type_definition, "Goto type definition")

		map("K", vim.lsp.buf.hover, "Hover")
		map("J", vim.diagnostic.open_float, "Line diagnostics")
		map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
		map("<leader>cr", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code action")

		if client and client:supports_method("textDocument/inlayHint") then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), {
					bufnr = bufnr,
				})
			end, "Toggle inlay hints")
		end

		if client and client:supports_method("textDocument/documentHighlight") then
			local highlight_group = vim.api.nvim_create_augroup("User_Lsp_Highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = highlight_group,
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = highlight_group,
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("User_Lsp_Detach", { clear = true }),
				buffer = bufnr,
				callback = function(ev)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({
						group = highlight_group,
						buffer = ev.buf,
					})
				end,
			})
		end
	end,
})
