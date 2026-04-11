-- Dependencies: fzf,fd,ripgrep,nodejs,npm,unzip,tar,curl,wget,git,tree-sitter-cli
-- sudo pacman -S fzf fd ripgrep nodejs npm unzip tar curl git tree-sitter-cli
-- Neovim >= 0.12
-- CORE ALIASES
local opt = vim.opt
local g = vim.g
local map = vim.keymap.set

-- LEADER KEYS
g.mapleader = " "
g.maplocalleader = " "

g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- UI OPTIONS
opt.termguicolors = true
opt.number = true
opt.signcolumn = "yes"
opt.winborder = "single"
opt.pumborder = "single"
opt.pumblend = 0
opt.pumheight = 10
opt.cursorline = true
opt.cursorlineopt = "number"
opt.scrolloff = 999
opt.sidescrolloff = 10

-- INDENT
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.virtualedit = "block"
opt.guicursor = "n-c-v:block-nCursor"

-- BEHAVIOR / PERFORMANCE
opt.updatetime = 200
opt.timeoutlen = 400
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.fillchars:append({ eob = " " })
opt.list = true
opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
	extends = ">",
	precedes = "<",
}

-- DIAGNOSTICS
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "single", source = "if_many" },
	signs = true,
	underline = true,
	update_in_insert = false,
})

local icons = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}

for type, icon in pairs(icons) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- KEYMAPS (GLOBAL)
local map_opts = { silent = true }
map("n", "-", "<cmd>Oil<cr>", vim.tbl_extend("force", map_opts, { desc = "Explorer" }))
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", map_opts)
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", map_opts)
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>", map_opts)
map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", map_opts)

-- PLUGINS
vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

-- MINI.NVIM
local mini_modules = {
	"basics",
	"icons",
	"pairs",
	"ai",
	"surround",
	"comment",
	"completion",
	"pick",
}

for _, mod in ipairs(mini_modules) do
	require("mini." .. mod).setup()
end

-- TREESITTER
local ts = require("nvim-treesitter")
local parsers = {
	"bash",
	"gitignore",
	"json",
	"toml",
	"yaml",
	"lua",
	"make",
	"markdown",
	"python",
	"vim",
	"vimdoc",
}
ts.install(parsers)
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		ts.update()
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr(vim.vlnum)"
			vim.treesitter.start()
		end
	end,
})

-- LSP
local lsp_group = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp_group,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr = ev.buf
		if not client then
			return
		end

		-- disable formatting
		if client:supports_method("textDocument/formatting") then
			client.server_capabilities = client.server_capabilities or {}
			client.server_capabilities.documentFormattingProvider = false
		end

		local function bufmap(mode, lhs, rhs, desc)
			map(mode, lhs, rhs, {
				buffer = bufnr,
				silent = true,
				desc = desc,
			})
		end

		bufmap("n", "gd", vim.lsp.buf.definition, "Definition")
		bufmap("n", "gD", vim.lsp.buf.declaration, "Declaration")
		bufmap("n", "gr", vim.lsp.buf.references, "References")
		bufmap("n", "gi", vim.lsp.buf.implementation, "Implementation")

		bufmap("n", "K", function()
			local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
			local diags = vim.diagnostic.get(bufnr, { lnum = lnum })

			if #diags > 0 then
				vim.diagnostic.open_float(nil, { border = "single" })
			else
				vim.lsp.buf.hover()
			end
		end, "Hover / Diagnostics")

		bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

		bufmap("n", "<leader>th", function()
			local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
			vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
		end, "Toggle Inlay Hints")

		-- document highlight
		if client:supports_method("textDocument/documentHighlight") then
			local hl = vim.api.nvim_create_augroup("LspHL_" .. bufnr, { clear = true })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = hl,
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd("CursorMoved", {
				group = hl,
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

-- MASON
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"emmylua_ls",
		"jsonls",
		"emmet_language_server",
		"html",
		"cssls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettierd",
		"prettier",
	},
	run_on_start = true,
})

-- CONFORM (FORMATTER)
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		css = { "prettierd", "prettier" },
	},

	format_on_save = function()
		return {
			timeout_ms = 800,
			lsp_format = "fallback",
		}
	end,
})

-- OIL
require("oil").setup({
	view_options = { show_hidden = true },
	keymaps = {
		["<esc><esc>"] = "actions.close",
	},
})

-- FZF
require("fzf-lua").setup({
	winopts = {
		border = "single",
		preview = {
			border = "single",
			scrollbar = false,
		},
	},
})

-- COLORS
require("vague").setup({
	transparent = true,
})

vim.cmd.colorscheme("vague")
