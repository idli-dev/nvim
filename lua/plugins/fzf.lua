vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")
local map = vim.keymap.set

fzf.setup({
	winopts = {
		border = "single",
		preview = {
			hidden = "hidden",
		},
	},
	files = {
		cwd_prompt = true,
	},
	oldfiles = {
		cwd_only = true,
	},
	grep = {
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -e",
	},
})

fzf.register_ui_select()

map("n", "<leader>ff", function()
	fzf.files()
end)

map("n", "<leader>fn", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end)

map("n", "<leader>fg", function()
	fzf.live_grep()
end)

map("n", "<leader>fo", function()
	fzf.oldfiles()
end)

map("n", "<leader>fh", function()
	fzf.help_tags()
end)
