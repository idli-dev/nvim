return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig" },
		{
			"j-hui/fidget.nvim",
			opts = {
				window = { border = "single" },
			},
		},
	},
	opts = {
		servers = {
			lua_ls = {
				settings = {
					telemetry = { enabled = false },
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim", "require" },
						},
					},
				},
			},
		},
	},

	config = function(_, opts)
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				-- "ts_ls",
				-- "tailwindcss",
				"emmet_language_server",
			},
			automatic_enable = true,
		})

		for server, config in pairs(opts.servers) do
			vim.lsp.config(server, config)
		end

		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
		})
	end,
}
